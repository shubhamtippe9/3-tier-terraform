region = "ap-south-1"

vpc_cidr = "10.0.0.0/16"
vpc_name = "my-vpc"

public_cidr = "10.0.1.0/24"
public_az   = "ap-south-1a"
public_subnet_name = "public-subnet"

private_cidr = "10.0.2.0/24"
private_az   = "ap-south-1b"
private_subnet_name = "private-subnet"

igw_name = "my-igw"
nat_name = "my-nat"
nat_rt_name = "private-rt"

ami           = "ami-0f5ee92e2d63afc18"
instance_type = "t2.micro"
key_name      = "your-key"

app_sg_id = "sg-xxxxxxxx"   # 🔥 replace

db_password = "Password123"
db_sg_id    = "sg-yyyyyyyy" # 🔥 replace