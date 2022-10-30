# Moscow Time Monitor

[![Python](https://github.com/igooor-bb/devops-labs/actions/workflows/python.yml/badge.svg)](https://github.com/igooor-bb/devops-labs/actions/workflows/python.yml)

Moscow Time Monitor is a web application that allows you to see the actual Moscow time no matter where you are.

## Contents

- [Moscow Time Monitor](#moscow-time-monitor)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Build](#build)
  - [Usage](#usage)
  - [Unit Tests](#unit-tests)
  - [Continuous Integration (CI)](#continuous-integration-ci)
  - [Contribution](#contribution)
  - [License](#license)

## Requirements

All you need to run the application is [Docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) installed.

## Build

1. Clone or download this repository to your local machine.

2. Using a terminal open the application root folder.

3. Run the application container using the following command:

    ```bash
    docker-compose up
    ```

4. At this point everything is ready. Now you can open the web application at the local address `127.0.0.1:1337` in the browser.

## Usage

In terms of usage, the single option is possible:

- If you want to view the application, just open the address `127.0.0.1:1337` in your browser.

## Unit Tests

Project contains unit tests which are executed on creation or changes in pull-request related to `app_python` files. There is a single unit test which checks that time parser works correctly on different time zones.

## Continuous Integration (CI)

Project contains CI workflow which automates the linter check, unit tests and publishing of a new Docker image with the service to the remote repository.

## Contribution

To contribute, use the follow "fork-and-pull" git workflow:

1. Fork the repository on github

2. Clone the project to your own machine

3. Commit changes to your own branch

4. Push your work back up to your fork

5. Submit a pull request so that I can review your changes

*NOTE: Be sure to merge the latest from "upstream" before making a pull request!*

## License

**Moscow Time Monitor** is available under the MIT license. See the LICENSE file for more info.
