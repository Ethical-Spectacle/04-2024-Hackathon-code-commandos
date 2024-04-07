from django.shortcuts import render
import models

# Create your views here.


def get_routes(request):
    from_location = request.GET.get('from_location', None)
    to_location = request.GET.get('to_location', None)
    start_time = request.GET.get('start_time', None)
    end_time = request.GET.get('end_time', None)
    return models.get_routes(from_location,to_location,start_time,end_time)