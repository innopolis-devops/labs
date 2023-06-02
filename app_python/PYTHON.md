# Flask App with Docker
This is a simple Flask app that displays the current time in Moscow. It uses the pytz library to convert the current time to the Europe/Moscow timezone.

# Prerequisites
Before running this app, make sure you have the following installed on your machine:

Docker
Git


# Setup
Install Python 3.x on your machine.
Clone this repository to your local machine.
Navigate to the project directory and install the required packages by running pip install -r requirements.txt.

Installation
Clone the repository to your local machine:

Copy
$ git clone https://github.com/your-username/flask-app-with-docker.git
```

Navigate to the project directory:

Build the Docker image:

$ docker build -t flask-app .

Run the Docker container:

$ docker run -p 5000:5000 flask-app
```

Open your web browser and go to http://localhost:5000 to view the app.

