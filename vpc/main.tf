terraform {
  backend "remote" {
    organization = "zelarsoftprivatelimited"

    workspaces {
      name = "sample"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }