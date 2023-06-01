from django.contrib import admin

from Movies.models import MovieInfo, MovieComment, MovieClass


# Register your models here.
class MovieInfoAdmin(admin.ModelAdmin):
    def show_movieComment(self, obj):
        return [i.movie_comment_content for i in obj.movie_comment.all()]

    list_display = ('id', 'movie_id', 'movie_name', 'movie_releaseTime', 'movie_description', 'movie_director','movie_actors', 'movie_movieRatings', 'movie_duration', 'movie_language', 'movie_country', 'movie_type', 'movie_poster', 'show_movieComment')


admin.site.register(MovieInfo, MovieInfoAdmin)

class MovieCommentAdmin(admin.ModelAdmin):
    list_display = ('id', 'movie_comment_movieName', 'movie_comment_userName', 'movie_comment_userAvatar', 'movie_comment_content', 'movie_comment_time', 'movie_comment_like', 'movie_comment_dislike')

admin.site.register(MovieComment, MovieCommentAdmin)


class MovieClassAdmin(admin.ModelAdmin):
    def show_movies(self, obj):
        return [i.movie_name for i in obj.movie_class_movie.all()]

    list_display = ('id', 'movie_class', 'show_movies')

admin.site.register(MovieClass, MovieClassAdmin)