resource "aws_s3_bucket" "backups" {
  bucket        = "${var.project_name}-backups-${random_id.bucket.hex}"
  force_destroy = true
}

resource "random_id" "bucket" {
  byte_length = 4
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backups" {
  bucket = aws_s3_bucket.backups.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

