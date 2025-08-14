from django.shortcuts import render
from django.views.generic import TemplateView
from menu.models import FoodItem, Category
from orders.models import OrderItem
from .forms import ContactForm

class HomeView(TemplateView):
    
    template_name = 'main/home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        context['featured_categories'] = Category.objects.all()[:3]

        # Fetch all available food items
        available_items = FoodItem.objects.filter(is_available=True)

        # Fetch all OrderItems related to available food items
        order_items = OrderItem.objects.filter(food_item__in=available_items)

        # Create a list of food_item IDs from order items
        ordered_item_ids_list = list(order_items.values_list('food_item_id', flat=True))

        # Count frequency of each food item using a Python dictionary
        frequency = {}
        for item_id in ordered_item_ids_list:
            frequency[item_id] = frequency.get(item_id, 0) + 1

        # Sort the items by frequency descending (popular first)
        sorted_items = sorted(frequency.items(), key=lambda x: x[1], reverse=True)

        # Extract sorted food item IDs
        sorted_item_ids = [item_id for item_id, count in sorted_items]

        user = self.request.user
        if user.is_authenticated:
            # Get list of food items the user already ordered
            user_ordered_item_ids = set(OrderItem.objects.filter(order__user=user).values_list('food_item_id', flat=True))
            # Exclude items user already ordered
            sorted_item_ids = [item_id for item_id in sorted_item_ids if item_id not in user_ordered_item_ids]

        # Get FoodItem objects for sorted and filtered IDs, preserving order
        popular_items = []
        id_to_item = {item.id: item for item in available_items}
        for item_id in sorted_item_ids:
            item = id_to_item.get(item_id)
            if item:
                popular_items.append(item)
            # Removed the break to allow collecting more than 8 if possible

        # Fill with newest items if less than 8 popular items
        if len(popular_items) < 8:
            needed = 8 - len(popular_items)
            excluded_ids = set(item.id for item in popular_items)
            newest_items = available_items.exclude(id__in=excluded_ids).order_by('-created_at')[:needed]
            popular_items.extend(newest_items)

        context['popular_items'] = popular_items[:8]  # Ensure max 8 items
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
