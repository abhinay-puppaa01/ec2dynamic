resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags  = merge({ "Name" = var.bucket_name }, var.tags)
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_logging" "this" {
  count  = var.enable_logging ? 1 : 0
  bucket        = aws_s3_bucket.s3_bucket.id
  target_bucket = var.logging_bucket
  target_prefix = "${var.bucket_name}/"
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration { 
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

#tfsec:ignore:aws-s3-encryption-customer-key We don't do CMK for S3 encryption.
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}