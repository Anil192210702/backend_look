from django.urls import path
from . import views

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('signin/', views.signin, name='signin'),
    path('pair_device/', views.pair_device, name='pair_device'),
    path('upload_notification/', views.upload_notification, name='upload_notification'),
    path('get_paired_admin/', views.get_paired_admin, name='get_paired_admin'),
    path('update_device_meta/', views.update_device_meta, name='update_device_meta'),
    path('get_user_alerts/', views.get_user_alerts, name='get_user_alerts'),
]
