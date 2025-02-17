output "s3_bucket_endpoint" {
  value = try(
    data.aws_s3_bucket.existing_bucket[0].bucket_domain_name,
    try(aws_s3_bucket.public_bucket[0].bucket_domain_name, null)
  )
}

output "dynamodb_table_name" {
  value = try(
    data.aws_dynamodb_table.existing_table[0].name,
    try(aws_dynamodb_table.devsecops_table[0].name, null)
  )
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_public_ip" {
  value = try(aws_instance.example[0].public_ip, null)
}