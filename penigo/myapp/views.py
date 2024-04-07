from django.shortcuts import render
from myapp import otp_service
from django.views.decorators.csrf import csrf_exempt
import json

# Create your views here.


def get_routes(request):
    from_location = request.GET.get('from_location', None)
    to_location = request.GET.get('to_location', None)
    start_time = request.GET.get('start_time', None)
    end_time = request.GET.get('end_time', None)
    return models.get_routes(from_location,to_location,start_time,end_time)


@csrf_exempt
def verify_otp(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        return otp_service.Otp_service.verify_otp(payload=data)

@csrf_exempt
def get_otp(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        return otp_service.Otp_service.get_otp(payload=data)
