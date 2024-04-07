from django.db import models

# Create your models here.
class OTP(models.Model):
    mobile_number = models.CharField(primary_key=True, max_length=20)
    otp = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    expiry_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'otp_api_otp'

    
