 provider "aws" {
  profile = "default"
  region  = var.region
  shared_credentials_file = "C:/Users/.aws/credentials"
}

resource "aws_s3_bucket" "b" {
  bucket = "zs-ramprasad"
  acl    = "private"

  tags = {
    Name        = "zs-ramprasad"
  }
}