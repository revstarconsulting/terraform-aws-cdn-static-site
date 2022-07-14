data "aws_iam_policy_document" "static_site_bucket_policy" {
  for_each = var.origin_access_identities
  statement {
    sid    = "PolicyForCloudFrontPrivateContent"
    effect = "Allow"

    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${each.value}/*"]

    principals {
      type        = "CanonicalUser"
      identifiers = [aws_cloudfront_origin_access_identity.this[each.key].s3_canonical_user_id]
    }
  }
}