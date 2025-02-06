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

resource "aws_instance" "Nitin_Sati" {
  ami           = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  tags = {
    Name = "Instance-2"
  }
}