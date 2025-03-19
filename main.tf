terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
    backend "s3" {}
}

provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./modules/vpc"
    project_name =  module.vpc.project_name
    vpc_cidr = module.vpc.vpc_cidr
    public_subnets_cidr = module.vpc.public_subnets_cidr
    availability_zones = module.vpc.availability_zones
}

module "alb" {
  source = "./modules/alb"
  project_name = module.vpc.project_name
  vpc_id = module.vpc.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  ssl_certificate_arn = module.alb.ssl_certificate_arn
}


module "asg" {
  source               = "./modules/asg"
  project_name         = module.vpc.project_name
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  alb_target_group_arn = module.alb.alb_target_group_arn
  alb_sg_id            = module.alb.alb_sg_id
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  ssh_key_name         = var.ssh_key_name
}


module "rds" {
  source            = "./modules/rds"
  project_name      = module.vpc.project_name
  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  asg_sg_id         = module.asg.asg_sg_id
  db_engine         = "mysql"  # Change to "postgresql" if needed
  db_engine_version = "8.0"
  db_instance_class = "db.t3.micro"
  db_username       = "admin"
  db_password       = "SuperSecurePass!"
  db_port           = 3306
  db_storage        = 20
  multi_az          = true
  db_family         = "mysql8.0"
}

module "redis" {
  source             = "./modules/redis"
  project_name       = module.vpc.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnets    = module.vpc.private_subnets
  asg_sg_id          = module.asg.asg_sg_id
  redis_version      = "6.x"
  redis_instance_type = "cache.t3.micro"
  redis_node_count    = 1
  redis_family       = "redis6.x"
  redis_ttl          = 300
}
