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

resource "aws_security_group" "multiple_groups" {
  for_each = var.multi_group_names
  name     = each.key

}