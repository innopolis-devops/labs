output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}

output "container_name" {
  description = "Name of the Docker contaier"
  value = docker_container.nginx.name
}