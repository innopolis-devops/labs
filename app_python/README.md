# Timeapp project

This app will help you to get current time in Europe/Moscow timezone.
This project is written using Django framework.

## How to run?
* You should have pre-installed Python 3.10 and pip.
* Navigate to working dir ```/app_python/django_app```
* Run in your terminal:
```shell
pip install -r requirements.txt
```
* Export secret key for application(it may be any string, keep it as secret!)
```shell
export SECRET_KEY=YOUR_SECRET_KEY
```
* Run all migrations
```shell
python manage.py migrate
```
* Run application
```shell
python manage.py runserver
```
* The server will be started by default on port 8000. Open the following [link in your browser](http://localhost:8000/time/now).
If everything is correct, you will see the page similar to the following one:
![img.png](images/docs/web-page-time.png)
* Great! Everything works!
