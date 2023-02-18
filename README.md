# Simple Moscow Time Getter
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

Docker make container of your app, so all dependencies will be only in the container and result of work u can see only on some port

1. Run
```docker build .```

2. Then find your newly created image in list of Docker images
```docker images```

3. Then run container via the following command
```docker run -d -p 3000:3000 necesanov/devops:latest```

# Contact
My telegram: @wardenlow