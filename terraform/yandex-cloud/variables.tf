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

variable "app_server_ssh_key" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/id_rsa_app_server.pub"
}
