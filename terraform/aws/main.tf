resource "aws_instance" "app_server" {
  ami           = var.aws_ami
  instance_type = "t3.nano"
  key_name = aws_key_pair.deploy_key.key_name
  security_groups = [aws_security_group.app_sg.name]
  iam_instance_profile = "ec2-role"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_key_pair" "deploy_key" {
  key_name   = "deploy_key"
  public_key = var.deploy_public_key
}

resource "aws_security_group" "app_sg" {
  name = "app_sg"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
