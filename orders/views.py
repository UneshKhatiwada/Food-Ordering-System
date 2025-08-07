from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.conf import settings
from decimal import Decimal
import random
import string

from .models import Order, OrderItem
from cart.models import Cart

@login_required
def order_history(request):
    orders = Order.objects.filter(user=request.user).order_by('-created_at')
    return render(request, 'orders/order_history.html', {'orders': orders})

@login_required
def order_detail(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    delivery_fee = Decimal('5.00')
    total_with_delivery = order.total
    context = {
        'order': order,
        'delivery_fee': delivery_fee,
        'total_with_delivery': total_with_delivery
    }
    return render(request, 'orders/order_detail.html', context)

@login_required
def checkout(request):
    cart = get_object_or_404(Cart, user=request.user)
    cart_items = cart.items.all()
    
    if not cart_items:
        messages.warning(request, 'Your cart is empty!')
        return redirect('item_list')

    if request.method == 'POST':
        payment_method = request.POST.get('payment_method')
        order_number = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
        cart_total = sum(Decimal(item.get_total_price()) for item in cart_items)
        delivery_fee = Decimal('5.00')
        total_with_delivery = cart_total + delivery_fee

        order = Order.objects.create(
            user=request.user,
            order_number=order_number,
            shipping_address=request.POST.get('shipping_address'),
            phone=request.POST.get('phone'),
            notes=request.POST.get('notes', ''),
            payment_method=payment_method,
            total=total_with_delivery
        )

        for cart_item in cart_items:
            OrderItem.objects.create(
                order=order,
                food_item=cart_item.food_item,
                quantity=cart_item.quantity,
                price=cart_item.food_item.price
            )

        cart.items.all().delete()

        if payment_method == 'eSewa':
            success_url = request.build_absolute_uri(f'/orders/esewa-verify/?oid={order.id}')
            failure_url = request.build_absolute_uri('/orders/esewa-failed/')

            # Prepare form fields to post to eSewa
            form_fields = {
                'amt': f"{total_with_delivery:.2f}",
                'pdc': '0',
                'psc': '0',
                'txAmt': '0',
                'tAmt': f"{total_with_delivery:.2f}",
                'pid': order.order_number,
                'scd': settings.ESEWA_MERCHANT_CODE,
                'su': success_url,
                'fu': failure_url
            }

            context = {
                'form_action': settings.ESEWA_FORM_URL,
                'fields': form_fields,
                'order': order
            }
            return render(request, 'payments/esewa_request.html', context)

        messages.success(request, 'Your order has been placed successfully!')
        return redirect('order_detail', order.id)

    cart_total = sum(Decimal(item.get_total_price()) for item in cart_items)
    delivery_fee = Decimal('5.00')
    total_with_delivery = cart_total + delivery_fee

    context = {
        'cart_items': cart_items,
        'cart_total': cart_total,
        'delivery_fee': delivery_fee,
        'total_with_delivery': total_with_delivery
    }
    return render(request, 'orders/place_order.html', context)

@login_required
def esewa_verify(request):
    import xml.etree.ElementTree as ET
    import requests
    from django.contrib import messages

    oid = request.GET.get('oid')
    ref_id = request.GET.get('refId')

    order = get_object_or_404(Order, id=oid, user=request.user)

    data = {
        'amt': f"{order.total:.2f}",
        'scd': settings.ESEWA_MERCHANT_CODE,
        'pid': order.order_number,
        'rid': ref_id
    }

    try:
        response = requests.post(settings.ESEWA_VERIFY_URL, data=data, timeout=10)
        response.raise_for_status()

        root = ET.fromstring(response.content)
        response_code = root.find('responseCode')
        if response_code is not None and response_code.text.strip() == 'Success':
            order.status = 'Processing'
            order.is_payment_verified = True
            order.esewa_ref_id = ref_id
            order.save()
            messages.success(request, 'Payment verified and order placed successfully!')
        else:
            order.status = 'Cancelled'
            order.save()
            messages.error(request, 'Payment verification failed. Your order was cancelled.')
    except Exception as e:
        messages.error(request, f'Payment verification error: {str(e)}')
        order.status = 'Cancelled'
        order.save()

    return redirect('order_detail', order.id)

@login_required
def esewa_failed(request):
    messages.error(request, 'Payment failed or cancelled.')
    return redirect('order_history')

@login_required
def cancel_order(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    if order.status == 'Pending':
        order.status = 'Cancelled'
        order.save()
        messages.success(request, 'Your order has been cancelled.')
    else:
        messages.error(request, 'This order cannot be cancelled.')
    return redirect('order_detail', order.id)
