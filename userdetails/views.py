import json
import uuid
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from .models import FamilyConnection, NotificationEvent

@csrf_exempt
def signup(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username = data.get("username")
            email = data.get("email", "")
            password = data.get("password")
            
            if not username or not password:
                return JsonResponse({"error": "Username and password are required"}, status=400)
                
            if User.objects.filter(username=username).exists():
                return JsonResponse({"error": "Username already exists"}, status=400)
            
            phone = data.get("phone", "")
            name = data.get("name", "")
            user = User.objects.create_user(username=username, email=email, password=password)
            user.first_name = phone
            user.save()
            
            from userdetails.models import UserProfile
            UserProfile.objects.create(
                user=user, 
                full_name=name, 
                phone_number=phone
            )
            return JsonResponse({"message": "User created successfully", "status": "success"}, status=201)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST requests are allowed"}, status=405)

@csrf_exempt
def signin(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username_or_email = data.get("username")
            password = data.get("password")
            
            # Check if they are trying to log in via Email
            user_obj = User.objects.filter(email=username_or_email).first()
            if user_obj:
                user = authenticate(username=user_obj.username, password=password)
            else:
                user = authenticate(username=username_or_email, password=password)
                
            if user is not None:
                return JsonResponse({"message": "Login successful", "status": "success", "token": "dummy-token-777"}, status=200)
            else:
                return JsonResponse({"error": "Invalid credentials", "status": "error"}, status=401)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST requests are allowed"}, status=405)


@csrf_exempt
def pair_device(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            child_username = data.get("username", "").strip()
            unique_id = data.get("unique_id", "").strip().upper()
            
            # Allow fallback to email
            child_user = User.objects.filter(email=child_username).first()
            if not child_user:
                child_user = User.objects.filter(username=child_username).first()
                
            if not child_user:
                child_user = User.objects.create_user(username=child_username, password="password")
            
            connection = FamilyConnection.objects.filter(unique_id=unique_id, child__isnull=True).first()
            if not connection:
                return JsonResponse({"error": "Invalid User or ID already used"}, status=400)
                
            connection.child = child_user
            connection.save()
            return JsonResponse({
                "message": "Device paired successfully",
                "admin_username": connection.admin.username,
                "bond": "Admin"
            }, status=200)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def get_paired_admin(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            child_username = data.get("username", "").strip()
            
            child_user = User.objects.filter(email=child_username).first()
            if not child_user:
                child_user = User.objects.filter(username=child_username).first()
                
            if not child_user:
                return JsonResponse({"error": "User not found"}, status=404)
                
            connection = FamilyConnection.objects.filter(child=child_user).first()
            if connection:
                return JsonResponse({
                    "admin_username": connection.admin.username,
                    "bond": "Admin"
                }, status=200)
            else:
                return JsonResponse({"error": "No connections"}, status=404)
                
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def upload_notification(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username = data.get("username")
            user = User.objects.filter(email=username).first()
            if not user:
                user = User.objects.filter(username=username).first()
            if user:
                NotificationEvent.objects.create(
                    user=user, 
                    app_source=data.get("app_source", "General"),
                    sender=data.get("sender", "Unknown"),
                    message_content=data.get("message_content", ""),
                    timestamp=data.get("timestamp", "")
                )
                return JsonResponse({"message": "Uploaded successfully"}, status=201)
            return JsonResponse({"error": "User not found"}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def get_user_alerts(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username = data.get("username")
            user = User.objects.filter(email=username).first()
            if not user:
                user = User.objects.filter(username=username).first()
            
            if user:
                # We specifically funnel alerts built by Admin systems
                notifications = NotificationEvent.objects.filter(user=user, app_source="AdminAlert").values(
                    'id', 'app_source', 'sender', 'message_content', 'timestamp'
                )
                return JsonResponse({"notifications": list(notifications)}, status=200)
            return JsonResponse({"error": "User not found"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST"}, status=405)

@csrf_exempt
def update_device_meta(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username = data.get("username")
            device_name = data.get("device_name", "Unknown Device")
            battery_level = int(data.get("battery_level", 0))
            
            user = User.objects.filter(email=username).first()
            if not user:
                user = User.objects.filter(username=username).first()
                
            if user:
                connection = FamilyConnection.objects.filter(child=user).first()
                if connection:
                    connection.device_name = device_name
                    connection.battery_level = battery_level
                    connection.save()
                    return JsonResponse({"message": "Tracked successfully"}, status=200)
                return JsonResponse({"error": "Not paired"}, status=404)
            return JsonResponse({"error": "User not found"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

