output "container_id" {
  description = "ID of docker container"
  value       = docker_container.msctime.id
}

output "container_name" {
  value = docker_container.msctime.name
}

output "ports" {
  description = "Port bindings"
  value       = [for port in docker_container.msctime.ports : "${port.external} -> ${port.internal}"]
}

output "image_name" {
  description = "Name of the docker image"
  value       = docker_image.msctime.name
}
