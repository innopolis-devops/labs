# Moscow Time Monitor

Moscow Time Monitor is a web application that allows you to see the actual Moscow time no matter where you are.

## Contents

- [Moscow Time Monitor](#moscow-time-monitor)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Build](#build)
  - [Usage](#usage)
  - [Contribution](#contribution)
  - [License](#license)

## Requirements

All you need to run the application is [Docker](https://docs.docker.com/engine/install/) installed.

## Build

1. Clone or download this repository to your local machine.

2. Using a terminal open the application root folder.

3. Build Docker image using the following command:

    ```bash
    docker build . -t flask_image
    ```

4. Run Docker container using the image from the previous step and following command:

    ```bash
    docker run --name flask -d -p 80:80 flask_image
    ```

5. At this point everything is ready. Now you can open the web application at the local address 127.0.0.1:80 in the browser.

## Usage

In terms of usage, two options are possible:

- If you want to view the application, just open the address 127.0.0.1:80 in your browser.

- If you want to stop a running application, type the following command in the terminal:

    ```bash
    docker stop flask
    ```

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
