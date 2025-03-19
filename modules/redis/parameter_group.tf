resource "aws_elasticache_parameter_group" "redis_pg" {
  name   = "${var.project_name}-redis-pg"
  family = var.redis_family

  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }

  parameter {
    name  = "timeout"
    value = var.redis_ttl
  }
}
