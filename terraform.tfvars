region = "us-east-1"

vpc_cidr = "10.0.0.0/16"
vpc_name = "my-vpc"

public_cidr = "10.0.1.0/24"
public_az   = "us-east-1a"
public_subnet_name = "public-subnet"

private_cidr = "10.0.2.0/24"
private_az   = "us-east-1b"
private_subnet_name = "private-subnet"

igw_name = "my-igw"
nat_name = "my-nat"
nat_rt_name = "private-rt"

ami           = "ami-098e39bafa7e7303d"
instance_type = "t3.micro"
key_name      = "north"



db_password = "shubham21"
