variable "image" {
  type = string
}

variable "container_name" {
  type = string
}

variable "external_port" {
  type    = number
  default = 8080
}
