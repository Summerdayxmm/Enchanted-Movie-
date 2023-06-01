from django.db import models


# Create your models here.

class MovieComment(models.Model):
    movie_comment_movieName = models.CharField(max_length=128, verbose_name="评论电影名字", default='')
    movie_comment_userName = models.CharField(max_length=128, verbose_name="评论用户名", default='')
    movie_comment_userAvatar = models.CharField(max_length=128, verbose_name="评论用户头像url", default='')
    movie_comment_content = models.TextField(verbose_name="评论内容", default='')
    movie_comment_time = models.DateTimeField(auto_now_add=True, verbose_name="评论时间")
    movie_comment_like = models.IntegerField(default=0, verbose_name="评论点赞数")
    movie_comment_dislike = models.IntegerField(default=0, verbose_name="评论点踩数")

    def __str__(self):
        return self.movie_comment_userName

    class Meta:
        ordering = ["movie_comment_time"]
        verbose_name = "MovieComment"
        verbose_name_plural = "MovieComment"


class MovieInfo(models.Model):
    movie_id = models.CharField(max_length=128, unique=True, verbose_name="电影id")
    movie_name = models.CharField(max_length=128, verbose_name="电影名字", default='')
    movie_releaseTime = models.CharField(max_length=128, verbose_name="电影上映时间", default='')
    movie_description = models.TextField(verbose_name="电影描述", default='')
    movie_director = models.CharField(max_length=128, verbose_name="电影导演", default='')
    movie_actors = models.CharField(max_length=128, verbose_name="电影演员", default='')
    movie_movieRatings = models.CharField(max_length=128, verbose_name="电影评分", default='')
    movie_duration = models.CharField(max_length=128, verbose_name="电影时长", default='')
    movie_language = models.CharField(max_length=128, verbose_name="电影语言", default='')
    movie_country = models.CharField(max_length=128, verbose_name="电影国家", default='')
    movie_type = models.CharField(max_length=128, verbose_name="电影类型", default='')
    movie_poster = models.FileField(upload_to="MoviePoster", verbose_name='电影海报', default='', null=True, blank=True, )
    movie_url = models.CharField(max_length=128, verbose_name="电影播放地址", default='')
    movie_comment = models.ManyToManyField(MovieComment, verbose_name="电影评论", blank=True)


class MovieClass(models.Model):
    movie_class = models.CharField(max_length=128, verbose_name="电影类型", default='')
    movie_class_movie = models.ManyToManyField(MovieInfo, verbose_name="电影", blank=True)
