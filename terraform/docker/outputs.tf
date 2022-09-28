output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.python_app.id
}

output "ports" {
  description = "Port bindings for the container"
  value       = [for port in docker_container.python_app.ports : "${port.external} -> ${port.internal}"]
}

output "image_name" {
  description = "Name of the Docker image"
  value       = docker_image.python_app.name
}

