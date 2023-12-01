resource "aws_vpc" "terraform_demo_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

/*
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terraform-demo-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.0.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  #enabling dns hostnames to be used
  enable_dns_hostnames = true
  #enabling dns resolution to be used
  enable_dns_support = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}*/
