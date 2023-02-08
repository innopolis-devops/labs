# Flask app python

Flask is a lightweight Web Server Gateway Interface (WSGI) web application framework.
I use Flask because:
>   1) The Flask framework is easy to understand, that is why it is best for beginners. (And I am a beginner in usage of frameworks)
> 2) It is very flexible and easy.
>  3) Testing 

BTW, Flask has disadvantages: 
> 1) Scale: if you are trying to serve multiple requests, it will take more time.
> 2) Modules: some issues on security

### About app:
This is a simple app showing current time in Moscow (UTC+3) without any extra features. Just time.

### How to run:
1) Hope you have already installed Python and some IDE (in my case it was PyCharm), installed Flask and venv
2) Copy the folder "app_python" and run "main.py" file in IDE
3) Above there will be a link (containing 127.0.0.1:8080), click on it
4) Enjoy!

### Docker
1) create Dockerfile.txt
> FROM python:3.9
> COPY . /app_python
> WORKDIR /app_python
> RUN pip install --no-cache-dir -r requirements.txt
> ENTRYPOINT [ "python" ]
> CMD ["app.py" ]
> EXPOSE 5000

2) run image using `docker build . -f Dockerfile.txt command`
![](https://imageup.ru/img234/4200293/11111.png)
3) create account on docker hub
4) making right tag
![](https://imageup.ru/img299/4200311/2222.png)
5) push the image to hub using `docker push geralizz/kekops:lab2image` command, where `geralizz\kekops` is a repo name and `lab2image` is a tag
6) make sure it works
![](https://imageup.ru/img8/4200316/333.png)](https://imageup.ru/img8/4200316/333.png.html)