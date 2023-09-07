# Current Time in Moscow

## Overview
This is a simple Python web application that displays the current time in Moscow. It uses the Flask web framework and the datetime module to get the current time in the Europe/Moscow timezone. The time is displayed in a user-friendly format on a web page.

## Build
To build this application, you need to create a Python file with a main.py extension, for example, app.py. Then, copy the code in main.py to your file. Save the file and run it using the command python app.py in a terminal or command prompt. 
The application will start running on your local machine.

## Usage
To use the application, open a web browser and navigate to http://localhost:5000/. The current time in Moscow will be displayed on the web page. The time will be updated every time you refresh the page.

## To run the Dockerfile in your project, you can follow these steps:

1. Make sure that you have Docker installed on your local machine. You can download Docker from the official website: https://www.docker.com/products/docker-desktop

2. Open a terminal or command prompt and navigate to the directory that contains your Dockerfile.

3. Build the Docker image using the following command:
    docker build -t <image-name> .
    Make sure to replace <image-name> with the name that you want to give to your Docker image. The . at the end of the command specifies that the build context is the current directory.

4. Once the build is complete, you can run the Docker container using the following command:
    docker run -p <host-port>:<container-port> <image-name>

Make sure to replace <host-port> with the port number on your local machine that you want to use to access the container, <container-port> with the port number that your application is listening on inside the container, and <image-name> with the name of the Docker image that you built in step 3.

For example, if your application is listening on port 80 inside the container and you want to access it on port 8080 on your local machine, you can use the following command:
    docker run -p 8080:80 <image-name>

5. Once the container is running, you can access your application by opening a web browser and navigating to http://localhost:<host-port>. In the example above, you would navigate to http://localhost:8080.
