# APP SERVER
resource "aws_instance" "app_server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.app_sg_id]

  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y java-17-amazon-corretto python3 mariadb105 curl

cd /opt
curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.tar.gz
tar -xzf apache-tomcat-9.0.115.tar.gz

/opt/apache-tomcat-9.0.115/bin/catalina.sh start

cd /opt/apache-tomcat-9.0.115/webapps/
curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war

cd /opt/apache-tomcat-9.0.115/lib/
curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar

until mysqladmin ping -h ${var.db_endpoint} -u arya -p${var.db_password} --silent; do
  sleep 10
done

cat <<EOT >> /opt/apache-tomcat-9.0.115/conf/context.xml
<Resource name="jdbc/TestDB" auth="Container"
username="arya"
password="${var.db_password}"
driverClassName="com.mysql.jdbc.Driver"
url="jdbc:mysql://${var.db_endpoint}:3306/studentapp"/>
EOT

/opt/apache-tomcat-9.0.115/bin/catalina.sh restart
EOF

  tags = { Name = var.app_instance_name }
}

# DB CLIENT
resource "aws_instance" "db_client" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [var.app_sg_id]

  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y mariadb105

until mysqladmin ping -h ${var.db_endpoint} -u arya -p${var.db_password} --silent; do
  sleep 10
done

mysql -h ${var.db_endpoint} -u arya -p${var.db_password} <<MYSQL
CREATE DATABASE IF NOT EXISTS studentapp;
USE studentapp;

CREATE TABLE IF NOT EXISTS students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(100),
student_addr VARCHAR(100),
student_age VARCHAR(3),
student_qual VARCHAR(20),
student_percent VARCHAR(10),
student_year_passed VARCHAR(10)
);
MYSQL
EOF

  tags = { Name = var.db_instance_name }
}