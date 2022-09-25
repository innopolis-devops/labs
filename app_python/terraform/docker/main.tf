terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "devops-pythonapp" {
  name         = "e2xen/devops-pythonapp:1.0"
  keep_locally = false
}

resource "docker_container" "python_app" {
  image = docker_image.devops-pythonapp.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8000
  }
}
