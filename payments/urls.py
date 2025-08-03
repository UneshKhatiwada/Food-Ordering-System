from django.urls import path
from . import views

urlpatterns = [
    path('stripe/<int:order_id>/', views.stripe_payment, name='stripe_payment'),
    path('esewa-request/<int:order_id>/', views.esewa_request, name='esewa_request'),
    path('esewa-verify/', views.esewa_verify, name='esewa_verify'),
    path('success/<int:order_id>/', views.payment_success, name='payment_success'),
    path('failed/<int:order_id>/', views.payment_failed, name='payment_failed'),
]
