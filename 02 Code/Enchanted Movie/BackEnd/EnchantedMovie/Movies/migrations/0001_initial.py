# Generated by Django 4.2.1 on 2023-05-24 10:48

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='MovieComment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('movie_comment_movieName', models.CharField(default='', max_length=128, verbose_name='评论电影名字')),
                ('movie_comment_userName', models.CharField(default='', max_length=128, verbose_name='评论用户名')),
                ('movie_comment_userAvatar', models.CharField(default='', max_length=128, verbose_name='评论用户头像url')),
                ('movie_comment_content', models.TextField(default='', verbose_name='评论内容')),
                ('movie_comment_time', models.DateTimeField(auto_now_add=True, verbose_name='评论时间')),
                ('movie_comment_like', models.IntegerField(default=0, verbose_name='评论点赞数')),
                ('movie_comment_dislike', models.IntegerField(default=0, verbose_name='评论点踩数')),
            ],
            options={
                'verbose_name': 'MovieComment',
                'verbose_name_plural': 'MovieComment',
                'ordering': ['movie_comment_time'],
            },
        ),
        migrations.CreateModel(
            name='MovieInfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('movie_id', models.CharField(max_length=128, unique=True, verbose_name='电影id')),
                ('movie_name', models.CharField(default='', max_length=128, verbose_name='电影名字')),
                ('movie_releaseTime', models.CharField(default='', max_length=128, verbose_name='电影上映时间')),
                ('movie_description', models.TextField(default='', verbose_name='电影描述')),
                ('movie_director', models.CharField(default='', max_length=128, verbose_name='电影导演')),
                ('movie_actors', models.CharField(default='', max_length=128, verbose_name='电影演员')),
                ('movie_movieRatings', models.CharField(default='', max_length=128, verbose_name='电影评分')),
                ('movie_duration', models.CharField(default='', max_length=128, verbose_name='电影时长')),
                ('movie_language', models.CharField(default='', max_length=128, verbose_name='电影语言')),
                ('movie_country', models.CharField(default='', max_length=128, verbose_name='电影国家')),
                ('movie_type', models.CharField(default='', max_length=128, verbose_name='电影类型')),
                ('movie_poster', models.FileField(blank=True, default='', null=True, upload_to='MoviePoster', verbose_name='电影海报')),
                ('movie_comments', models.ManyToManyField(blank=True, default='', null=True, to='Movies.moviecomment', verbose_name='电影评论')),
            ],
        ),
        migrations.CreateModel(
            name='MovieClass',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('movie_class', models.CharField(default='', max_length=128, verbose_name='电影类型')),
                ('movies', models.ManyToManyField(blank=True, default='', null=True, to='Movies.movieinfo', verbose_name='电影')),
            ],
        ),
    ]