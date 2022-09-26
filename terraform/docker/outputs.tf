output "container_id" {
  description = "ID of the Docker container with app_python"
  value       = docker_container.app_python.id
}

output "image_id" {
  description = "ID of the Docker image with app_python"
  value       = docker_image.app_python.id
}
