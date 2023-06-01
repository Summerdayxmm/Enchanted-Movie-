from django.urls import path

from Movies import views
from Movies.views import MovieInfoView, MovieClassView

urlpatterns = [

    path('MovieInfo/', MovieInfoView.as_view()),
    path('addMovieComment/', views.addMovieComment),
    path('MovieClass/', MovieClassView.as_view()),

]