# PHP Sum Calculator

## Overview

This is a web application, which expects two integer numbers through forms,
and prints their sum. In case if user entered not integer numbers, corresponding
message will be written.

## Stack

Author used OS `Debian 11`. The web application is written in `PHP` and run on `Apache2`.

## Installation

* Install `Apache2`: `sudo apt install Apache2`
* Install `PHP`: `sudo apt install php libapache2-mod-php`
* Restart `Apache2`: `sudo systemctl restart apache2`
* Move `.php` file in corresponding directory: `sudo cp index.php /var/www/html/index.php`

## Usage

After these operations, the web application can be used both through address `127.0.0.1`
or through your local address (You can check it with `ifconfig` or `ip addr`).
