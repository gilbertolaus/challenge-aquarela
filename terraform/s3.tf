data "aws_s3_bucket" "existing_bucket" {
  count  = 1
  bucket = "bucket-public-devsecops"
}

resource "aws_s3_bucket" "public_bucket" {
  count  = data.aws_s3_bucket.existing_bucket[0].id != null ? 0 : 1
  bucket = "bucket-public-devsecops"
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  count  = data.aws_s3_bucket.existing_bucket[0].id != null ? 0 : 1
  bucket = data.aws_s3_bucket.existing_bucket[0].id != null ? data.aws_s3_bucket.existing_bucket[0].id : aws_s3_bucket.public_bucket[0].id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "public_access" {
  count  = data.aws_s3_bucket.existing_bucket[0].id != null ? 0 : 1
  bucket = data.aws_s3_bucket.existing_bucket[0].id != null ? data.aws_s3_bucket.existing_bucket[0].id : aws_s3_bucket.public_bucket[0].id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${data.aws_s3_bucket.existing_bucket[0].id != null ? data.aws_s3_bucket.existing_bucket[0].arn : aws_s3_bucket.public_bucket[0].arn}/*"
      }
    ]
  })
}