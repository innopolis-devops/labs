variable "vm_name" {
  description = "The name for the Virtual Machine"
  type        = string
  default     = "terraform1"
}

variable "network_name" {
  description = "The name of the network"
  type        = string
  default     = "network1"
}

variable "subnet_name" {
  description = "The name of the subnetwork"
  type        = string
  default     = "subnet1"
}

variable "zone" {
  type        = string
  description = "The availability zone"
  default     = "ru-central1-b"
}

variable "image_id" {
  description = "The boot disk image ID"
  type        = string
  default     = "fd8klm3jujqmr4ib97sb"
}

variable "cloud_id" {
  description = "The ID of the cloud to apply any resources to"
  type        = string
  default     = "b1ghjrihq1d418cdvlq4"
}

variable "folder_id" {
  description = "The ID of the folder to operate under, if not specified by a given resource"
  type        = string
  default     = "b1geg3ib2ju4e1gb8ijb"
}