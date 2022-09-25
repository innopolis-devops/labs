output "instance" {
  description = "ID of the Docker container"
  value       = aws_instance.app_server.id
}
