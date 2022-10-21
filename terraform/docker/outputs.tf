output "container_id" {
  description = "Id of docker container"
  value       = docker_container.nginx.id
}

output "image_name" {
  description = "Name of docker image"
  value       = docker_image.nginx.name
}