from django import forms
from .models import FoodItem, Category

class FoodItemForm(forms.ModelForm):
    class Meta:
        model = FoodItem
        fields = ['name', 'category', 'description', 'price', 'image', 'is_available']

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name']
