data "aws_s3_bucket" "existing_bucket" {
  bucket = "bucket-public-devsecops"
}

resource "aws_s3_bucket" "public_bucket" {
  count  = data.aws_s3_bucket.existing_bucket.id == null ? 1 : 0
  bucket = "bucket-public-devsecops"
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

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