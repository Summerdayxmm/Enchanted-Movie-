from rest_framework import serializers

from CinemaMovie.models import CinemaMovieInfo, CinemaMovieTime


class CinemaMovieInfoSerializer(serializers.ModelSerializer):

    class Meta:
        model = CinemaMovieInfo
        fields = '__all__'

class CinemaMovieTimeSerializer(serializers.ModelSerializer):

    class Meta:
        model = CinemaMovieTime
        fields = '__all__'