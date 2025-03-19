variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for RDS"
  type        = list(string)
}

variable "asg_sg_id" {
  description = "Security Group ID of ASG instances (to allow DB access)"
  type        = string
}

variable "db_engine" {
  description = "Database engine (mysql/postgresql)"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type for RDS"
  type        = string
}

variable "db_username" {
  description = "Database admin username"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Database port"
  type        = number
}

variable "db_storage" {
  description = "Storage size for RDS"
  type        = number
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
}

variable "db_family" {
  description = "Database family for parameter group"
  type        = string
}
