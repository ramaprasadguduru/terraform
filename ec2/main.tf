provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_jinstance" "rama" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}