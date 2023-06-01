from django.contrib import admin

from MovieCommunity.models import CommunityTalk, CommunityTalkComment


# Register your models here.
class CommunityTalkAdmin(admin.ModelAdmin):
    def show_TalkComment(self, obj):
        return [a.community_talk_comment_content for a in obj.community_talk_comment.all()]
    list_display = ('id', 'community_talk_userName', 'community_talk_userAvatar','community_talk_content', 'community_talk_time', 'community_talk_image1', 'community_talk_image2','show_TalkComment')

admin.site.register(CommunityTalk, CommunityTalkAdmin)

class CommunityTalkCommentAdmin(admin.ModelAdmin):
    list_display = ('id', 'community_talk_comment_userName', 'community_talk_comment_userAvatar', 'community_talk_comment_content', 'community_talk_comment_time')
admin.site.register(CommunityTalkComment, CommunityTalkCommentAdmin)