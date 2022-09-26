terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_python" {
  name         = "ilyakolomin/devops_app_python:latest"
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.app_python.name
  name  = var.container_name
  ports {
    internal = 8000
    external = 8080
  }
}

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.app_python.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.app_python.id
}