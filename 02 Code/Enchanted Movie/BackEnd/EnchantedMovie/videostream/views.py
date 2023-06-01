from django.http import StreamingHttpResponse, Http404
from django.conf import settings
import os


def stream_video(request, video_path):
    video_path = os.path.join(settings.MEDIA_ROOT, video_path)

    # Check if video exists
    if not os.path.exists(video_path):
        raise Http404("Video not found.")

    def play_video(video_path):
        with open(video_path, 'rb') as video:
            while True:
                data = video.read(8192)
                if not data:
                    break
                yield data

    response = StreamingHttpResponse(play_video(video_path), content_type='video/mp4')
    response['Content-Disposition'] = 'inline; filename="your_video.mp4"'
    return response
