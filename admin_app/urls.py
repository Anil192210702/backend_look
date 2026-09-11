from django.urls import path
from . import views

urlpatterns = [
    path('generate_id/', views.generate_id, name='generate_id'),
    path('get_notifications/', views.get_notifications, name='get_notifications'),
    path('get_family_members/', views.get_family_members, name='get_family_members'),
    path('delete_device/', views.delete_device, name='delete_device'),
    path('clear_data/', views.clear_data, name='clear_data'),
    path('get_profile/', views.get_profile, name='get_profile'),
    path('update_profile/', views.update_profile, name='update_profile'),
]
