provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "rama" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
    Name = "rama"
  }
}

 resource "aws_instance" "app_server" {
-  ami           = "ami-830c94e3"
+  ami           = "ami-08d70e59c07c61a3a"
   instance_type = "t2.micro"
 }