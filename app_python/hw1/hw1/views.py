from django.http import HttpResponse
from django.template import loader
from . import utils


def index(request):
    time = utils.get_moscow_time()
    template = loader.get_template('other/index.html')
    return HttpResponse(template.render({'time': time}, request))
