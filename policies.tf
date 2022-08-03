data "aws_iam_policy_document" "static_site_bucket_policy" {
  for_each = var.origin_access_identities
  statement {
    sid    = "PolicyForCloudFrontPrivateContent"
    effect = "Allow"

    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${each.value}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.this[each.key].id}"]
    }
  }
}