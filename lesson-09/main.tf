terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }

  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "multi_users" {
  
for_each = var.names
name = each.value

}

resource "aws_iam_group" "multi_groups" {
  count = "${length(var.groups)}"
  name = "${element(var.groups,count.index)}"
  
}