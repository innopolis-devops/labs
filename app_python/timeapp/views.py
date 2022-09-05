""" Views for timeapp """

from datetime import datetime
from django.http import HttpResponse
import pytz


def time_page_view(req):
    """ Page that returns current time """
    ist = pytz.timezone('Europe/Moscow')
    return HttpResponse(datetime.now(ist).strftime('%Y:%m:%d %H:%M:%S'))
