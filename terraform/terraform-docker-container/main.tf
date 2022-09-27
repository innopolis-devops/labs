terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_python" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "app_python" {

  image = docker_image.app_python.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8000
  }
}
