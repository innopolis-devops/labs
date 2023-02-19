terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

variable "container_name" {
  description = "Name for the Docker container"
  type        = string
  default     = "app_python"
}


resource "docker_container" "app_python" {
  image   = "lab-4:latest"
  name    = var.container_name
  restart = "always"
  ports {
    internal = 5000
    external = 5000
  }
}

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.app_python.id
}

