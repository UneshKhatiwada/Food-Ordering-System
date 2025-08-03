from django.contrib import admin
from .models import Cart, CartItem

class CartItemInline(admin.TabularInline):
    model = CartItem
    raw_id_fields = ('food_item',)

@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'created_at', 'updated_at', 'item_count', 'total_price')
    list_filter = ('created_at', 'updated_at')
    search_fields = ('user__username',)
    inlines = (CartItemInline,)
    
    def item_count(self, obj):
        return obj.items.count()
    item_count.short_description = 'Items'
    
    def total_price(self, obj):
        return sum(item.get_total_price() for item in obj.items.all())
    total_price.short_description = 'Total'

@admin.register(CartItem)
class CartItemAdmin(admin.ModelAdmin):
    list_display = ('id', 'cart', 'food_item', 'quantity', 'get_total_price')
    list_filter = ('cart__user',)
    search_fields = ('food_item__name',)
    
    def get_total_price(self, obj):
        return obj.get_total_price()
    get_total_price.short_description = 'Total Price'