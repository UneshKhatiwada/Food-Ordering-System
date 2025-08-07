from django.shortcuts import render
from django.views.generic import TemplateView
from menu.models import FoodItem, Category
from orders.models import OrderItem
from .forms import ContactForm
from django.db.models import Count

class HomeView(TemplateView):
    template_name = 'main/home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        
        context['featured_categories'] = Category.objects.all()[:3]

      
        popular_items = FoodItem.objects.filter(is_available=True).annotate(
            order_count=Count('orderitem')  
        ).order_by('-order_count')

        user = self.request.user
        if user.is_authenticated:
            
            ordered_item_ids = OrderItem.objects.filter(order__user=user).values_list('food_item_id', flat=True)
            
            popular_items = popular_items.exclude(id__in=ordered_item_ids)

      
        popular_items = popular_items[:8]

        if not popular_items.exists():
            popular_items = FoodItem.objects.filter(is_available=True).order_by('-created_at')[:8]

        context['popular_items'] = popular_items
        context['form'] = ContactForm()
        return context

    def post(self, request, *args, **kwargs):
        form = ContactForm(request.POST)
        context = self.get_context_data()
        if form.is_valid():
            form.save()
            context['form'] = ContactForm()
            context['success'] = True
        else:
            context['form'] = form
        return self.render_to_response(context)
