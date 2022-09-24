terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "msctime" {
  name         = "feydrauth/msctime:latest"
  keep_locally = false
}

resource "docker_container" "msctime" {
  image = docker_image.msctime.image_id
  name  = var.container_name
  ports {
    internal = 8000
    external = 8000
  }
}
