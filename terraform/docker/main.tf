terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "timeweb" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "timeweb" {
  image = docker_image.timeweb.latest
  name  = var.name
  ports {
    internal = 50000
    external = 50000
  }
}
