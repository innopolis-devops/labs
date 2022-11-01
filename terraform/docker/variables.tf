variable "container_name" {
  description = "Name of the docker container with the app."
  type        = string
  default     = "app_python"
}

variable "aws_region" {
  description = "AWS region with docker images."
  type        = string
  default     = "eu-north-1"
}

variable "aws_access_key_id" {
  description = "AWS auth."
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS auth."
  type        = string
}
