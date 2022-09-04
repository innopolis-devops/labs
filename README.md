# Simple time application

## Overview

 Simple python web app, which shows current Moscow time (UTC + 3), using [Flask framework](https://flask.palletsprojects.com/en/2.2.x/quickstart/)

 ## Getting Started
 ### Build
 In order to run thr application following requirements should be preinstalled: 
 * [Python 3.8+](https://www.python.org/downloads/)
 * [pip](https://pip.pypa.io/en/stable/installation/)

 To run the application follow the instructions below:
 1. Clone repository.
     ```
     git clone https://github.com/MikhailMarch/devops
     cd devops/app_python
     ```
 2. Install packages.
     ```
     pip install -r flask>=2.2.2 pyflakes>=2.4.2 
     ```
 3. Run the application. Will be opened at [http://localhost:5000/](http://localhost:5000/).
     ```
     flask -app time_app.py run
     ```
    
## Contacts
Any question? telegram me @mikhailh