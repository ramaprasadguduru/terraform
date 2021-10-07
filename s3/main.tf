  terraform {
   backend "s3" {
     bucket = "zs-ramprasad"
     key    = "terraform.tfstate"
     region = "us-east-1"
     profile = "default"
     shared_credentials_file = "C:/Users/.aws/credentials"
   }

    required_providers {
     aws = {
        source  = "hashicorp/aws"
        version = "~> 3.27"
      }
    }

    required_version = ">= 0.14.9"
  }
  
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