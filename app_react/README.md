
![React build](https://github.com/Khalil19-99/Devops-labs/actions/workflows/react_app.yml/badge.svg)

# Overview

This project is a simple react js web application to show the current date and time, the data can be updated by refreshing the page


# Execution 

## Install
To install dependencies, run:

```
npm install
```

## Run

To run the application for development, run:

```
npm start
```
## Build
To build the application for production, run:

```
npm run build
```



## Docker

- Dockerfile: dockerizing the app by building image contains the app and the requirments to run it.
- The application is hosted by npm
- Our application is available through a Docker container at mkhalil99/react_app. To run the image execute
```
docker run --publish 3000:3000 mkhalil99/react_app
```

## References

- https://validatejavascript.com/
- https://www.makeuseof.com/must-follow-react-practices/
- https://www.jslint.com/

