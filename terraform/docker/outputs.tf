
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.py_app.id
}

output "ports" {
  description = "Port bindings for the container"
  value       = [for port in docker_container.py_app.ports : "${port.external} -> ${port.internal}"]
}

output "image_name" {
  description = "Name of the image"
  value       = docker_image.py_app.name
}
