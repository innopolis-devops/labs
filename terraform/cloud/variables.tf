variable "zone" {
  description = "YandexCloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "vm_name" {
  description = "Name of the vm"
  type        = string
  default     = "vm-innodevops"
}

variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "network-1"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-1"
}
