resource "docker_image" "app_python" {
  name         = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
  keep_locally = false
}

resource "docker_container" "app_python" {
  image = docker_image.app_python.image_id
  name  = var.container_name
  ports {
    internal = 8000
    external = 80
  }
}
