from django.contrib import admin
from .models import Payment

@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ('id', 'order', 'transaction_id', 'amount', 'status', 'payment_method', 'created_at')
    list_filter = ('status', 'payment_method', 'created_at')
    search_fields = ('transaction_id', 'order__order_number')
    readonly_fields = ('created_at',)
    
    fieldsets = (
        (None, {'fields': ('order', 'transaction_id')}),
        ('Payment Details', {'fields': ('amount', 'status', 'payment_method')}),
        ('Timestamps', {'fields': ('created_at',)}),
    )