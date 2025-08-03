from django.shortcuts import render
from django.views.generic import TemplateView
from menu.models import FoodItem, Category
from .forms import ContactForm

class HomeView(TemplateView):
    template_name = 'main/home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['featured_categories'] = Category.objects.all()[:3]
        context['popular_items'] = FoodItem.objects.filter(is_available=True).order_by('-created_at')[:8]
        return context

def about(request):
    return render(request, 'main/about.html')

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save() 
            return render(request, 'main/contact.html', {'form': ContactForm(), 'success': True})
    else:
        form = ContactForm()

    return render(request, 'main/contact.html', {'form': form})
