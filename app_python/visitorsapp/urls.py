"""
    Urls for visitorsapp module
"""
from django.urls import path
from .views import root, visitors

urlpatterns = [
    path('', root, name='visitors-root'),
    path('visits', visitors, name='visitors-get-counter')
]
