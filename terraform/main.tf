terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "devopslab" {
  name         = "sh1co/devopslab:latest"
  keep_locally = false
}

resource "docker_container" "devopslab" {
  image = docker_image.devopslab.image_id
  name  = var.container_name
  ports {
    internal = 5000
    external = 5000
  }
}
