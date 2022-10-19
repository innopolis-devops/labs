terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

locals {
  path_app_purescript = abspath("${path.root}/../../app_purescript")
  path_app_python     = abspath("${path.root}/../../app_python")
}

resource "docker_image" "try_app_purescript" {
  keep_locally = false
  name         = "dademd/app_purescript:latest"
}

resource "docker_image" "try_app_python" {
  keep_locally = false
  name         = "dademd/app_python:latest"
}

resource "docker_container" "try_app_purescript" {
  env = [
    "HOST=${var.app_purescript.HOST}",
    "PORT=${var.app_purescript.DOCKER_PORT}"
  ]
  host {
    host = "localhost"
    ip   = var.app_purescript.HOST
  }
  image = docker_image.try_app_purescript.image_id
  name  = "try_app_purescript"
  ports {
    external = var.app_purescript.HOST_PORT
    internal = var.app_purescript.DOCKER_PORT
  }
  restart = "always"
  volumes {
    container_path = var.app_purescript.DIR
    host_path      = local.path_app_purescript
    read_only      = false
  }
}

resource "docker_container" "try_app_python" {
  env = [
    "HOST=${var.app_python.HOST}",
    "PORT=${var.app_python.DOCKER_PORT}"
  ]
  host {
    host = "localhost"
    ip   = var.app_python.HOST
  }
  image = docker_image.try_app_python.image_id
  name  = "try_app_python"
  ports {
    external = var.app_python.HOST_PORT
    internal = var.app_python.DOCKER_PORT
  }
  restart = "always"
  volumes {
    container_path = var.app_python.DIR
    host_path      = local.path_app_python
    read_only      = false
  }
}