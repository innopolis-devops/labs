terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {

}

resource "docker_image" "app_python" {
  name         = "whutao/app_python:latest"
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.app_python.image_id
  name  = var.docker_container_name
  ports {
    internal = 8080
    external = 5050
  }
}
