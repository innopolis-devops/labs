resource "docker_image" "my_image" {
  name         = "afonya2001/devops:latest"
  keep_locally = false
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_container" "nginx" {
  image = docker_image.my_image.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8080
  }
}