terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "Nitin_first_terraform_server" {
  ami           = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"

  tags = {
    Name = "Nitin_first_server"

  }
}

