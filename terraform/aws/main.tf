#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 4.16"
#    }
#  }
#
#  required_version = ">= 1.2.0"
#}
#
#provider "aws" {
#  region  = "eu-central-1"
#}
#
#resource "aws_instance" "test" {
#  ami           = "ami-09042b2f6d07d164a"
#  instance_type = "t2.micro"
#
#  tags = {
#    Name = "test"
#  }
#}

provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "node_server" {
  ami =  "ami-0f69dd1d0d03ad669"
  instance_type = "t2.micro"
}