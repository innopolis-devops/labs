terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 1337
  }
}

variable "container_name" {
  description = "name for docker container"
  type        = string
  default     = "default_container"
}

output "container_id" {
  description = "id of the docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "id of the docker image"
  value       = docker_image.nginx.id
}