from rest_framework import serializers

from Movies.models import MovieComment, MovieInfo, MovieClass


class MovieCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieComment
        fields = '__all__'

class MovieInfoSerializer(serializers.ModelSerializer):
    movie_comment = MovieCommentSerializer(many=True, read_only=True)
    movie_poster = serializers.SerializerMethodField()

    class Meta:
        model = MovieInfo
        fields = '__all__'

    def get_movie_poster(self, obj):
        if obj.movie_poster:
            return 'http://127.0.0.1:8000' + obj.movie_poster.url
        return None

class MovieClassSerializer(serializers.ModelSerializer):
    movie_class_movie = MovieInfoSerializer(many=True, read_only=True)

    class Meta:
        model = MovieClass
        fields = '__all__'