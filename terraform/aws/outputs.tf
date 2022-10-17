output "ami" {
  description = "Name of the AMI image."
  value       = aws_instance.app_server.ami
}

output "public_ip" {
  description = "Public IP of the EC2."
  value       = aws_instance.app_server.public_ip
}
