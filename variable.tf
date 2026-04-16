variable "region" {}

# VPC
variable "vpc_cidr" {}
variable "vpc_name" {}

variable "public_cidr" {}
variable "public_az" {}
variable "public_subnet_name" {}

variable "private_cidr" {}
variable "private_az" {}
variable "private_subnet_name" {}

variable "igw_name" {}
variable "nat_name" {}
variable "nat_rt_name" {}

# EC2
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}

variable "app_sg_id" {}

# RDS
variable "db_password" {}
variable "db_sg_id" {}