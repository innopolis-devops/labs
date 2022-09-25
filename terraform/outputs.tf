output "python_container_id" {
  description = "ID of the Docker container"
  value       = module.docker_app_python.container_id
}

output "rust_container_id" {
  description = "ID of the Docker image"
  value       = module.docker_app_rust.container_id
}
