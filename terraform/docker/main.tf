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
  name         = "necesanov/devops:latest"
  keep_locally = false
}

resource "docker_container" "devops" {
  image = docker_image.devops.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}
