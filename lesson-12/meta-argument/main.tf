terraform {
  required_providers {
    aws = {
      version = "~> 4.16"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Nitin_Sati_Instance" {
  ami           = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"

  tags = {
    Name = "Nitin_Sati_Instance"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_user" "multi_users1" {
  for_each = toset(["Nitin_User_1", "Nitin_User_2"])
  name = each.key
  depends_on = [ aws_instance.Nitin_Sati_Instance ]
  
  }



    resource "aws_iam_user" "multi_users3" {
  for_each = tomap({"NAME1" = "Nitin_User_5","NAME2"="Nitin_User_6"})
  name = each.value
  
  tags = {
    Name = each.key
  }
  }

 

