variable "yandex_compute_instance_name" {
  description = "The name of the yandex compute instance"
  type        = string
  default     = "terraform"
}

variable "yandex_compute_instance_image_id" {
  description = "The image id of the yandex compute instance"
  type        = string
  default     = "fd8hjvnsltkcdeqjom1n"
}

variable "yandex_provider_default_zone" {
  description = "The default zone of the yandex provider"
  type        = string
  default     = "ru-central1-a"
}