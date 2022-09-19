# DevOps project
![CI](https://github.com/DiazzzU/labs/actions/workflows/python_actions.yaml/badge.svg?branch=lab3)   

My name is Dias Usenov.  
This is simple web application made for DevOps course in Innopolis University.

## i. Overview
It is simple Python web application that shows the current time in Moscow.

## ii. Getting Started 
### Installation 
Before running application, install :
* Python 3.7+
* pip
* requirements   
 ```pip install -r requirements.txt```

### Running
1. To run application, first go to the folder *app_python*
2. Then run following command:
    ```
    flask run
    ```  

3. Application will open at http://localhost:5000/.

### Unit tests
1. To test application, first run the following command:
    ```
    coverage run app_python/src/test.py
    ```
2. To get test reports, run
    ```
    coverage report
    ```

### Docker
1. Install [Docker](https://docs.docker.com/engine/install/)
2. Then run following commands:
    ```
    docker pull diazzzu/devops:app_python
    ```
    ```
    docker run -p 5011:5011 diazzzu/devops:app_python
    ```
3. Application will open at http://localhost:5011/.

## iii. Contact
If you have some problems, you can contact to my [telegram](https://t.me/dionyusus)
