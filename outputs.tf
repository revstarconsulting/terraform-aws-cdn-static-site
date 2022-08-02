output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.this.domain_name
  description = "The domain name corresponding to the distribution."
}

output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.this.id
  description = "CloudFront Distribution ID"
}

output "static_site_s3_bucket_name" {
  value       = aws_s3_bucket.static_site.id
  description = "The name of the bucket."
}

output "zone_id" {
  value       = aws_cloudfront_distribution.this.hosted_zone_id
  description = "zone id for route53 alias record"
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.static_site.bucket_regional_domain_name
}

output "s3_canonical_user_ids" {
  value = aws_cloudfront_origin_access_identity.this.*.s3_canonical_user_id
}
