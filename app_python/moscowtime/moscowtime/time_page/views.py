from datetime import datetime

from django.http import HttpResponse


def homePageView(request):
    now = datetime.now()
    current_time = now.strftime("Current time in moscow is %H:%M:%S")
    return HttpResponse(current_time)
