from django.urls import path

from UserAccount import views

app_name = 'UserAccount'

urlpatterns = [

    path('register/', views.register),
    path('login/', views.login, name='login'),
    path('logout/', views.logout),
    path('userInfo/', views.userInfo),

]