from django.contrib import admin
from django.utils.html import format_html
from .models import Category, FoodItem

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'item_count', 'image_thumbnail')
    search_fields = ('name',)
    prepopulated_fields = {'slug': ('name',)}
    readonly_fields = ('image_preview',)

    def item_count(self, obj):
        return obj.fooditem_set.count()
    item_count.short_description = 'Items'

    def image_thumbnail(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="height:40px; border-radius:4px;" />', obj.image.url)
        return "No Image"
    image_thumbnail.short_description = 'Image'

    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="height:150px; border-radius:8px;" />', obj.image.url)
        return "No Image"
    image_preview.short_description = 'Image Preview'


@admin.register(FoodItem)
class FoodItemAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'price', 'food_type', 'is_available', 'image_thumbnail')
    list_filter = ('category', 'food_type', 'is_available')
    search_fields = ('name', 'description')
    prepopulated_fields = {'slug': ('name',)}
    raw_id_fields = ('category',)
    readonly_fields = ('image_preview',)

    def image_thumbnail(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="height:40px; border-radius:4px;" />', obj.image.url)
        return "No Image"
    image_thumbnail.short_description = 'Image'

    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="height:200px; border-radius:8px;" />', obj.image.url)
        return "No Image"
    image_preview.short_description = 'Image Preview'
