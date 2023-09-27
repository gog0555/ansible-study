module "network" {
  source = "../../modules/network"

  env  = var.env
  name = var.name

  cidr_block = var.cidr_block
  vpc_id     = module.network.vpc_id
}

module "ec2" {
  source = "../../modules/ec2"

  env  = var.env
  name = var.name

  vpc_id             = module.network.vpc_id
  public_subnet1a_id = module.network.public_subnet1a_id
  private_subnet1a_id = module.network.private_subnet1a_id

  instance_ami  = var.instance_ami
  instance_type = var.instance_type
}
