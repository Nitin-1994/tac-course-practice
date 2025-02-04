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

resource "aws_iam_user" "multi_users" {
  for_each = local.user_names
  name     = each.value
  tags     = local.my_tags
}

locals {
  user_names = toset(
    ["User1",
      "User2",
    "User3"]
  )

  my_tags = {

    type            = "user",
    created_by       = "Nitin",
    time_of_creation = timestamp()
    

  }

}
