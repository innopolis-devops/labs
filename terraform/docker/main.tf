terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "moscow_app" {
  name         = "boggda1337/moscow_app:latest"
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.moscow_app.latest
  name  = var.container_name
  ports {
    internal = 8000
    external = 8080
  }
}

