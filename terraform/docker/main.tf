terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "python_app" {
  name         = "ntdesmond/iu-devops-python:latest"
  keep_locally = false
}

resource "docker_container" "python_app" {
  image = docker_image.python_app.image_id
  name  = var.container_name
  ports {
    internal = 8000
    external = 8080
  }
}
