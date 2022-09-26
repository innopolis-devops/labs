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

resource "docker_container" "msc_time" {
  image = "andrew174194/msc_time_py:latest"
  name  = "msc_time_py"
  restart = "always"
  ports {
    internal = 5000
    external = 80
  }
}