import json
import uuid
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from userdetails.models import FamilyConnection, NotificationEvent, UserProfile

@csrf_exempt
def generate_id(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            admin_username = data.get("admin_username", "admin")
            admin_user = User.objects.filter(email=admin_username).first()
            if not admin_user:
                admin_user = User.objects.filter(username=admin_username).first()
            if not admin_user:
                admin_user = User.objects.create_user(username=admin_username, password="password")
            
            new_id = str(uuid.uuid4())[:8].upper()
            FamilyConnection.objects.create(admin=admin_user, unique_id=new_id)
            return JsonResponse({"message": "ID generated", "unique_id": new_id}, status=201)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def get_notifications(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            admin_username = data.get("admin_username", "admin")
            admin_user = User.objects.filter(email=admin_username).first()
            if not admin_user:
                admin_user = User.objects.filter(username=admin_username).first()
            
            connections = FamilyConnection.objects.filter(admin=admin_user, child__isnull=False)
            child_users = [c.child for c in connections]
            
            from django.utils import timezone
            from datetime import timedelta
            try:
                two_days_ago = (timezone.now() - timedelta(days=2)).isoformat()
                NotificationEvent.objects.filter(app_source__iexact='Call', timestamp__lt=two_days_ago).delete()
            except Exception:
                pass
            
            notifications = NotificationEvent.objects.filter(user__in=child_users).values(
                'id', 'app_source', 'sender', 'message_content', 'timestamp', 'user__username'
            )
            return JsonResponse({"notifications": list(notifications)}, status=200)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def get_family_members(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            admin_username = data.get("admin_username", "admin")
            admin_user = User.objects.filter(email=admin_username).first()
            if not admin_user:
                admin_user = User.objects.filter(username=admin_username).first()
            
            connections = FamilyConnection.objects.filter(admin=admin_user)
            members = []
            for c in connections:
                members.append({
                    "id": c.unique_id,
                    "username": c.child.username if c.child else "Pending...",
                    "phone": c.child.first_name if c.child else "",
                    "status": "Connected" if c.child else "Waiting",
                    "device": c.device_name if c.child else "",
                    "battery": c.battery_level if c.child else 0
                })
            return JsonResponse({"members": members}, status=200)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST"}, status=405)

@csrf_exempt
def delete_device(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            admin_username = data.get("admin_username", "admin")
            unique_id = data.get("unique_id", "")
            
            admin_user = User.objects.filter(email=admin_username).first()
            if not admin_user:
                admin_user = User.objects.filter(username=admin_username).first()
            connection = FamilyConnection.objects.filter(admin=admin_user, unique_id=unique_id).first()
            if connection:
                connection.delete()
                return JsonResponse({"message": "Device successfully deleted"}, status=200)
            return JsonResponse({"error": "Device not found"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def clear_data(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            admin_username = data.get("admin_username", "admin")
            data_type = data.get("data_type", "notifications")
            
            admin_user = User.objects.filter(email=admin_username).first()
            if not admin_user:
                admin_user = User.objects.filter(username=admin_username).first()
            
            connections = FamilyConnection.objects.filter(admin=admin_user, child__isnull=False)
            child_users = [c.child for c in connections]
            
            if data_type == "calls":
                NotificationEvent.objects.filter(user__in=child_users, app_source__iexact='Call').delete()
            else:
                NotificationEvent.objects.filter(user__in=child_users).exclude(app_source__iexact='Call').delete()
                
            return JsonResponse({"message": f"{data_type.capitalize()} data cleared successfully"}, status=200)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST allowed"}, status=405)

@csrf_exempt
def get_profile(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            username = data.get("username", "")
            user = User.objects.filter(username=username).first() or User.objects.filter(email=username).first()
            if not user:
                return JsonResponse({"error": "User not found"}, status=404)
            
            profile, _ = UserProfile.objects.get_or_create(user=user)
            return JsonResponse({
                "full_name": profile.full_name,
                "phone_number": profile.phone_number,
                "email": user.email,
                "profile_image_base64": profile.profile_image_base64 or ""
            }, status=200)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST"}, status=405)

@csrf_exempt
def update_profile(request):
    if request.method == 'POST':
        try:
            try:
                data = json.loads(request.body)
            except Exception:
                data = request.POST
            username = data.get("username", "")
            user = User.objects.filter(username=username).first() or User.objects.filter(email=username).first()
            if not user:
                return JsonResponse({"error": "User not found"}, status=404)
            
            profile, _ = UserProfile.objects.get_or_create(user=user)
            if "full_name" in data:
                profile.full_name = data["full_name"]
            if "phone_number" in data:
                profile.phone_number = data["phone_number"]
            if "profile_image_base64" in data:
                profile.profile_image_base64 = data["profile_image_base64"]
            profile.save()
            
            return JsonResponse({"message": "Profile updated successfully"}, status=200)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    return JsonResponse({"error": "Only POST"}, status=405)

