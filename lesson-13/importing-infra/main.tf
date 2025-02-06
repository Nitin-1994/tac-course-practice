terraform {
  required_providers {
    aws = {
      version = "~> 5.10"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Nitin_Instance" {
  ami           = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.micro"
  tags = {
    Name = "Nitin"
  }
}