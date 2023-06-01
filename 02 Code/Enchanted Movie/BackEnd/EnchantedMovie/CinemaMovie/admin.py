from django.contrib import admin

from CinemaMovie.models import CinemaMovieInfo, CinemaMovieTime


# Register your models here.
class CinemaMovieInfoAdmin(admin.ModelAdmin):
    list_display = ('id', 'cinemaMovie_name', 'cinemaMovie_releaseTime', 'cinemaMovie_description', 'cinemaMovie_director', 'cinemaMovie_actors', 'cinemaMovie_movieRatings', 'cinemaMovie_duration', 'cinemaMovie_language', 'cinemaMovie_country', 'cinemaMovie_type', 'cinemaMovie_poster', 'cinemaMovie_price', 'cinemaMovieTime')

admin.site.register(CinemaMovieInfo, CinemaMovieInfoAdmin)

class CinemaMovieTimeAdmin(admin.ModelAdmin):
    list_display = ('id', 'cinemaMovieTime_morning', 'cinemaMovieTime_afternoon', 'cinemaMovieTime_evening')

admin.site.register(CinemaMovieTime, CinemaMovieTimeAdmin)