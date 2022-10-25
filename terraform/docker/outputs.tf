output "container_id" {
  description = "ID of the Cat container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Cat image"
  value       = docker_image.nginx.id
}

