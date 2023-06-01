from rest_framework import serializers

from Movies.serializers import MovieCommentSerializer
from UserAccount.models import UserInfo, UserAccount, UserComment


class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = '__all__'

class UserCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserComment
        fields = '__all__'

class UserAccountSerializer(serializers.ModelSerializer):
    # userInfo = UserInfoSerializer(many=True, read_only=True)
    userComment = UserCommentSerializer(many=True, read_only=True)
    class Meta:
        model = UserAccount
        fields = '__all__'

