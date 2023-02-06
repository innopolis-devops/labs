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

resource docker_image app_python {
  name         = "tiny0wizard/app_python:latest"
  keep_locally = false
}

resource docker_container app_python {
  image = "tiny0wizard/app_python:latest"
  name  = var.container_name
  ports {
    internal = 80
    external = 8000
  }
}
