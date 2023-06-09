# Generated by Django 4.2.1 on 2023-05-24 10:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Movies', '0002_alter_movieclass_movies_and_more'),
        ('UserAccount', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usercomment',
            name='userComment',
            field=models.ManyToManyField(blank=True, to='Movies.moviecomment', verbose_name='user comment'),
        ),
        migrations.AlterField(
            model_name='userplaylist',
            name='userPlayList_Movie',
            field=models.ManyToManyField(blank=True, to='Movies.movieinfo', verbose_name='user play list movie'),
        ),
    ]
