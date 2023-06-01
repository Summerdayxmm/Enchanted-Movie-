from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse, request, JsonResponse
from rest_framework import status
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView

from Movies.models import MovieInfo, MovieComment, MovieClass
from Movies.serializers import MovieInfoSerializer, MovieClassSerializer
from UserAccount.models import UserAccount, UserComment


class MovieInfoView(APIView):
    parser_classes = (FileUploadParser,)

    def get(self, request):
        movieInfo = MovieInfo.objects.all()
        serializer = MovieInfoSerializer(movieInfo, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):

        serializer = MovieInfoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)


def addMovieComment(reqeust):
    if reqeust.method == "POST":
        movie_id = reqeust.POST.get("movie_id")
        movie_comment_movieName = reqeust.POST.get("movie_comment_movieName")
        movie_comment_userName = reqeust.POST.get("movie_comment_userName")
        movie_comment_userAvatar = reqeust.POST.get("movie_comment_userAvatar")
        movie_comment_content = reqeust.POST.get("movie_comment_content")
        # movie_comment_time = reqeust.POST.get("movie_comment_time")

        movie = MovieInfo.objects.get(movie_id=movie_id)
        user = UserAccount.objects.get(user_name=movie_comment_userName)

        try:
            # movieComment = MovieComment.objects.create()
            # movieComment.movie_comment_movieName = movie_comment_movieName
            # movieComment.movie_comment_userName = movie_comment_userName
            # movieComment.movie_comment_userAvatar = movie_comment_userAvatar
            # movieComment.movie_comment_content = movie_comment_content
            # movieComment.save()
            # movie.movie_comment.add(movieComment)
            #
            # userComment = user.user_userComment.objects.create()
            # userComment.movie_comment_movieName = movie_comment_movieName
            # userComment.movie_comment_content = movie_comment_content
            # userComment.movie_comment_time = movie_comment_time
            # userComment.save()
            # user.user_userComment.add(userComment)
            #
            # message = "add movie comment success"
            movieComment = MovieComment.objects.create(
                movie_comment_movieName=movie_comment_movieName,
                movie_comment_userName=movie_comment_userName,
                movie_comment_userAvatar=movie_comment_userAvatar,
                movie_comment_content=movie_comment_content,
            )
            movie.movie_comment.add(movieComment)
            movie_comment_time = movieComment.movie_comment_time
            userComment = UserComment.objects.create(
                movie_comment_movieName=movie_comment_movieName,
                movie_comment_content=movie_comment_content,
                movie_comment_time=movie_comment_time
            )
            user.user_userComment.add(userComment)

            message = "add movie comment success"
        except:
            message = "add movie comment fail"

        return HttpResponse(message)


class MovieClassView(APIView):
    def get(self, request):
        movieClass = MovieClass.objects.all()
        serializer = MovieClassSerializer(movieClass, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = MovieClassSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors)




