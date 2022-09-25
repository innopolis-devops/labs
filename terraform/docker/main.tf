terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

resource "docker_image" "test_image" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.test_image.image_id
  name  = var.container_name
  rm    = true
  ports {
    internal = 8080
    external = var.external_port
  }
}
