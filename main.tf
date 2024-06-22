provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "Instancia_Tech" {
  ami           = "ami-09040d770ffe2224f" 
  instance_type = "t2.micro"
  vpc_security_group_ids = ["security_group"]              
  tags = {
    Name = "TechInstancia"
  }
}
resource "aws_db_instance" "DB_Tech" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  identifier           = "DB_Tech"
  username             = "DB_Admin"
  password             = "DB_Pass"  
  vpc_security_group_ids = ["security_group"]  
  db_subnet_group_name = "subnet_group"

  skip_final_snapshot  = true
}