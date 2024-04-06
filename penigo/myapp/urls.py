from . import views
from django.urls import path

urlpatterns = [
    path("get_routes/", views.get_routes, name='get_routes'),
]