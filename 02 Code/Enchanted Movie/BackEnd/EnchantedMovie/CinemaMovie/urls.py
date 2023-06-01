from django.urls import path

from CinemaMovie import views
from CinemaMovie.views import CinemaMovieInfoView

app_name = 'CinemaMovie'

urlpatterns = [

    path('cinemaMovieInfo/', CinemaMovieInfoView.as_view(), name='cinemaMovieInfo'),

]