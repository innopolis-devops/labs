""" Views for django_app """

from django.http import HttpResponse


def healthcheck(req):
    """ Page that returns HTTP code 200 """
    return HttpResponse('OK')
