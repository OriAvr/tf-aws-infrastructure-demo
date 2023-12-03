resource "aws_db_instance" "default_rds" {
  allocated_storage      = 10
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_subnet.rds_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_rds_inbound.id]
  skip_final_snapshot    = true // required to destroy
}
