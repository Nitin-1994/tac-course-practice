terraform {
  required_providers {
    aws = {
      version = ">= 5.46"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.18.1"
  name            = var.nits_vpc_name
  cidr            = var.nits_vpc_cidr
  azs             = var.nits_azs
  private_subnets = var.nits_private_subnets_cidr
  public_subnets  = var.nits_public_subnets_cidr
}

module "ec2-instance" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "5.7.1"
  ami           = var.nits_ami
  instance_type = var.nits_instance_type
  subnet_id     = module.vpc.public_subnets[0]
}