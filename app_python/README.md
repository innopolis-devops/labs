# Python WebApp Moscow Time

## Table of Contents

* [About The Project](#about-the-project)

* [How To Build](#getting-started)

* [Usage](#usage)

* [Contact](#contact)

## About The Project

The project inside this folder is a simple python web application that shows current time in Moscow. The time is updated only when you update the page.

### Built With

* Python
* Flask framework

## Getting Started

You can run the application following the next steps:

1. Clone the code:

    ```bash
    git clone https://github.com/pminina01/Innopolis_DevOps2022
    ```

2. Enter the folder with application

    ```bash
    cd Innopolis_DevOps2022/app_python
    ```

3. Then install the dependencies:

    ```bash
    pip install -r requirements.txt       
    ```

   Alternatively, you can firstly set virtual environment and then install packages

    ```bash
    python3 -m venv <myenvname>  
    source <myenvname>/bin/activate  
    pip install -r requirements.txt  
    ```

4. Run the following command to start the application

    ```bash
    flask run --host=127.0.0.1 --port=5000
    ```

### Usage

There are two ways to see the web page:

1. Enter the url inside the browser: <http://127.0.0.1:5000>
2. Run the command: `$ curl 127.0.0.1:5000`
   Then you will see the page with current time in Moscow.

## Contact

Polina Minina

* Telegram: [@JohnDenkis](https://t.me/JohnDenkis)

* Email: p.minina@innopolis.university

Project Link: [https://github.com/pminina01/Innopolis_DevOps2022](https://github.com/pminina01/Innopolis_DevOps2022)
