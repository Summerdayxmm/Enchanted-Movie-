from django.db import models

class CommunityTalkComment(models.Model):
    community_talk_comment_userName = models.CharField(max_length=128, verbose_name="用户名", default='')
    community_talk_comment_userAvatar = models.CharField(max_length=128, verbose_name="用户头像url", default='')
    community_talk_comment_content = models.TextField(verbose_name="内容", default='')
    community_talk_comment_time = models.DateTimeField(auto_now_add=True, verbose_name="时间")
    def __str__(self):
        return self.community_talk_comment_userName

    class Meta:
        ordering = ["community_talk_comment_time"]
        verbose_name = "CommunityTalkComment"
        verbose_name_plural = "CommunityTalkComment"

# Create your models here.
class CommunityTalk(models.Model):
    community_talk_userName = models.CharField(max_length=128, verbose_name="用户名", default='')
    community_talk_userAvatar = models.CharField(max_length=128, verbose_name="用户头像url", default='')
    community_talk_content = models.TextField(verbose_name="内容", default='')
    community_talk_time = models.DateTimeField(auto_now_add=True, verbose_name="时间")
    community_talk_image1 = models.FileField(upload_to="Community", verbose_name='图片1', default='', null=True, blank=True, )
    community_talk_image2 = models.FileField(upload_to="Community", verbose_name='图片2', default='', null=True, blank=True, )
    community_talk_comment = models.ManyToManyField(CommunityTalkComment, verbose_name="评论", blank=True)
    def __str__(self):
        return self.community_talk_userName

    class Meta:
        ordering = ["community_talk_time"]
        verbose_name = "CommunityTalk"
        verbose_name_plural = "CommunityTalk"