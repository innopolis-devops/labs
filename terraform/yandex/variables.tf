variable "vm_name" {
  description = "Name for the VM instance"
  type        = string
  default     = "terraform1"
}

variable "zone" {
  type        = string
  description = "Availability zone"
  default     = "ru-central1-b"
}

variable "net_name" {
  description = "Name for the network"
  type        = string
  default     = "network1"
}

variable "subnet_name" {
  description = "Name for the subnetwork"
  type        = string
  default     = "subnet1"
}

variable "cloud_id" {
  description = "The ID of the cloud to apply any resources to"
  type        = string
  default     = "b1gqhou8o8badjkpj8j6"
}

variable "folder_id" {
  description = "The ID of the folder to operate under, if not specified by a given resource"
  type        = string
  default     = "b1g1j1i6en6gp7r74vak"
}

variable "image_id" {
  description = " A disk image to initialize this disk from."
  type        = string
  default     = "fd8autg36kchufhej85b"
}
