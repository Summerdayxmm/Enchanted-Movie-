
from django.urls import path
from . import views

urlpatterns = [
    path('stream/<path:video_path>/', views.stream_video, name='stream_video'),
]