# Time Web Application

## Table of Contents

* [About The Project](#about-the-project)
    1. [Built With](#built-with)
* [Getting Started](#getting-started)
    1. [Prerequisites](#prerequisites)
    1. [Installation](#installation)
    1. [Activate the project environment](#activate-the-project-environment)
* [Usage](#usage)
* [Contributing](#contributing)
* [Contact](#contact)
* [Acknowledgments](#acknowledgments)

## About The Project

This project is the part of the Innopolis University DevOps course.
The aim of the project is to get acquainted with the Python best practices and frameworks for developing web applications using the example of a small web application that shows the current time in Moscow.

### Built With

[![Flask][Flask.com]][Flask-url]
[![Pylint][Pylint.com]][Pylint-url]
[![markdownlint][markdownlint.com]][markdownlint-url]

## Getting Started

Following the instructions below, you can create a local copy of the project and run the Time web application, which will show the current time in Moscow.

### Prerequisites

My main development environment is Visual Studio Code, so all further steps will be determined to work in this particular IDE. If you do not have VS Code installed, then you can download it from this [!link](https://code.visualstudio.com) or use [!this tutorial](https://www.digitalocean.com/community/tutorials/) to get started with Flask if you want to use any other development environment.

1. Install the [Python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python) to VS Code.

1. Make sure that you have. You can download from [python.org](https://www.python.org/downloads/).

1. On Windows, make sure the location of your Python interpreter is included in your PATH environment variable. You can check the location by running `path` at the command prompt. If the Python interpreter's folder isn't included, open Windows Settings, search for "environment", select **Edit environment variables for your account**, then edit the **Path** variable to include that folder.

### Installation

Run this command in your Terminal to clone the repository:

```bash
git clone https://github.com/Amina19058/app_python
```

### Activate the project environment

At this point, you will activate your Python environment and install Flask using the `pip` package installer.

1. Open VS Code, make sure that you are in the project directory.

1. Open the Command Palette (**View** > **Command Palette**. Then select the **Python: Select Interpreter** command. From the presented list, select the virtual environment in your project folder that starts with `./.venv` or `.\.venv`.

1. Run **Terminal: Create New Terminal** from the Command Palette.

1. Use the following command to create and activate a virtual environment named `.venv` based on your current interpreter:

    ```bash
    # Linux
    sudo apt-get install python3-venv 
    python3 -m venv .venv
    source .venv/bin/activate

    # macOS
    python3 -m venv .venv
    source .venv/bin/activate

    # Windows
    py -3 -m venv .venv
    .venv\scripts\activate
    ```

1. Also in the Terminal, run the following command to update `pip`:

    ```bash
    python -m pip install --upgrade pip
    ```

1. Then, run this to install the requirements:

    ```bash
    python3 -m pip install -r requirements.txt
    ```

1. Run the app.py by `python -m flask run`, which runs the Flask development server. The development server looks for `app.py` by default. When you run Flask, you should see output similar to the following:

    ```bash
    (.venv) D:\py\\hello_flask>python -m flask run
     * Environment: production
       WARNING: Do not use the development server in a production environment.
       Use a production WSGI server instead.
     * Debug mode: off
     * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
    ```

    If you see an error that the Flask module cannot be found, make sure you've run `python -m pip install flask` in your virtual environment as described at the end of the previous section.

1. See the result on `http://127.0.0.1:5000/`. You also can use the Live Server in VSCode.

1. Stop the app by using `Ctrl+C` in the terminal.

## Usage

You can use this project for educational purposes.
All the steps above allow you to launch an application that shows the current time in Moscow.

During their execution, you will learn how to create and activate a virtual environment, install Flask and develop simple web applications.

Also, in the PYTHON.md file you can find information about the best Python practices, the advantage of Flask, why to use linters.

## Contributing

I will gladly accept any contributions you make, as we will be able to make this project better together. Moreover, each of us will gain incredible experience in creating web applications and the correct design of the project.

If you have a suggestion that would make this project better, do not hesitate to contact me or fork the repo and create a pull request.

## Contact

Amina Khusnutdinova - a.khusnutdinova@innopolis.university

Project Link: [https://github.com/Amina19058/app_python](https://github.com/Amina19058/app_python)

## Acknowledgments

* [5 Python Best Practices That Every Programmer Should Follow](https://towardsdatascience.com/5-python-best-practices-every-python-programmer-should-follow-3c92971ed370)
* [Python Best Practices](https://data-flair.training/blogs/python-best-practices/)
* [Code Style](https://docs.python-guide.org/writing/style/)
* [Python Best Practices](https://aglowiditsolutions.com/blog/python-best-practices/)
* [Flask Tutorial](https://www.tutorialspoint.com/flask/flask_static_files.htm)
* [Best Practices for Flask](https://auth0.com/blog/best-practices-for-flask-api-development/)
* [A Guide to Python Good Practices](https://towardsdatascience.com/a-guide-to-python-good-practices-90598529da35)
* [PEP 8 – Style Guide for Python Code](https://peps.python.org/pep-0008/)
* [Best-README-Template](https://github.com/othneildrew/Best-README-Template/blob/master/README.md)
* [README Templates](https://www.readme-templates.com)
* [How to Write Beautiful Python Code With PEP 8](https://realpython.com/python-pep8/)
* [Flask Tutorial in Visual Studio Code](https://github.com/microsoft/vscode-docs/blob/main/docs/python/tutorial-flask.md?ysclid=l7fuhexcp9496302051)
* [Создание веб-приложения с помощью Flask в Python 3](https://www.digitalocean.com/community/tutorials/how-to-make-a-web-application-using-flask-in-python-3-ru)
* [shields.io](https://shields.io)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Flask.com]: https://img.shields.io/badge/%20-Flask-brightgreen
[Flask-url]: https://flask.palletsprojects.com/en/latest/
[Pylint.com]: https://img.shields.io/badge/%20-Pylint-orange
[Pylint-url]: https://pylint.pycqa.org/en/latest/
[markdownlint.com]: https://img.shields.io/badge/%20-markdownlint-red
[markdownlint-url]: https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
