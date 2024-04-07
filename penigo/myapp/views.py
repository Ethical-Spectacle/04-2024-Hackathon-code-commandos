from django.shortcuts import render
from myapp import otp_service
from django.views.decorators.csrf import csrf_exempt
import json
from django.views.decorators.csrf import csrf_exempt

from myapp import route_service


# Create your views here.


@csrf_exempt
def get_routes(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        return route_service.get_routes(data.get('from_latitude', None), data.get('from_longitude', None)
                                        , data.get('to_latitude', None)
                                        , data.get('to_longitude', None))



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
