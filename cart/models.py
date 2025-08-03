from django.db import models
from django.conf import settings
from menu.models import FoodItem
from decimal import Decimal

class Cart(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'Cart #{self.id} - {self.user.username}'

    def get_total(self):
        return sum(item.get_total_price() for item in self.items.all())

    def get_tax(self):
        return self.get_total() * Decimal('0.10')

    def get_grand_total(self):
        return self.get_total() + self.get_tax()

class CartItem(models.Model):
    cart = models.ForeignKey(Cart, related_name='items', on_delete=models.CASCADE)
    food_item = models.ForeignKey(FoodItem, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f'{self.quantity} x {self.food_item.name}'

    def get_total_price(self):
        return self.quantity * self.food_item.price
