terraform {
  required_providers {
    aws = {
      version = "~> 4.60"
      source  = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "nitin_ami" {
  owners      = ["137112412989"]
  most_recent = true
  tags = {
    Platform = "Linux/UNIX"
  }
}

resource "aws_instance" "Nitin_Instance" {
  ami           = data.aws_ami.nitin_ami.id
  instance_type = "t2.micro"
}