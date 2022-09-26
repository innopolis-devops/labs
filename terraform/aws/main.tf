resource "aws_instance" "app_server" {
  ami           = var.aws_ami
  instance_type = "t3.nano"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}