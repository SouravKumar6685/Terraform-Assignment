variable "project_name" {
    description = "Project name to tag AWS resources"
    type        = string
    default     = "myterraformproject"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
    description = "CIDR blocks for public subnets"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr"{
    description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
    description = "List of availability zones"
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
}

