output "ip_address" {
  description = "IP address of container"
  value       = docker_container.nginx.ip_address
}

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}