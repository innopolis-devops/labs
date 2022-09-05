"""
    Urls for timeapp module
"""
from django.urls import path
from .views import time_page_view

urlpatterns = [
    path("now", time_page_view, name="time-now"),
]
