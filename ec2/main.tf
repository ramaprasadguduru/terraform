provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "ram" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
<<<<<<< HEAD
    Name = "prasad"
  }
}

=======
    Name = var.instance_name
  }
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ram.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ram.public_ip
}
>>>>>>> 61795362093ce4eae6869df33b43f3b92183d48c
