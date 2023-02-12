# Simple Moscow Time Getter

![Build and test status](https://github.com/draeston/labs/actions/workflows/init.yml/badge.svg)

## A Python web-application for getting Moscow time

# Install
## Prerequisites
* Python 3

## Steps
1. Clone the repository and go into the <repository_name>/app_python directory
2. Create virtual environment: 

```python -m venv venv```

3. Activate the virtual environment using commands: 
  
```venv\Scripts\activate.bat``` for Windows; 
   
```source venv/bin/activate``` for Linux/MacOS

4. Install dependencies:

```pip install -r requirements.txt```

5. Run application: 

```python moscow_time.py```

Application will be accessed on http://localhost:8080/

# Docker

Using Docker containerization we can make sure that application is isolated from unnecessary environment that can affect performance and functionality of the application.

So, I wrote Dockerfile that is used to create images from which you can then run Docker containers.

What Dockerfile does?

So, via Dockerfile in image I setup environment of Python 3.10, make directory where app is working to be /app, copy all necessary files,
let port 3000 be accessed and run application itself.

To build an image and run container there are following steps:

1. Run
```docker build .```

2. Then find your newly created image in list of Docker images
```docker images```

3. Then run container via the following command
```docker run -d -p 3000:3000 <image_id>```

You can get image from my [Docker Hub repo](https://hub.docker.com/repository/docker/draeston/devops_app/general)

# Unit test
To run tests use the following command after installing dependencies
```pytest```

# Continous Integration
Workflow ```ci-python``` ensures that there is no linter or test failures, and run snyk to check for vulnerabilities

# Contact
Contact me in Telegram if you have any questions: @NiosZ