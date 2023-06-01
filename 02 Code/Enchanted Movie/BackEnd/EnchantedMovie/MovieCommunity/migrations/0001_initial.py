# Generated by Django 4.2.1 on 2023-05-25 11:48

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CommunityTalkComment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('community_talk_comment_userName', models.CharField(default='', max_length=128, verbose_name='用户名')),
                ('community_talk_comment_userAvatar', models.CharField(default='', max_length=128, verbose_name='用户头像url')),
                ('community_talk_comment_content', models.TextField(default='', verbose_name='内容')),
                ('community_talk_comment_time', models.DateTimeField(auto_now_add=True, verbose_name='时间')),
            ],
            options={
                'verbose_name': 'CommunityTalkComment',
                'verbose_name_plural': 'CommunityTalkComment',
                'ordering': ['community_talk_comment_time'],
            },
        ),
        migrations.CreateModel(
            name='CommunityTalk',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('community_talk_userName', models.CharField(default='', max_length=128, verbose_name='用户名')),
                ('community_talk_userAvatar', models.CharField(default='', max_length=128, verbose_name='用户头像url')),
                ('community_talk_content', models.TextField(default='', verbose_name='内容')),
                ('community_talk_time', models.DateTimeField(auto_now_add=True, verbose_name='时间')),
                ('community_talk_image1', models.FileField(blank=True, default='', null=True, upload_to='Community', verbose_name='图片1')),
                ('community_talk_image2', models.FileField(blank=True, default='', null=True, upload_to='Community', verbose_name='图片2')),
                ('community_talk_comment', models.ManyToManyField(blank=True, to='MovieCommunity.communitytalkcomment', verbose_name='评论')),
            ],
            options={
                'verbose_name': 'CommunityTalk',
                'verbose_name_plural': 'CommunityTalk',
                'ordering': ['community_talk_time'],
            },
        ),
    ]