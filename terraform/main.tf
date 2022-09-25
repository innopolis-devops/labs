terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.80.0"
    }

  }
}

variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}

variable "yandex_oauth" {
  description = "Value of OAuth token for Yandex Cloud authentication"
  type        = string
  default     = "ExampleOAuthToken"
}

provider "docker" {}

provider "yandex" {
  token = var.yandex_oauth
  cloud_id  = "b1gg6kv86lpal27vstsm"
  folder_id = "b1gpvls3cr3tljo6783k"
  zone      = "ru-central1-a"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
  platform_id = "standard-v1"

  resources {
      cores = 2
      memory = 2
  }

    boot_disk {
    initialize_params {
      image_id = "fd8v0s6adqu3ui3rsuap" # ОС (Ubuntu, 22.04 LTS)
    }
  }

  network_interface {
    subnet_id = "e9b1q0se9fv70ehtr3co"
    nat = true
  }
    
}

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}