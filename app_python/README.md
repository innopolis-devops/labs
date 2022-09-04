# Moscow time webpage

## Description of product
This is a simple web application to show the current time for Moscow time zone (UTC+3). It does not update the time after the page load though. 

The correctness of time depends on local system time no matter the system timezone.

(screenshot.png)
The web page user interface

## Requirements
- The Python 3.9 or newer version is required to run the application. 
- UNIX-like or Windows system with with the correct time set (the timezone can be different from Europe/Moscow)
- Access to network or Internet (or only localhost address is available) 

## Build
No building is required for this source code since Python is an interpreted language.

## Usage
0. Before the first start please run `prepare.sh` for virtual environment and dependancies installation.
1. Enter the `app_python` folder (folder with this README.md file) and open **Terminal** there
2. Start the virtual environment with `../Scripts/Activation` command (be sure about execution rights)
3. Start the application with `python main.py` or `python3 main.py` command
4. Access the webpage via printed address (`localhost:5000` by default)

To finish the server press `Ctrl + C` buttons

## Author
Andrey Khoroshavin

kill team, B19-CS-01 academic group, Innopolis University

a.khoroshavin@innopolis.university


September 2022