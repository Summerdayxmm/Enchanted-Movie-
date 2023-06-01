from django.db import models

class CinemaMovieTime(models.Model):
    cinemaMovieTime_morning = models.CharField(max_length=128, verbose_name="电影上映时间", default='')
    cinemaMovieTime_afternoon = models.CharField(max_length=128, verbose_name="电影上映时间", default='')
    cinemaMovieTime_evening = models.CharField(max_length=128, verbose_name="电影上映时间", default='')


# Create your models here.
class CinemaMovieInfo(models.Model):
    cinemaMovie_name = models.CharField(max_length=128, verbose_name="电影名字", default='')
    cinemaMovie_releaseTime = models.CharField(max_length=128, verbose_name="电影上映时间", default='')
    cinemaMovie_description = models.TextField(verbose_name="电影描述", default='')
    cinemaMovie_director = models.CharField(max_length=128, verbose_name="电影导演", default='')
    cinemaMovie_actors = models.CharField(max_length=128, verbose_name="电影演员", default='')
    cinemaMovie_movieRatings = models.CharField(max_length=128, verbose_name="电影评分", default='')
    cinemaMovie_duration = models.CharField(max_length=128, verbose_name="电影时长", default='')
    cinemaMovie_language = models.CharField(max_length=128, verbose_name="电影语言", default='')
    cinemaMovie_country = models.CharField(max_length=128, verbose_name="电影国家", default='')
    cinemaMovie_type = models.CharField(max_length=128, verbose_name="电影类型", default='')
    cinemaMovie_poster = models.FileField(upload_to="CinemaMoviePoster", verbose_name='电影海报', default='', null=True, blank=True, )
    cinemaMovie_price = models.IntegerField(default=0, verbose_name="电影价格")
    cinemaMovieTime = models.ForeignKey('CinemaMovieTime', on_delete=models.CASCADE, verbose_name="电影时间", null=True, blank=True)