#!/bin/sh
gunicorn --workers 5 --bind 0.0.0.0:50000 wsgi:app
