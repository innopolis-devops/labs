variable "vm_cores" {
  description = "Number of cores"
  type        = number
  default     = 2
}

variable "vm_mem" {
  description = "The size of RAM in GB"
  type        = number
  default     = 4
}

variable "vm_os_image_id" {
  description = "The OS used on VM"
  type        = string
  default     = "fd8kdq6d0p8sij7h5qe3"
}

variable "pub_key_location" {
  description = "Location of public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}