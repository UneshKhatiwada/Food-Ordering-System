from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView, DetailView
from .models import Category, FoodItem
from django.db.models import Q

class FoodItemListView(ListView):
    model = FoodItem
    template_name = 'menu/item_list.html'
    context_object_name = 'food_items'
    paginate_by = 12
    
    def get_queryset(self):
        queryset = super().get_queryset().filter(is_available=True)
        
        search_query = self.request.GET.get('q')
        if search_query:
            queryset = queryset.filter(
                Q(name__icontains=search_query) |
                Q(description__icontains=search_query)
            )
        
        category_slug = self.request.GET.get('category')
        if category_slug:
            queryset = queryset.filter(category__slug=category_slug)
        
        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.all()
        return context

class FoodItemDetailView(DetailView):
    model = FoodItem
    template_name = 'menu/item_detail.html'
    context_object_name = 'food_item'
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['related_items'] = FoodItem.objects.filter(
            category=self.object.category,
            is_available=True
        ).exclude(id=self.object.id)[:4]
        return context

class CategoryListView(ListView):
    model = Category
    template_name = 'menu/category_list.html'
    context_object_name = 'categories'
