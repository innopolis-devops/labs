output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.devops.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.devops.id
  }