/* 
AWS instance - ami, SG, tag
2 security group - ssh , https


*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50"
    }
  }
  required_version = ">= 1.4.0"

}

provider "aws" {
  region = "ap-south-1"
  
}

resource "aws_instance" "Nitin_SG_Instance" {

  ami                    = "ami-0b7207e48d1b6c06f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.https_sg.id,
    aws_security_group.ssh_sg.id
    ]


  tags = {
    Name = "Nitin_Instance"
  }
}


resource "aws_security_group" "ssh_sg" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_security_group" "https_sg" {
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}