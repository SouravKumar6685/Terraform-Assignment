resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.project_name}-redis-subnet-group"
  }
}
