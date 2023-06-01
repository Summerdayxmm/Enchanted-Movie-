from django.contrib import admin

from UserAccount.models import UserAccount, UserInfo, UserComment


# Register your models here.

class AccountAdmin(admin.ModelAdmin):

    def show_userComment(self, obj):
        return [i.movie_comment_content for i in obj.user_userComment.all()]
    list_display = ('id', 'user_name', 'user_password', 'user_loginState','user_userInfo', 'show_userComment')


admin.site.register(UserAccount, AccountAdmin)


class UserInfoAdmin(admin.ModelAdmin):

    list_display = ('id', 'user_name', 'user_email', 'user_tel', 'user_sex', 'user_old', 'user_avatar')


admin.site.register(UserInfo, UserInfoAdmin)


class UserCommentAdmin(admin.ModelAdmin):

    list_display = ('id', 'movie_comment_movieName', 'movie_comment_content', 'movie_comment_time', 'movie_comment_like', 'movie_comment_dislike')

admin.site.register(UserComment, UserCommentAdmin)