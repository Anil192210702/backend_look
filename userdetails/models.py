from django.db import models
from django.contrib.auth.models import User

class FamilyConnection(models.Model):
    admin = models.ForeignKey(User, on_delete=models.CASCADE, related_name='admin_connections')
    child = models.ForeignKey(User, on_delete=models.CASCADE, related_name='child_connections', null=True, blank=True)
    unique_id = models.CharField(max_length=100, unique=True)
    device_name = models.CharField(max_length=100, default='Unknown Device')
    battery_level = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)

class NotificationEvent(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notifications')
    app_source = models.CharField(max_length=50) # whatsapp, instagram, call, message
    sender = models.CharField(max_length=255)
    message_content = models.TextField()
    timestamp = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    full_name = models.CharField(max_length=150, default="", blank=True)
    phone_number = models.CharField(max_length=20, default="", blank=True)
    profile_image_base64 = models.TextField(blank=True, null=True)

