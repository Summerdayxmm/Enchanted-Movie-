from django.shortcuts import render
from rest_framework import status
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView

from CinemaMovie.models import CinemaMovieInfo
from CinemaMovie.serializers import CinemaMovieInfoSerializer


# Create your views here.
class CinemaMovieInfoView(APIView):
    parser_classes = (FileUploadParser,)

    def get(self, request):
        cinemaMovieInfo = CinemaMovieInfo.objects.all()
        serializer = CinemaMovieInfoSerializer(cinemaMovieInfo, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):

        serializer = CinemaMovieInfoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
