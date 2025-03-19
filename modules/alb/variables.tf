variable "project_name" {
    description = "Project name for resource tagging"
    type = string
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "public_subnets"{
    description = "List of public subnet IDs for ALB"
    type = list(string)
}

variable "ssl_certificate_arn"{
    description = "ARN of the SSL certificate for HTTPS"
    type = string
    default = ""
}