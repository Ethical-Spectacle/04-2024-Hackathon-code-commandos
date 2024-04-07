# Import necessary modules
from myapp.models import OTP
import time
import random, string
from myapp.responses import success, bad_request, internal_server_error
from django.utils import timezone

class Otp_service:
    @staticmethod
    def get_otp(payload):

        phone = payload.get('phone','')
        otp = ''.join(random.choices(string.digits, k=6))
        expiry_time = timezone.now() + timezone.timedelta(minutes=5)
        
        try:
            otp_obj = OTP.objects.get(mobile_number=phone)
            otp_obj.otp = int(otp)
            otp_obj.created_at = timezone.now()
            otp_obj.expiry_time = expiry_time
            otp_obj.save()
        except OTP.DoesNotExist:
            otp_obj = OTP.objects.create(mobile_number=phone, otp=otp, created_at=timezone.now(), expiry_time=expiry_time)
        print(otp_obj.otp)
        return success()

    @staticmethod
    def verify_otp(payload):
        try:
            phone = payload.get('phone', '')
            otp = payload.get('otp', '')
            otp_obj = OTP.objects.get(mobile_number=phone)
            if otp_obj.otp == otp:
                current_time = int(time.time())
                expiry_time = int(otp_obj.expiry_time.timestamp())
                if current_time <= expiry_time:
                    return success()
                else:
                    return bad_request('OTP expired')
            else:
                return bad_request('No OTP match')
        except OTP.DoesNotExist:
            return internal_server_error()
