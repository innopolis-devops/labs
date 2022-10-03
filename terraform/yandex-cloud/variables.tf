variable "app_server_cores" {
  description = "Number of cores"
  type        = number
  default     = 2
}

variable "app_server_mem" {
  description = "The size of RAM in GB"
  type        = number
  default     = 2
}

variable "app_server_image_size" {
  description = "Thes size of boot disk image in GB"
  type        = number
  default     = 10
}

variable "app_server_ssh_key" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/id_rsa_app_server.pub"
}

variable "app_server_image_id" {
  description = "Image ID for app server VM"
  type        = string
  default     = "fd8c00efhiopj3rlnlbn" # Ubuntu 22.04
}

variable "zone" {
  description = "Server location zone"
  type        = string
  default     = "ru-central1-a"
}
