variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for Redis"
  type        = list(string)
}

variable "asg_sg_id" {
  description = "Security Group ID of ASG instances (to allow Redis access)"
  type        = string
}

variable "redis_version" {
  description = "Redis engine version"
  type        = string
}

variable "redis_instance_type" {
  description = "Redis instance type"
  type        = string
}

variable "redis_node_count" {
  description = "Number of Redis cache nodes"
  type        = number
}

variable "redis_family" {
  description = "Redis family for parameter group"
  type        = string
}

variable "redis_ttl" {
  description = "TTL (Time-To-Live) for Redis caching"
  type        = number
}
