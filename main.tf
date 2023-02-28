resource "aws_s3_bucket" "aws_tfstate_s3_bucket" {
  bucket = "${local.resource_prefix}-tfstate-remote-s3"

  tags = {
    Name        = "${local.resource_prefix}-tfstate-remote-s3"
    Environment = "Common"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "aws_tfstate_s3_bucket_acl" {
  bucket = aws_s3_bucket.aws_tfstate_s3_bucket.id
  acl    = "private"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "aws_tfstate_s3_bucket_restrict_public" {
  bucket = aws_s3_bucket.aws_tfstate_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  lifecycle {
    prevent_destroy = true
  }
}
