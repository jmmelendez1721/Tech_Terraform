provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "Instancia_Tech" {
  ami           = "ami-09040d770ffe2224f" 
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-033cf204cc674d9a9"]              
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
  identifier           = "mydb"
  username             = "DB_user_Admin"
  password             = "DB_Pass123"  
  vpc_security_group_ids = ["sg-033cf204cc674d9a9"]  
  db_subnet_group_name = "default-vpc-06862378f922aad26"

  skip_final_snapshot  = true
  tags = {
    Name = "TechRDSInstance"
  }
}