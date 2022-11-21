output "aws_server_id" {
  description = "ID of the AWS server"
  value       = aws_instance.app_server.id
}