terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_image" "moscow_time" {
  name         = "romanza705/moscow_time:latest"
  keep_locally = false
}

resource "docker_container" "moscow_time" {
  image = docker_image.moscow_time.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}
