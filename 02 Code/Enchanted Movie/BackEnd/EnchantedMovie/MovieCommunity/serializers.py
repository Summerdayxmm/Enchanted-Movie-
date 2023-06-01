from rest_framework import serializers

from MovieCommunity.models import CommunityTalkComment, CommunityTalk


class CommunityTalkCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommunityTalkComment
        fields = '__all__'


class CommunityTalkSerializer(serializers.ModelSerializer):
    community_talk_comment = CommunityTalkCommentSerializer(many=True, read_only=True)
    community_talk_image1 = serializers.SerializerMethodField()
    community_talk_image2 = serializers.SerializerMethodField()

    class Meta:
        model = CommunityTalk
        fields = '__all__'

    def get_community_talk_image1(self, obj):
        if obj.community_talk_image1:
            return 'http://127.0.0.1:8000' + obj.community_talk_image1.url
        return None
    def get_community_talk_image2(self, obj):
        if obj.community_talk_image2:
            return 'http://127.0.0.1:8000' + obj.community_talk_image2.url
        return None