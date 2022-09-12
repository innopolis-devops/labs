# Overview
> Author: Alisa Ivanova CS-01

Simple Python web application, that shows current time in Moscow.


# Installation
For linux or Mac OS:

- Install Python 3 with `python3-pip` and `python3-venv` packages if neccessary.
- Perform command:
```
git clone https://github.com/mikadonia/labs_devops
```
- Create virtual environment:
```
cd app_python
python3 -m venv venv
source venv/bin/activate
```
- Install packages:
```
pip3 install -r requirements.txt
```


## Usage example

Start the server with 
```
flask run
``` 
  or 
```
python3 app.py
```
 Web app will open at [http://127.0.0.1:5000/]
 
 ## Docker activity
Started with adding Dockerfile:
```
FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./app.py" ]
```
Install requirements `requirements.txt` and copies app to `/code` directory. 
Run the server by command `python python_app/hw1/manage.py runserver 0.0.0.0:80` 

### How to Run using Docker:
1. Clone the repository
2. Enter application directory

    ``$ cd app_python``

3. Build the image

    `` $ docker build -t app_p .``

    or

    install image from Docker hub [TODO]

    `` $ docker pull mikadonia/app_p ``

4. Check the image

    `` $ docker images ``

5. Run the container based on the image

    `` $ docker run -d -p 80:80 <image_name> ``

    where *image_name* either *app_p*

5. Run container:
```docker run -p 80:80 mikadonia/app_p```




