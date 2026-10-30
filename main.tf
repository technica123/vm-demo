
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
}

module "security_group" {
  source       = "./modules/security-group"
  vpc_id       = module.vpc.vpc_id
  admin_cidr   = var.admin_cidr
  project_name = var.project_name
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name
  project_name      = var.project_name
  ami_id            = var.ami_id
}
