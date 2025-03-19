output "rds_endpoint" {
  description = "RDS Instance Endpoint"
  value       = aws_db_instance.rds_instance.endpoint
}
