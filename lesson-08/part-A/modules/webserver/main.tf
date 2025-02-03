terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50"
    }
  }
  required_version = ">= 1.4.0"

}



resource "aws_subnet" "user_subnet" {
  cidr_block = var.user_cidr_block
  vpc_id = var.user_vpc_id
  tags = {
    Name = var.user_subnet_name
  }
 
}

resource "aws_instance" "user_instance" {
  ami = var.user_ami
  subnet_id = aws_subnet.user_subnet.id
  instance_type = var.user_instance_type
 
tags = {
  Name = var.user_instance_name
}
}

