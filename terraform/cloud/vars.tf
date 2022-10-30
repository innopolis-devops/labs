variable "name" {
  description = "Value of the name for the VM instance"
  type        = string
  default     = "terraform1"
}

variable "zone" {
  type        = string
  description = "Zone to use"
  default     = "ru-central1-a"
}