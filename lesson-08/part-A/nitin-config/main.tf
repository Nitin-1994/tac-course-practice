provider "aws" {
  region = var.nit_region_name
}

resource "aws_vpc" "nit_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

module "nit_webserver_module" {
  source = "../modules/webserver"
  user_cidr_block = "10.0.0.0/24"
  user_vpc_id = aws_vpc.nit_vpc.id
  user_ami = var.nit_ami
  user_instance_name = var.nit_instance_name
  user_instance_type = var.nit_instance_type
  user_subnet_name = var.nit_subnet_name
}