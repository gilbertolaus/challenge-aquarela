resource "aws_s3_bucket" "public_bucket" {
  bucket = "bucket-public-devsecops"
}

resource "aws_s3_bucket_ownership_controls" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.public_bucket]
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "public_access" {
  depends_on = [aws_s3_bucket_acl.public_bucket_acl]
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