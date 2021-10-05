provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQ6XBELDQ3XFV3SHT"
  secret_key = "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"
}

resource "aws_vpc" "vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = "192.168.1.0/24"
  
    tags = {
      Name = "public2"
    }
  }
  

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.3.0/24"

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = "192.168.3.0/24"
  
    tags = {
      Name = "private2"
    }
  }

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_eip" "ip" {
    vpc      = true
  }

  resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.ip.id
    subnet_id     = aws_subnet.private1.id
  
    tags = {
      Name = "NGW1"
    }
  
  }

  resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.ip.id
    subnet_id     = aws_subnet.private2.id
  
    tags = {
      Name = "NGW2"
    }
  
  }

  resource "aws_route_table" "routetable1" {
    vpc_id = aws_vpc.vpc.id
  
    route = [
      {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
      }

      tags = {
        Name = "custom"
      }
    
    }

    resource "aws_route_table" "routetable2" {
        vpc_id = aws_vpc.vpc.id
      
        route = [
          {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.ngw.id
          }
    
          tags = {
            Name = "main"
          }
        
        }