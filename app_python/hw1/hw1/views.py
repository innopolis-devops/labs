from django.http import HttpResponse 
from django.template import loader
from django.utils.timezone import now
import requests

def index(request):
    resp = requests.get(url='http://worldtimeapi.org/api/timezone/Europe/Moscow')
    data = resp.json()
    template = loader.get_template('other/index.html')
    time = 'error'
    if resp.status_code==200 and len(data['datetime']) > 10 and 'T' in data['datetime']:
        time = data['datetime'].split('T')[1][:8]
    return HttpResponse(template.render({'time': time}, request))