resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "${var.project_name}-redis"
  engine              = "redis"
  node_type           = var.redis_instance_type
  num_cache_nodes     = var.redis_node_count
  parameter_group_name = aws_elasticache_parameter_group.redis_pg.name
  engine_version      = var.redis_version
  port               = 6379
  subnet_group_name  = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids = [aws_security_group.redis_sg.id]
  apply_immediately  = true

  tags = {
    Name = "${var.project_name}-redis"
  }
}
