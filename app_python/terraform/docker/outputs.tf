output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.moscow_time.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.moscow_time.id
}
