# Current Time in Moscow

![Python CI](https://github.com/haraphat01/moscow_time/workflows/Python%20CI/badge.svg)


## Overview
This is a simple Python web application that displays the current time in Moscow. It uses the Flask web framework and the datetime module to get the current time in the Europe/Moscow timezone. The time is displayed in a user-friendly format on a web page.

## Build
To build this application, you need to create a Python file with a main.py extension, for example, app.py. Then, copy the code in main.py to your file. Save the file and run it using the command python app.py in a terminal or command prompt. 
The application will start running on your local machine.

## Usage
To use the application, open a web browser and navigate to http://localhost:5000/. The current time in Moscow will be displayed on the web page. The time will be updated every time you refresh the page.

## To run the Dockerfile in your project, you can follow these steps:

1. Make sure that you have Docker installed on your local machine. You can download Docker from the official website: https://www.docker.com/products/docker-desktop

2. Open a terminal or command prompt and navigate to the directory that contains your Dockerfile.

3. Build the Docker image using the following command:
    docker build -t <image-name> .
    Make sure to replace <image-name> with the name that you want to give to your Docker image. The . at the end of the command specifies that the build context is the current directory.

4. Once the build is complete, you can run the Docker container using the following command:
    docker run -p <host-port>:<container-port> <image-name>

Make sure to replace <host-port> with the port number on your local machine that you want to use to access the container, <container-port> with the port number that your application is listening on inside the container, and <image-name> with the name of the Docker image that you built in step 3.

For example, if your application is listening on port 80 inside the container and you want to access it on port 8080 on your local machine, you can use the following command:
    docker run -p 8080:80 <image-name>

5. Once the container is running, you can access your application by opening a web browser and navigating to http://localhost:<host-port>. In the example above, you would navigate to http://localhost:8080.

## Unit tests

I have written unit tests for the Python web application that displays the current time in Moscow. These tests ensure that the application is working as expected and help us catch any bugs early in the development process.

To run the unit tests, navigate to the directory where the `test_main.py` file is located and run the following command:
python test_main.py


Make sure that you have all the necessary dependencies installed, including Flask and any other modules that your application depends on.

If the tests pass successfully, you should see output similar to the following:

Ran 1 test in 0.001s

OK


## Git Actions CI

I have set up a continuous integration (CI) workflow using Git Actions to build and test our Python web application. The workflow has three steps: installing dependencies, running linters, and running unit tests.

To run the workflow, push changes to the `main` branch of the repository. The workflow will automatically be triggered and the steps will be run in order. Make sure that you have all the necessary dependencies installed, including Flask and any other modules that your application depends on.

I have also added Docker-related steps to our workflow to log in to a Docker registry, build a Docker image, and push the image to the registry. To use these steps, you will need to set up the `DOCKER_USERNAME` and `DOCKER_PASSWORD` secrets in your repository settings.

By following these best practices and including a Git Actions CI workflow in your project, I can ensure that my application is thoroughly tested and working as expected.

# Terraform AWS Example

This Terraform configuration sets up an AWS infrastructure with a single EC2 instance running in the `us-west-2` region. The instance is tagged with the name "ExampleAppServerInstance".

## Prerequisites

- Terraform >= 1.2.0
- AWS CLI
- An AWS account with the necessary permissions

## Configuration

The `main.tf` file contains the following resources:

1. **Terraform block**: Specifies the required providers and their versions.
2. **AWS provider block**: Configures the AWS provider with the `us-west-2` region.
3. **AWS instance resource**: Creates an EC2 instance with the specified AMI and instance type.


## Usage

1. Install Terraform and the AWS CLI.
2. Configure your AWS credentials using `aws configure` or by setting the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform apply` to create the infrastructure. Confirm the changes when prompted.
5. To destroy the infrastructure when you're done, run `terraform destroy`.

## Customization

You can customize the configuration by modifying the `main.tf` file. For example, you can change the instance type, region, or add additional resources as needed.