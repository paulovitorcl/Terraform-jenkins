## Deploy VPC Configurations

module "network" {
  source = "./modules/network"

  availability_zones       = var.availability_zones
  name                     = var.vpc_name
  vpc_cidr_block           = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
}

## Deploy EC2 Configurations

module "ec2" {
  source = "./modules/ec2"

  name               = var.name
  instance_type      = var.instance_type
  aws_security_group = [module.network.aws_security_group]
  public_subnet_id   = module.network.public_subnet_id
}


