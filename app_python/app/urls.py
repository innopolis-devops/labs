from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from mysite.views import index
from mysite.views import visits
urlpatterns = [
    path("", index, name="mysite"),
    path("admin/", admin.site.urls),
    path("visits/", visits, name="visits")
]

if bool(settings.DEBUG):
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
