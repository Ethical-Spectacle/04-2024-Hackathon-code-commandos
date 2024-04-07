from . import views
from django.urls import path

urlpatterns = [
    path("get_routes/", views.get_routes, name='get_routes'),
    path("verify_otp/", views.verify_otp, name='verify'),
    path("get_otp/", views.get_otp, name='get_otp'),
]