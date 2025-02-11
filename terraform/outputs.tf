output "s3_bucket_endpoint" {
  value = aws_s3_bucket.public_bucket.bucket_domain_name
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.devsecops_table.name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_public_ip" {
  value = aws_instance.example.public_ip  # Só se EC2 for criada
}