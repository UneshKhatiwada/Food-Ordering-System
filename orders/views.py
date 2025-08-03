from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from decimal import Decimal  
import random
import string
import requests

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

            # Redirect to eSewa payment page with sandbox merchant code EPAYTEST
            esewa_url = (
                f"https://esewa.com.np/epay/main?"
                f"amt={total_with_delivery}&pdc=0&psc=0&txAmt=0&tAmt={total_with_delivery}"
                f"&pid={order.order_number}&scd=EPAYTEST&su={success_url}&fu={failure_url}"
            )
            return redirect(esewa_url)

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
    import json

    oid = request.GET.get('oid')
    ref_id = request.GET.get('refId')

    order = get_object_or_404(Order, id=oid, user=request.user)

    data = {
        'amt': str(order.total),
        'scd': 'EPAYTEST',  # Sandbox merchant code
        'pid': order.order_number,
        'rid': ref_id
    }

    try:
        response = requests.post('https://rc.esewa.com.np/api/epay/transaction', data=data, timeout=10)
        response.raise_for_status()

        resp_json = response.json()

        if resp_json.get('status') == 'Success':
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
