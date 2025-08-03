from django.urls import path
from . import views

urlpatterns = [
    path('', views.admin_dashboard, name='admin_dashboard'),
    path('users/', views.admin_users, name='admin_users'),
    path('users/add/', views.admin_user_add, name='admin_user_add'),
    path('users/<int:user_id>/edit/', views.admin_user_edit, name='admin_user_edit'),
    path('users/<int:user_id>/activate/', views.admin_user_activate, name='admin_user_activate'),
    path('users/<int:user_id>/deactivate/', views.admin_user_deactivate, name='admin_user_deactivate'),
    
    path('orders/', views.admin_orders, name='admin_orders'),
    path('orders/<int:order_id>/', views.admin_order_detail, name='admin_order_detail'),
    path('orders/<int:order_id>/update-status/', views.admin_update_order_status, name='admin_update_order_status'),
    path('orders/<int:order_id>/delete/', views.admin_delete_order, name='admin_delete_order'),
    
    path('menu/', views.admin_menu_items, name='admin_menu'),
    path('menu/add/', views.admin_add_menu_item, name='admin_add_menu_item'),
    path('menu/<int:item_id>/edit/', views.admin_edit_menu_item, name='admin_edit_menu_item'),
    path('menu/<int:item_id>/delete/', views.admin_delete_menu_item, name='admin_delete_menu_item'),
    
    path('categories/', views.admin_categories, name='admin_categories'),
    path('categories/add/', views.admin_add_category, name='admin_add_category'),
    path('categories/<int:category_id>/edit/', views.admin_edit_category, name='admin_edit_category'),
    path('categories/<int:category_id>/delete/', views.admin_delete_category, name='admin_delete_category'),
]