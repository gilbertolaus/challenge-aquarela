data "aws_s3_bucket" "existing" {
  bucket = "meu-bucket-publico-devsecops"
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "meu-bucket-publico-devsecops"

  count = length(data.aws_s3_bucket.existing.id) == 0 ? 1 : 0
}

# ACL para acesso público
resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

# Política de bucket para permitir acesso público (opcional)
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.public_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.public_bucket.arn}/*"
      }
    ]
  })
}