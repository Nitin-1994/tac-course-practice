# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~>5.84.0"
#     }
#     required_version = ">= 1.20.0"
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }

  required_version = ">= 1.2.0"
}