resource "aws_s3_bucket" "static_site" {
  bucket = "${var.account_id}-${var.bucket_name}"
  tags   = local.common_tags

}

resource "aws_s3_bucket_cors_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = "3000"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "static_site" {
  bucket = aws_s3_bucket.static_site.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "static_site" {
  bucket = aws_s3_bucket.static_site.id
  acl    = "private"
}

resource "aws_s3_bucket_logging" "static_site" {
  bucket        = aws_s3_bucket.static_site.id
  target_bucket = "${var.account_id}-logging-bucket"
  target_prefix = "${var.bucket_name}/"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_acl" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.static_site
  ]
}

resource "aws_s3_bucket_policy" "static_site_bucket_policy" {
  for_each = var.origin_access_identities
  bucket   = each.value #aws_s3_bucket.static_site.id
  policy   = data.aws_iam_policy_document.static_site_bucket_policy[each.key].json

  depends_on = [
    aws_s3_bucket_public_access_block.s3_bucket_acl
  ]
  lifecycle {
    ignore_changes = [
      policy
    ]
  }
}


