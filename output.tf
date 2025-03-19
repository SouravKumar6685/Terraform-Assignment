output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.id
}

output "kms_key_id" {
  value = aws_kms_key.terraform_kms.key_id
}
