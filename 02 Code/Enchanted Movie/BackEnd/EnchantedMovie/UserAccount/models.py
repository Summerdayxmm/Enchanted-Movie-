from django.db import models
from Movies.models import MovieInfo, MovieComment, MovieClass
# Create your models here.

class UserInfo(models.Model):
    user_name = models.CharField(max_length=128, verbose_name="用户名", default='')
    user_email = models.EmailField(unique=True, verbose_name="邮箱")
    user_tel = models.CharField(max_length=11, default="", unique=True, verbose_name="电话号码")
    user_sex = models.CharField(max_length=20, verbose_name='性别')
    user_old = models.CharField(max_length=128,verbose_name='年龄')
    user_avatar = models.FileField(upload_to="UserAvatar", verbose_name='用户头像',default='', null=True, blank=True,)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.useraccount_set = None

    def __str__(self):
        return self.user_name

    class Meta:
        verbose_name = "UserInformation"
        verbose_name_plural = "UserInformation"

class UserComment(models.Model):
    # userComment = models.ManyToManyField(MovieComment, verbose_name="user comment",blank=True)
    movie_comment_movieName = models.CharField(max_length=128, verbose_name="评论电影名字", default='')
    movie_comment_content = models.TextField(verbose_name="评论内容", default='')
    movie_comment_time = models.TextField(verbose_name="评论时间", default='')
    movie_comment_like = models.IntegerField(default=0, verbose_name="评论点赞数")
    movie_comment_dislike = models.IntegerField(default=0, verbose_name="评论点踩数")


class UserPlayList(models.Model):
   user_playList_userName = models.CharField(max_length=128, verbose_name="用户名", default='')
   user_playList_movieID = models.CharField(max_length=128, verbose_name="电影ID", default='')
   user_playList_movieName = models.CharField(max_length=128, verbose_name="电影名字", default='')




class UserAccount(models.Model):
    user_name = models.CharField(max_length=128, unique=True, verbose_name="user name")
    user_password = models.CharField(max_length=256, verbose_name="user password")
    user_createTime = models.DateTimeField(auto_now_add=True, verbose_name="user create time")
    user_loginState = models.CharField(max_length=100, default="", verbose_name="user login state")
    user_userInfo = models.ForeignKey(UserInfo, related_name='user_info', on_delete=models.CASCADE, null=True, blank=True,verbose_name="user information")
    user_userComment = models.ManyToManyField(UserComment, verbose_name="user comment",blank=True)

    def __str__(self):
        return self.user_name

    class Meta:
        ordering = ["user_createTime"]
        verbose_name = "UserAccount"
        verbose_name_plural = "UserAccount"








# class UserOnlineNumber(models.Model):
#     user_onlineNum = models.IntegerField(default=0, verbose_name="User Online Number")
#     marked = models.CharField(max_length=256, default='')
#
#     class Meta:
#         verbose_name = "UserOnlineNumber"
#         verbose_name_plural = "UserOnlineNumber"

