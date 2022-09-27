variable "cores" {
  description = "Cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "RAM"
  type        = number
  default     = 2
}

variable "instance_name" {
  description = "The name of the yandex compute instance"
  type        = string
  default     = "terraformlab"
}

variable "instance_image_id" {
  description = "The image id of the yandex compute instance"
  type        = string
  default     = "fhm4e67luv1egp0ji7ke"
}

variable "zone" {
  description = "The default zone of the yandex provider"
  type        = string
  default     = "ru-central1-a"
}