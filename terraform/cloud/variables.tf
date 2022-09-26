variable "zone" {
  description = "Name of zone in Yandex Cloud"
  type        = string
  default     = "ru-central1-a"
}

variable "vm_name" {
  description = "Name of the virtual machine in Yandex Cloud"
  type        = string
  default     = "terraform-app-name"
}

variable "network_name" {
  description = "Name of the network in Yandex Cloud"
  type        = string
  default     = "network1"
}

variable "subnetwork_name" {
  description = "Name of the subnetwork in Yandex Cloud"
  type        = string
  default     = "subnet1"
}

variable "vm_cores" {
  description = "Number of cores for the virtual machine in Yandex Cloud"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Size of RAM for the virtual machine in Yandex Cloud"
  type        = number
  default     = 2
}
