# Moscow time checker

## 💾 Information

Sometimes you want to know time in Moscow, but you cant.\
Now you can easily run this app, go to <http://127.0.0.1:5000> and see Moscow time!

## 📝 How to run

### Main dependencies

- Python - 3.6.0 or higher

### Install the dependencies

``` python
pip install flask
```

### Install pre-commit

``` python
pip install pre-commit
pre-commit install
```

### Run the app

You can also run this app in 1 command, write this command
in terminal into the ``app_python`` directory.

``` python
python show_time.py
```
## Docker

### Build image locally

    docker build -t inforest/app_python:latest -f Dockerfile .

### Pull from Docker Hub

    docker pull inforest/app_java

### Run container with application

    docker run -p 8080:8080 --name app_python inforest/app_java

## 📪 Contacts

If you have any questions, please write me in Telegram: `@inforest`
