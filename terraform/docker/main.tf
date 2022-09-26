terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

resource "docker_image" "test" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "app" {
  image = docker_image.test.image_id
  name  = var.container_name
  rm    = true
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}