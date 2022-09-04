from django.urls import path

from app_python.moscowtime.moscowtime.time_page.views import homePageView

urlpatterns = [
    path("", homePageView, name="home"),
]
