variable "aws_ami" {
  description = "AMI image of the EC2 instance."
  type        = string
  # Amazon Linux 2 AMI (HVM) - Kernel 5.10.
  default     = "ami-0bcf2639b551f6b31"
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

variable "deploy_public_key" {
  description = "SSH key, that will be allowed to connect to the instances."
  type        = string
}
