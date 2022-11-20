"""
    Urls for visitorsapp module
"""
from django.http import HttpResponse
import os.path

VISITORS_PATH = 'data/visitors.txt'


def verify_visitors_file_exist():
    if not os.path.isfile(VISITORS_PATH):
        with open(VISITORS_PATH, 'w+') as f:
            f.write(str(0))


def root(req):
    verify_visitors_file_exist()
    with open(VISITORS_PATH, 'r') as f:
        n = int(f.readline()) + 1
    with open(VISITORS_PATH, 'w+') as f:
        f.write(str(n))

    return HttpResponse('OK')


def visitors(req):
    verify_visitors_file_exist()
    with open(VISITORS_PATH, 'r') as f:
        n = int(f.readline())
    return HttpResponse(n)
