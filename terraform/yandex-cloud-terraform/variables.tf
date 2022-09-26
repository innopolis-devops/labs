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
  default     = "keys.pub"
}

variable "image_id_name" {
  description = "Image id"
  type = string
  default = "fd8c00efhiopj3rlnlbn"
}

variable "service_account_key_file_name" {
  description = "Service account key file"
  type = string
  default = "key.json"
}
