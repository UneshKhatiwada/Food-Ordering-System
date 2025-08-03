from django.urls import path
from . import views

urlpatterns = [
    path('', views.FoodItemListView.as_view(), name='item_list'),
    path('categories/', views.CategoryListView.as_view(), name='category_list'),
    path('<slug:slug>/', views.FoodItemDetailView.as_view(), name='item_detail'),
]