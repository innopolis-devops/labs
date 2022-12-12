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

resource "docker_container" "msc_time" {
  image   = "timrrrr/python_app_msk_time:latest"
  name    = "python_app_msk_time"
  restart = "always"
  ports {
    internal = 8080
    external = 8000
  }
}