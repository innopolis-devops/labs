from django.http import HttpResponse
from django.template import loader
from django.core.files import File
from . import utils

def add_visit():
    f = open('/code/persistent/visits.txt', 'a+')
    testfile = File(f)
    testfile.write(f"{utils.get_moscow_time()}\n")
    testfile.close
    f.close

def read_visits():
    f = open('/code/persistent/visits.txt', 'r')
    contents = "Could not read the file"
    if f.mode == 'r':
       contents = f.read()
    return contents
    

def index(request):
    add_visit()
    time = utils.get_moscow_time()
    template = loader.get_template('other/index.html')
    return HttpResponse(template.render({'time': time}, request))

def visits(request):
    content = read_visits()
    template = loader.get_template('other/visits.html')
    return HttpResponse(template.render({'content': content}, request))