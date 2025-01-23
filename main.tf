resource "aws_instance" "WebServer1" {
  ami = var.ami
  instance_type = var.instance-type
  network_interface {
    network_interface_id = aws_network_interface.nw-interface1.id
    device_index = 0
  }
  key_name = "my-ec2-key"
  user_data = <<-EOF
              #!/bin/bash
              sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm

              sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y

              sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023

              sudo dnf install mysql-community-client -y

              EOF
  tags = {
    Name="WebServer1"
  }
}
resource "aws_instance" "WebServer2" {
  ami             = "ami-06c68f701d8090592"
  instance_type   = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.nw-interface2.id
    device_index = 0
  }

  key_name = "my-ec2-key"
  user_data = <<-EOF
              #!/bin/bash
              sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm

              sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y

              sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023

              sudo dnf install mysql-community-client -y

              EOF

  tags = {
    Name = "WebServer2"
  }
}




resource "aws_db_instance" "app_database" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0.33"
  instance_class = "db.t3.micro"
  db_name = var.db_name
  identifier = var.db_name
  username = "admin"
  password = "db*pass123"
  publicly_accessible = true
  db_subnet_group_name = aws_db_subnet_group.app-db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.WebTrafficSG.id]
  tags = {
    Name = "AppDatabase"
  }
}