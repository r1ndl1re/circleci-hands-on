resource "aws_s3_bucket" "private" {
  bucket = "private-pragmatic-terraform-r1ndl1re"
  acl    = "private"

  versioning {
    enabled = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    "CreatedAt" = "20220112"
  }
}

resource "aws_s3_bucket_public_access_block" "private" {
  bucket                  = aws_s3_bucket.private.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "alb_log" {
  bucket        = "alb-log-r1ndl1re"
  acl           = "private"
  force_destroy = true

  lifecycle_rule {
    enabled = true
    expiration {
      days = 2
    }
  }
}
