resource "aws_db_instance" "rds_instance" {
  identifier             = "${var.project_name}-rds"
  allocated_storage      = var.db_storage
  storage_type           = "gp2"
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  multi_az             = var.multi_az
  publicly_accessible  = false
  backup_retention_period = 7
  skip_final_snapshot  = true
  apply_immediately    = true
  parameter_group_name = aws_db_parameter_group.rds_pg.name

  tags = {
    Name = "${var.project_name}-rds"
  }
}
