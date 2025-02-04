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

locals {
  INGRESS = [[22, 80], [443, 553]]
  EGRESS  = [[4001, 2201], [3389]]
  TAGS    = ["Group1", "Group2"]
  NAMES   = ["SG1", "SG2"]
}

resource "aws_security_group" "multiple_groups" {
  count = 2
  name  = local.NAMES[count.index]
  dynamic "ingress" {
    for_each = local.INGRESS[count.index]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }

  }

  dynamic "egress" {
    for_each = local.EGRESS[count.index]
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }

  }

  tags = {

    Type = local.TAGS[count.index]
  }

}