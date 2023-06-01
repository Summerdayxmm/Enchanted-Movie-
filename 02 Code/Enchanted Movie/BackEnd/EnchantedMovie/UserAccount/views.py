from django.http import HttpResponse, request, JsonResponse
from rest_framework.response import Response
from rest_framework.views import APIView

from UserAccount import models
from UserAccount.models import UserInfo, UserAccount
from UserAccount.serializers import UserAccountSerializer


def login(request):
    if request.method == "POST":
        user_name = request.POST.get("user_name")
        user_password = request.POST.get("user_password")
        user_loginState = request.POST.get("user_loginState")

        try:
            user = models.UserAccount.objects.get(user_name=user_name)
            if user.user_password == user_password:
                message = "login success"
                user.user_loginState = user_loginState
                user.save()

            else:
                message = "User Password Error"
        except:
            message = "User Account does not exist"

        return HttpResponse(message)


def register(request):
    if request.method == "POST":

        user_name = request.POST.get("user_name")
        user_password = request.POST.get("user_password")

        message = "register success"

        same_name_user = models.UserAccount.objects.filter(user_name=user_name)

        if same_name_user:  # 用户名唯一
            message = 'User name is already exist'
        else:
            new_user = models.UserAccount.objects.create(user_name=user_name, user_password=user_password)

        # new_user = models.UserAccount.objects.create()
        # new_user.user_name = user_name
        # new_user.user_password = user_password
        #
        # new_user.save()

        return HttpResponse(message)


def logout(request):
    if request.method == "POST":

        user_name = request.POST.get("user_name")
        user_loginState = request.POST.get("user_loginState")
        user = models.UserAccount.objects.get(user_name=user_name)
        try:
            if user.user_name == user_name:
                user.user_loginState = user_loginState
                user.save()
                message = "Logout success"
            else:
                message = "User does not exist"

        except:
            message = 'Logout wrong'

        return HttpResponse(message)




def userInfo(request):
    if request.method == "POST":
        user_name = request.POST.get("user_name")
        user_email = request.POST.get("user_email")
        user_tel = request.POST.get("user_tel")
        user_sex = request.POST.get("user_sex")
        user_old = request.POST.get("user_old")
        user_avatar = request.FILES.get("user_avatar")

        user = models.UserAccount.objects.get(user_name=user_name)


        try:
            user_info = UserInfo(user_name=user_name, user_email = user_email, user_tel = user_tel, user_sex=user_sex, user_old=user_old, user_avatar=user_avatar)
            user_info.save()
            user.user_userInfo = user_info
            user.save()

            message = "User Information Success"

        except:
            message = "User Information Error"

        return HttpResponse(message)

    return HttpResponse("Invalid request method")