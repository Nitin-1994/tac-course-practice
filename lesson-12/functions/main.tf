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

resource "aws_iam_user" "Killer" {
  name = "Killer"
  tags = {
    "Creation_time" = timestamp()
    "UTC_Time" = formatdate("MM/DD/YYYY ZZZ",timestamp())
  }
}