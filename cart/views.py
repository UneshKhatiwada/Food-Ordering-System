from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from decimal import Decimal
from menu.models import FoodItem
from .models import Cart, CartItem

@login_required
def cart_detail(request):
    cart, created = Cart.objects.get_or_create(user=request.user)
    cart_items = cart.items.all()
    
    # Calculate totals using Decimal consistently
    cart_total = cart.get_total() or Decimal('0.00')
    tax = cart.get_tax() or Decimal('0.00')
    delivery_fee = Decimal('5.00')  # Using Decimal for consistency
    grand_total = cart.get_grand_total() + delivery_fee
    
    context = {
        'cart': cart,
        'cart_items': cart_items,
        'cart_total': cart_total,
        'tax': tax,
        'delivery_fee': delivery_fee,
        'grand_total': grand_total
    }
    return render(request, 'cart/cart_detail.html', context)

@login_required
def add_to_cart(request, item_id):
    food_item = get_object_or_404(FoodItem, id=item_id)
    cart, created = Cart.objects.get_or_create(user=request.user)
    
    quantity = int(request.POST.get('quantity', 1))
    
    cart_item, created = CartItem.objects.get_or_create(
        cart=cart,
        food_item=food_item,
        defaults={'quantity': quantity}
    )
    
    if not created:
        cart_item.quantity += quantity
        cart_item.save()
    
    messages.success(request, f'{food_item.name} added to your cart!')
    return redirect('cart_detail')

@login_required
def update_cart(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    
    if request.method == 'POST':
        quantity = int(request.POST.get('quantity', 1))
        if quantity > 0:
            cart_item.quantity = quantity
            cart_item.save()
            messages.success(request, 'Cart updated successfully!')
        else:
            cart_item.delete()
            messages.success(request, 'Item removed from cart.')
    
    return redirect('cart_detail')

@login_required
def remove_from_cart(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    cart_item.delete()
    messages.success(request, 'Item removed from cart.')
    return redirect('cart_detail')