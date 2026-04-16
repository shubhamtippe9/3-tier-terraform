module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

  public_cidr         = var.public_cidr
  public_az           = var.public_az
  public_subnet_name  = var.public_subnet_name

  private_cidr        = var.private_cidr
  private_az          = var.private_az
  private_subnet_name = var.private_subnet_name

  igw_name   = var.igw_name
  nat_name   = var.nat_name
  nat_rt_name = var.nat_rt_name
}

module "rds" {
  source = "./modules/rds"

  subnet_ids  = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
  db_password = var.db_password
  db_sg_id    = var.db_sg_id
}

module "ec2" {
  source = "./modules/ec2"

  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name

  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id

  app_sg_id         = var.app_sg_id

  db_endpoint       = module.rds.db_endpoint
  db_password       = var.db_password

  app_instance_name = "app-server"
  db_instance_name  = "db-client"
}