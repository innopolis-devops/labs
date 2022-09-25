variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "ami" {
  description = "ami"
  type        = string
  default     = "ami-026b57f3c383c2eec"

}