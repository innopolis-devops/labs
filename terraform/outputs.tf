output "python_container_id" {
  description = "ID of the Docker container"
  value       = module.docker_app_python.container_id
}

output "rust_container_id" {
  description = "ID of the Docker image"
  value       = module.docker_app_rust.container_id
}

output "vm_instance_external_ip" {
  value = module.cloud.instance_external_ip
}

output "github_repo_full_name" {
  value = module.github.new_repo_full_name
}
