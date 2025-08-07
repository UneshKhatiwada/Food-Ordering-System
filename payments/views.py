import requests
import xml.etree.ElementTree as ET
import logging
import hmac
import hashlib
import base64

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.urls import reverse
from django.http import HttpResponse
from django.conf import settings

from .models import Payment
from orders.models import Order

logger = logging.getLogger(__name__)

# ---------- Stripe Integration ----------
@login_required
def stripe_payment(request, order_id):
    import stripe

    order = get_object_or_404(Order, id=order_id, user=request.user)

    if request.method == 'POST':
        payment_method_id = request.POST.get('payment_method_id')
        stripe.api_key = settings.STRIPE_SECRET_KEY

        try:
            payment_intent = stripe.PaymentIntent.create(
                amount=int(order.total * 100),
                currency='usd',
                payment_method=payment_method_id,
                confirmation_method='manual',
                confirm=True,
            )
            Payment.objects.create(
                order=order,
                transaction_id=payment_intent.id,
                amount=order.total,
                status='Completed',
                payment_method='Stripe'
            )
            order.status = 'Processing'
            order.save()
            return redirect('payment_success', order.id)

        except stripe.error.CardError as e:
            logger.error(f"Stripe CardError: {e}")
            return render(request, 'payments/payment_failed.html', {'error_message': str(e), 'order': order})

        except Exception as e:
            logger.error(f"Stripe Payment error: {e}")
            return render(request, 'payments/payment_failed.html', {
                'error_message': 'Payment service is currently unavailable.',
                'order': order
            })

    return render(request, 'payments/payment_form.html', {
        'order': order,
        'STRIPE_PUBLIC_KEY': settings.STRIPE_PUBLIC_KEY
    })


# ---------- eSewa Integration ----------
@login_required
def esewa_request(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)

    total_amount = f"{order.total:.2f}"
    merchant_code = 'EPAYTEST'  # Use your production code later

    esewa_payment_url = 'https://rc-epay.esewa.com.np/api/epay/main/v2/form'
    success_url = request.build_absolute_uri(reverse('esewa_verify')) + f"?o={order.id}"
    failure_url = request.build_absolute_uri(reverse('payment_failed', args=[order.id]))

    fields = {
        'amt': total_amount,
        'pdc': 0,
        'psc': 0,
        'txAmt': 0,
        'tAmt': total_amount,
        'pid': str(order.id),
        'scd': merchant_code,
        'su': success_url,
        'fu': failure_url,
    }

    return render(request, 'payments/esewa_request.html', {
        'esewa_payment_url': esewa_payment_url,
        'fields': fields
    })



@csrf_exempt
def esewa_verify(request):
    oid = request.GET.get('o')
    refId = request.GET.get('refId')

    if not oid or not refId:
        logger.error(f"Missing parameters in eSewa verify: o={oid}, refId={refId}")
        return HttpResponse("Invalid request parameters", status=400)

    order = get_object_or_404(Order, id=oid)

    verification_url = "https://rc.esewa.com.np/api/epay/transaction"
    data = {
        'amt': f"{order.total:.2f}",
        'scd': 'EPAYTEST',
        'pid': str(order.id),
        'rid': refId,
    }

    try:
        resp = requests.post(verification_url, data=data, timeout=10)
        resp.raise_for_status()
        root = ET.fromstring(resp.content)

        if root.find('responseCode') is not None and root.find('responseCode').text.strip() == 'Success':
            Payment.objects.get_or_create(
                order=order,
                transaction_id=refId,
                defaults={
                    'amount': order.total,
                    'status': 'Completed',
                    'payment_method': 'eSewa',
                }
            )
            order.status = 'Processing'
            order.save()
            return redirect('payment_success', order.id)
        else:
            logger.warning(f"eSewa payment verification failed for order {order.id}, refId {refId}")
            return redirect('payment_failed', order.id)

    except requests.exceptions.Timeout:
        logger.error(f"Timeout during eSewa payment verification for order {order.id}")
        return HttpResponse("Payment verification timed out. Please try again.", status=503)

    except requests.exceptions.RequestException as e:
        logger.error(f"eSewa RequestException: {e}")
        return HttpResponse("Payment verification failed. Try later.", status=503)

    except ET.ParseError as e:
        logger.error(f"XML Parse error: {e}")
        return HttpResponse("Invalid response from payment gateway.", status=502)

    except Exception as e:
        logger.error(f"Unexpected error: {e}")
        return HttpResponse("Something went wrong during payment verification.", status=500)


# ---------- Success and Failure Pages ----------
def payment_success(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    return render(request, 'payments/payment_success.html', {'order': order})


def payment_failed(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    error_message = request.GET.get('msg', 'We couldn’t process your payment.')
    return render(request, 'payments/payment_failed.html', {
        'order': order,
        'error_message': error_message
    })
