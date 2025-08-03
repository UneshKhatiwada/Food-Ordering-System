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

from .models import Payment
from orders.models import Order

logger = logging.getLogger(__name__)

def generate_signature(fields: dict, secret_key: str) -> str:
    signed_field_names = fields['signed_field_names'].split(',')
    data_to_sign = ",".join([f"{field}={fields[field]}" for field in signed_field_names])
    digest = hmac.new(secret_key.encode(), data_to_sign.encode(), hashlib.sha256).digest()
    return base64.b64encode(digest).decode()

@login_required
def stripe_payment(request, order_id):
    from django.conf import settings
    order = get_object_or_404(Order, id=order_id, user=request.user)

    if request.method == 'POST':
        payment_method_id = request.POST.get('payment_method_id')
        import stripe
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
            return render(request, 'payments/payment_failed.html', {'error_message': 'Payment service is currently unavailable. Please try again later.', 'order': order})

    return render(request, 'payments/payment_form.html', {
        'order': order,
        'STRIPE_PUBLIC_KEY': settings.STRIPE_PUBLIC_KEY
    })

@login_required
def esewa_request(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)

    # eSewa sandbox merchant code (always 'EPAYTEST' for sandbox)
    merchant_code = 'EPAYTEST' 

    total_amount = f"{order.total:.2f}"

    success_url = request.build_absolute_uri(reverse('esewa_verify')) + f"?o={order.id}"
    failure_url = request.build_absolute_uri(reverse('payment_failed', args=[order.id]))

    # Redirect URL for eSewa sandbox payment page
    esewa_payment_url = (
        f"https://esewa.com.np/epay/main?"
        f"amt={total_amount}&pdc=0&psc=0&txAmt=0&tAmt={total_amount}"
        f"&pid={order.id}&scd={merchant_code}&su={success_url}&fu={failure_url}"
    )

    context = {
        'order': order,
        'esewa_payment_url': esewa_payment_url
    }
    return render(request, 'payments/esewa_request.html', context)

@csrf_exempt
def esewa_verify(request):
    oid = request.GET.get('o')
    refId = request.GET.get('refId')

    if not oid or not refId:
        logger.error(f"Missing parameters in eSewa verify: o={oid}, refId={refId}")
        return HttpResponse("Invalid request parameters", status=400)

    order = get_object_or_404(Order, id=oid)

    # eSewa sandbox verification API URL
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

        # Check if the verification response is successful
        if root.find('responseCode') is not None and root.find('responseCode').text.strip() == 'Success':
            payment, created = Payment.objects.get_or_create(
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
        return HttpResponse("Payment verification service timed out. Please try again later.", status=503)
    except requests.exceptions.RequestException as e:
        logger.error(f"RequestException during eSewa payment verification: {e}")
        return HttpResponse("Payment verification service unavailable. Please try again later.", status=503)
    except ET.ParseError as e:
        logger.error(f"XML parsing error during eSewa payment verification: {e}")
        return HttpResponse("Invalid response from payment gateway.", status=502)
    except Exception as e:
        logger.error(f"Unexpected error during eSewa payment verification: {e}")
        return HttpResponse("An error occurred during payment verification.", status=500)


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
