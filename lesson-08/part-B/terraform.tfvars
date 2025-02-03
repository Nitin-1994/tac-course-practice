nits_vpc_name             = "Nitin_VPC"
nits_vpc_cidr             = "10.0.0.0/16"
nits_azs                  = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
nits_private_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
nits_public_subnets_cidr  = ["10.0.3.0/24", "10.0.4.0/24"]
nits_ami                  = "ami-05fa46471b02db0ce"
nits_instance_type        = "t2.micro"