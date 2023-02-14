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
  name         = "semior/innodevops:latest"
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.app_python.latest
  name  = var.container_name
  ports {
    internal = 5000
    external = 8080
  }
}