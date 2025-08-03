from django.urls import path
from . import views

urlpatterns = [
    path('history/', views.order_history, name='order_history'),
    path('checkout/', views.checkout, name='checkout'),
    path('<int:order_id>/', views.order_detail, name='order_detail'),
    path('<int:order_id>/cancel/', views.cancel_order, name='cancel_order'),
    path('esewa-verify/', views.esewa_verify, name='esewa_verify'),
    path('esewa-failed/', views.esewa_failed, name='esewa_failed'),
]
