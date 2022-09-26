![](https://github.com/markovvn1/devops-labs/actions/workflows/app_php.yml/badge.svg?branch=lab4)


<div align="center">
  <img src=".github/logo.svg" height="128px"/><br/>
  <h1>Rabbit counter</h1>
  <p>Simple PHP web application that helps you to count rabbits</a></p>
</div>

## 📝 About The Project

Everyone knows that rabbits multiply very quickly, so it is important to be able to count the number of rabbits quickly. This project provides a web application to help solve this problem. The app will be useful for people who work on a rabbit farm and need to count the number of rabbits on a daily basis.

The app is easy to use. Open the browser and go to the app website (see Quick start). To increase the rabbit counter by 1, click on the picture of the rabbit.

The repository contains a docker container with simple php web application that helps you to count rabbits.  The application is written using the [php](https://www.php.net/) and can be run inside a [Docker](https://www.docker.com/) container.

<div align="center">
  <img src=".github/web_demo.png" width="600px"/>
</div>

## ⚡️ Quick start

Before proceeding, make sure you have installed [Docker](https://docs.docker.com/engine/install/).

1. Download the repository and change the current directory:

   ```bash
   git clone https://github.com/Markovvn1/devops-labs.git && cd devops-labs
   ```

2. Switch to lab4 branch and open project's directory:

   ```bash
   git checkout lab4 && cd app_php
   ```

3. Run the project using Docker:

   ```bash
   docker run -it --rm -v "`pwd`/docker_files/nginx.conf:/etc/nginx/nginx.conf" -v "`pwd`/site:/var/www/html" -p 8080:80 trafex/alpine-nginx-php7
   ```

4. Open the website `http://localhost:8080/` to start count rubbits.

### :whale: Docker-way to quick start

Before proceeding, make sure you have installed [Docker](https://docs.docker.com/engine/install/).

1. Run docker container (support linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6):

   ```bash
   docker run -it --rm -p 8080:80 markovvn1/iu-devops:lab4_php
   ```

2. Open the website `http://localhost:8080/` to view the server time in Moscow.

## ⚙️ Developing

The changes are displayed when the page is refreshed. Therefore, to contribute, simply download and run the project as described in the *Quick start* section.

To build docker image run:

```bash
docker build -t markovvn1/iu-devops:lab4_php .
```

## :computer: Contributors

<p>

  :mortar_board: <i>All participants in this project are undergraduate students in the <a href="https://apply.innopolis.university/en/bachelor/">Department of Computer Science</a> <b>@</b> <a href="https://innopolis.university/">Innopolis University</a></i> <br> <br>

  :boy: <b>Vladimir Markov</b> <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email: <a>Markovvn1@gmail.com</a> <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitLab: <a href="https://gitlab.com/markovvn1">@markovvn1</a> <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Githab: <a href="https://github.com/markovvn1">@markovvn1</a> <br>
</p>
