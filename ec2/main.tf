provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "ram" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ram.public_ip
}
