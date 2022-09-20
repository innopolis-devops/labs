# pink moscow time webpage

[![python and docker image build](https://github.com/molberte/devops_labs/actions/workflows/python.yaml/badge.svg)](https://github.com/molberte/devops_labs/actions/workflows/python.yaml)

## description of product
simple page that shows current moscow time when you refresh the page! 

now in  ✨  _pink_  ✨ 

## requirements
- python 3.9 or above
- everything else in `requirements.txt`
- at least one finger to type

## usage

### 🐳 docker 🐳

1. install [docker](https://docs.docker.com/get-docker/)
2. `docker pull molberte/devops-labs:python-app-docker`
3. `docker run -p 8080:5000 molberte/devops-labs:python-app-docker`
4. ???
5. profit

### OR manual setup
1. install python
2. type `python main.py` or `python3 main.py` in command prompt
3. well done! now access the webpage via  `127.0.0.1:8080`

### to exit
 `Ctrl + C` 

### unit tests
i used [pytest](https://github.com/pytest-dev/pytest/) to test my simple pink time page
so far there is only one unit test which checks the availability of the running page since it was my very first unit test at all.

subscribe (star⭐) to see if i managed to write the second one which checks if the displayed time is correct!

if you would like to check if the test is (are) really being passed, you can follow this simple guide:
1. install pytest inside your virtual environment
2. simply run `pytest` command while running a time page
3. happily see that the test is passed!

## contact
kseniya kudasheva

innopolis university, B19-CS-01, kill team

k.kudasheva@innopolis.university

p.s. yes, i hate capital letters
