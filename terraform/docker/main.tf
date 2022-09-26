terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

resource "docker_image" "app_python" {
  name         = "mcflydesigner/django-iu-lab:latest"
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.app_python.latest
  name  = var.container_name
  ports {
    internal = 8000
    external = 8000
  }
}
