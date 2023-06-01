from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import status
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView
from MovieCommunity.models import CommunityTalkComment, CommunityTalk
from MovieCommunity.serializers import CommunityTalkSerializer


# Create your views here.
class MovieCommunityView(APIView):
    parser_classes = (FileUploadParser,)

    def get(self, request):
        communityTalk = CommunityTalk.objects.all()
        serializer = CommunityTalkSerializer(communityTalk, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):
        serializer = CommunityTalkSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.erros, status=status.HTTP_400_BAD_REQUEST)

def addCommunityComment(reqeust):
    if reqeust.method == "POST":
        community_talk_id= reqeust.POST.get("id")
        community_talk_comment_userName = reqeust.POST.get("community_talk_comment_userName")
        community_talk_comment_userAvatar = reqeust.POST.get("community_talk_comment_userAvatar")
        community_talk_comment_content = reqeust.POST.get("community_talk_comment_content")
        community_talk = CommunityTalk.objects.get(id=int(community_talk_id))
        print(community_talk.id)
        print(community_talk_comment_userName)
        print(community_talk_comment_userAvatar)
        print(community_talk_comment_content)
        # community_talk_comment_time = community_talk.community_talk_time
        # print(community_talk_comment_time)
        try:
            communityTalkComment = CommunityTalkComment.objects.create(
                community_talk_comment_userName=community_talk_comment_userName,
                community_talk_comment_userAvatar=community_talk_comment_userAvatar,
                community_talk_comment_content=community_talk_comment_content,
            )

            community_talk.community_talk_comment.add(communityTalkComment)

            return HttpResponse("1")
        except:
            return HttpResponse("0")
    else:
        return HttpResponse("0")
