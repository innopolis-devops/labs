output "container_id" {
  description = "Identificator if the app container."
  value       = docker_container.app_python.id
}

output "image_name" {
  description = "Name of the image."
  value       = docker_image.app_python.name
}
