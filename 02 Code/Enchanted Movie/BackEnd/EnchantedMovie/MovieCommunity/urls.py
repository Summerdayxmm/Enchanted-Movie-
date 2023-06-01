from django.urls import path
from MovieCommunity import views
from MovieCommunity.views import MovieCommunityView

app_name = 'MovieCommunity'
urlpatterns = [
    path('communityTalk/', MovieCommunityView.as_view()),
    path('addCommunityComment/', views.addCommunityComment)
]
