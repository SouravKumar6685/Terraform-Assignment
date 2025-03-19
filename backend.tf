terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"  # Replace with your unique bucket name
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "alias/my-kms-key"  # Ensure this KMS key exists
    dynamodb_table = "terraform-locks"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket"  # Ensure this is globally unique

  lifecycle {
    prevent_destroy = true  # Prevent accidental deletion
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = aws_kms_key.terraform_kms.key_id
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Production"
  }
}

resource "aws_kms_key" "terraform_kms" {
  description             = "KMS key for Terraform state encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "terraform_kms_alias" {
  name          = "alias/my-kms-key"
  target_key_id = aws_kms_key.terraform_kms.key_id
}
