from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import user_passes_test
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from orders.models import Order, OrderItem
from menu.models import FoodItem, Category
from users.models import Profile
from users.forms import UserRegisterForm, UserUpdateForm, ProfileUpdateForm
from menu.forms import FoodItemForm, CategoryForm
from django.db.models import Count, Sum, Q
from django.utils import timezone
from datetime import timedelta

def is_admin(user):
    return user.is_superuser

# Dashboard Views
@user_passes_test(is_admin)
def admin_dashboard(request):
    # Basic stats
    stats = {
        'total_users': User.objects.count(),
        'total_orders': Order.objects.count(),
        'total_items': FoodItem.objects.count(),
        'total_revenue': Order.objects.aggregate(total=Sum('total'))['total'] or 0,
        'recent_orders': Order.objects.order_by('-created_at')[:5],
        'status_counts': {
            'Pending': Order.objects.filter(status='Pending').count(),
            'Processing': Order.objects.filter(status='Processing').count(),
            'Shipped': Order.objects.filter(status='Shipped').count(),
            'Delivered': Order.objects.filter(status='Delivered').count(),
            'Cancelled': Order.objects.filter(status='Cancelled').count(),
        }
    }
    
    # Monthly revenue data for chart
    months = []
    revenue = []
    for i in range(5, -1, -1):
        month = timezone.now() - timedelta(days=30*i)
        months.append(month.strftime('%b %Y'))
        month_revenue = Order.objects.filter(
            created_at__month=month.month,
            created_at__year=month.year
        ).aggregate(total=Sum('total'))['total'] or 0
        revenue.append(float(month_revenue))
    
    return render(request, 'admin_panel/dashboard.html', {
        **stats,
        'monthly_labels': months,
        'monthly_revenue': revenue
    })

# User Management Views
@user_passes_test(is_admin)
def admin_users(request):
    users = User.objects.all().order_by('-date_joined')
    
    # Filtering
    filter_type = request.GET.get('filter')
    if filter_type == 'active':
        users = users.filter(is_active=True)
    elif filter_type == 'staff':
        users = users.filter(is_staff=True)
    elif filter_type == 'inactive':
        users = users.filter(is_active=False)
    
    # Search
    search_query = request.GET.get('q')
    if search_query:
        users = users.filter(
            Q(username__icontains=search_query) |
            Q(email__icontains=search_query) |
            Q(first_name__icontains=search_query) |
            Q(last_name__icontains=search_query)
        )
    
    return render(request, 'admin_panel/user_management.html', {'users': users})

@user_passes_test(is_admin)
def admin_user_add(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.is_staff = True  # Make staff by default when adding via admin
            user.save()
            messages.success(request, f'User {user.username} created successfully!')
            return redirect('admin_users')
    else:
        form = UserRegisterForm()
    return render(request, 'admin_panel/user_add.html', {'form': form})

@user_passes_test(is_admin)
def admin_user_edit(request, user_id):
    user = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=user)
        p_form = ProfileUpdateForm(request.POST, request.FILES, instance=user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'User {user.username} updated successfully!')
            return redirect('admin_users')
    else:
        u_form = UserUpdateForm(instance=user)
        p_form = ProfileUpdateForm(instance=user.profile)
    return render(request, 'admin_panel/user_edit.html', {
        'u_form': u_form,
        'p_form': p_form,
        'user': user
    })

@user_passes_test(is_admin)
def admin_user_activate(request, user_id):
    user = get_object_or_404(User, id=user_id)
    user.is_active = True
    user.save()
    messages.success(request, f'User {user.username} activated successfully!')
    return redirect('admin_users')

@user_passes_test(is_admin)
def admin_user_deactivate(request, user_id):
    user = get_object_or_404(User, id=user_id)
    if user == request.user:
        messages.error(request, 'You cannot deactivate your own account!')
    else:
        user.is_active = False
        user.save()
        messages.success(request, f'User {user.username} deactivated successfully!')
    return redirect('admin_users')

# Order Management Views
@user_passes_test(is_admin)
def admin_orders(request):
    orders = Order.objects.all().order_by('-created_at')
    
    # Filter by status
    status = request.GET.get('status')
    if status:
        orders = orders.filter(status=status)
    
    # Filter by order number
    order_number = request.GET.get('order_number')
    if order_number:
        orders = orders.filter(order_number__icontains=order_number)
    
    # Filter by date
    date = request.GET.get('date')
    if date:
        orders = orders.filter(created_at__date=date)
    
    return render(request, 'admin_panel/order_management.html', {'orders': orders})

@user_passes_test(is_admin)
def admin_order_detail(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    return render(request, 'admin_panel/order_detail.html', {'order': order})

@user_passes_test(is_admin)
def admin_update_order_status(request, order_id):
    if request.method == 'POST':
        order = get_object_or_404(Order, id=order_id)
        new_status = request.POST.get('status')
        order.status = new_status
        order.save()
        messages.success(request, f'Order #{order.order_number} status updated to {new_status}.')
    return redirect('admin_orders')

@user_passes_test(is_admin)
def admin_delete_order(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    if request.method == 'POST':
        order_number = order.order_number
        order.delete()
        messages.success(request, f'Order #{order_number} deleted successfully!')
        return redirect('admin_orders')
    return render(request, 'admin_panel/order_confirm_delete.html', {'order': order})

# Menu Management Views
@user_passes_test(is_admin)
def admin_menu_items(request):
    items = FoodItem.objects.all().order_by('-created_at')
    
    # Search functionality
    search_query = request.GET.get('q')
    if search_query:
        items = items.filter(
            Q(name__icontains=search_query) |
            Q(description__icontains=search_query)
        )
    
    return render(request, 'admin_panel/menu_management.html', {'items': items})

@user_passes_test(is_admin)
def admin_add_menu_item(request):
    if request.method == 'POST':
        form = FoodItemForm(request.POST, request.FILES)
        if form.is_valid():
            item = form.save()
            messages.success(request, f'Menu item "{item.name}" added successfully!')
            return redirect('admin_menu')
    else:
        form = FoodItemForm()
    return render(request, 'admin_panel/menu_item_form.html', {'form': form, 'action': 'Add'})

@user_passes_test(is_admin)
def admin_edit_menu_item(request, item_id):
    item = get_object_or_404(FoodItem, id=item_id)
    if request.method == 'POST':
        form = FoodItemForm(request.POST, request.FILES, instance=item)
        if form.is_valid():
            form.save()
            messages.success(request, f'Menu item "{item.name}" updated successfully!')
            return redirect('admin_menu')
    else:
        form = FoodItemForm(instance=item)
    return render(request, 'admin_panel/menu_item_form.html', {
        'form': form,
        'action': 'Edit',
        'item': item
    })

@user_passes_test(is_admin)
def admin_delete_menu_item(request, item_id):
    item = get_object_or_404(FoodItem, id=item_id)
    if request.method == 'POST':
        item_name = item.name
        item.delete()
        messages.success(request, f'Menu item "{item_name}" deleted successfully!')
        return redirect('admin_menu')
    return render(request, 'admin_panel/menu_item_confirm_delete.html', {'item': item})

# Category Management Views
@user_passes_test(is_admin)
def admin_categories(request):
    categories = Category.objects.annotate(item_count=Count('fooditem'))
    return render(request, 'admin_panel/category_management.html', {'categories': categories})

@user_passes_test(is_admin)
def admin_add_category(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES)
        if form.is_valid():
            category = form.save()
            messages.success(request, f'Category "{category.name}" added successfully!')
            return redirect('admin_categories')  # Redirect to category list page
    else:
        form = CategoryForm()
    return render(request, 'admin_panel/category_form.html', {'form': form, 'action': 'Add'})

@user_passes_test(is_admin)
def admin_edit_category(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES, instance=category)
        if form.is_valid():
            form.save()
            messages.success(request, f'Category "{category.name}" updated successfully!')
            return redirect('admin_categories')  # Redirect to category list page
    else:
        form = CategoryForm(instance=category)
    return render(request, 'admin_panel/category_form.html', {
        'form': form,
        'action': 'Edit',
        'category': category
    })

@user_passes_test(is_admin)
def admin_delete_category(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    if request.method == 'POST':
        category_name = category.name
        category.delete()
        messages.success(request, f'Category "{category_name}" deleted successfully!')
        return redirect('admin_categories')  # Redirect to category list page
    return render(request, 'admin_panel/category_confirm_delete.html', {'category': category})
