import json
import uuid
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from userdetails.models import FamilyConnection, NotificationEvent

@csrf_exempt
def generate_id(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
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
            data = json.loads(request.body)
            admin_username = data.get("admin_username", "admin")
            admin_user = User.objects.filter(email=admin_username).first()
            if not admin_user:
                admin_user = User.objects.filter(username=admin_username).first()
            
            connections = FamilyConnection.objects.filter(admin=admin_user, child__isnull=False)
            child_users = [c.child for c in connections]
            
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
            data = json.loads(request.body)
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
            data = json.loads(request.body)
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
