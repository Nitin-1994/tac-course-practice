terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20"
    }
  }

  required_version = ">= 1.2.8"
}
provider "aws" {
  region = var.REGION_NAME
}


resource "aws_instance" "Nitin_lesson_07" {
  ami           = var.ami_name
  instance_type = var.INSTANCE_TYPE
  tags = {
    Name = var.instance_name
  }
}

