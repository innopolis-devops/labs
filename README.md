## Time in Moscow
### Overview
This is a simple Python Flask web application, that shows current time in Moscow.
### Build
1. Clone the repository
2. Install all dependencies in the **requirements.txt**. Run `pip install -r requirements.txt` in the **/app_python** folder
3. Run **app.py**

### Usage
1. Go to **http://127.0.0.1:8080** to see the time
2. To get current time again refresh the page
### Contact
Feel free to contact me in case if you have any questions on **timur_rameev@mail.ru**

### Unit tests
For tests pytest is used. test_app.py tests if the app.py works correctly. It checks wherer the response message is 200 OK and whether the data of the responce is in the expected format.

### CI
Continious Integration is implemented if the ci.yml file. It consists of 2 jobs. The first one checks the app, installs dependencies, runs linter (pylint) and runs tests (pytest). The second job requires first job to be done successfuly then it buiilds and pushes a docker container to docker hub.

