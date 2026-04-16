variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "vpc_name" {
  type = string
}

variable "public_cidr" {
  type = string
}

variable "public_az" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_cidr" {
  type = string
}

variable "private_az" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "nat_rt_name" {
  type = string
}