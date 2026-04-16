resource "aws_db_subnet_group" "db_subnet" {
  name = "db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "db" {
  allocated_storage = 10
  engine = "mariadb"
  instance_class = "db.t4g.micro"
  db_name = "studentapp"
  username = "arya"
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [var.db_sg_id]

  skip_final_snapshot = true
}