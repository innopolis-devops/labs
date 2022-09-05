from django.shortcuts import render
from django.http import HttpResponse
from pytz import timezone
import datetime
import time
def index(request):

    t = time.localtime()
    moscow = timezone('Europe/Moscow')
    current_datetime = datetime.datetime.now(moscow)
    # current_time = time.strftime("%H:%M:%S", t)
    html = "<html><body><b>Current Date and Time in Moscow:</b> %s</body></html>" % current_datetime.strftime('%Y-%m-%d %H-%M-%S')
    return HttpResponse(html)
