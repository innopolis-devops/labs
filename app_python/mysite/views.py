import datetime
import time
from django.http import HttpResponse
from pytz import timezone


def index(request):
    t = time.localtime()
    moscow = timezone('Europe/Moscow')
    current_datetime = datetime.datetime.now(moscow)
    # current_time = time.strftime("%H:%M:%S", t)
    html = "<html><body><b>Current Date and Time in Moscow:</b> %s</body></html>" % current_datetime.strftime('%Y-%m-%d %H-%M-%S')
    with open("visits.txt", "w") as file:
        file.write(f"Visited at {current_datetime.strftime('%Y-%m-%d %H-%M-%S')}")
    return HttpResponse(html)


def visits(request):
    t = time.localtime()
    moscow = timezone('Europe/Moscow')
    current_datetime = datetime.datetime.now(moscow)
    # current_time = time.strftime("%H:%M:%S", t)
    with open("visits.txt", "r") as f:
        visits_text = f.read()
    html = "<html><body><b> </b> %s</body></html>" % visits_text
    return HttpResponse(html)
