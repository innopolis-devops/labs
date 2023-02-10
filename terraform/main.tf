terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  version = "~> 2.6"
  host    = "npipe:////.//pipe//docker_engine"
}


resource "docker_image" "moscow_time" {
  name         = "geralizz/moscow_time:latest"
  keep_locally = false
}

resource "docker_container" "moscow_time" {
  image = docker_image.moscow_time.image_id
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}