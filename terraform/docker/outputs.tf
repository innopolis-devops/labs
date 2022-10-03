output "timeweb_container_id" {
  description = "Timeweb container ID"
  value       = docker_container.timeweb.id
}

output "timeweb_ports" {
  description = "External port of the timeweb container"
  value       = docker_container.timeweb.ports.0.external
}
