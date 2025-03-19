resource "aws_db_parameter_group" "rds_pg" {
  name   = "${var.project_name}-rds-pg"
  family = var.db_family

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }
}
