resource "aws_cloudfront_origin_access_identity" "this" {
  for_each = var.origin_access_identities
  comment  = "access-identity-${each.value}.s3.amazonaws.com"
}

resource "aws_cloudfront_distribution" "this" {
  tags    = local.common_tags
  enabled = true



  price_class         = "PriceClass_All"
  default_root_object = "index.html"
  http_version        = "http2"

  default_cache_behavior {
    target_origin_id       = "only-origin"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    compress               = true
    allowed_methods        = var.default_cache_allowed_methods
    cached_methods         = var.default_cache_cached_methods
    forwarded_values {
      query_string = true
      headers      = var.default_cache_headers

      cookies {
        forward = "none"
      }
    }
  }


  dynamic "origin" {
    for_each = var.origins
    content {
      domain_name = lookup(origin.value, "s3_domain_name", aws_s3_bucket.static_site.bucket_regional_domain_name)
      origin_id   = lookup(origin.value, "origin_id", "only-origin")

      s3_origin_config {
        origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.this[origin.key].id}"
      }

      origin_path = lookup(origin.value, "origin_path", "/build")
    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behaviours
    iterator = order
    content {
      path_pattern     = order.value["path_pattern"]
      allowed_methods  = var.ordered_cache_allowed_methods
      cached_methods   = var.ordered_cache_cached_methods
      target_origin_id = order.value["origin_id"]

      forwarded_values {
        query_string = true
        headers      = var.ordered_cache_headers

        cookies {
          forward = "none"
        }
      }

      compress               = true
      viewer_protocol_policy = "redirect-to-https"
    }
  }

  logging_config {
    include_cookies = false
    bucket          = "${var.account_id}-logging-bucket.s3.amazonaws.com"
    prefix          = "cloudfront/${var.bucket_name}/"
  }
  aliases = length(var.domain_names) > 0 ? var.domain_names : null


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.acm_cert_arn == "" ? true : false
    acm_certificate_arn            = var.acm_cert_arn != "" ? var.acm_cert_arn : null
    ssl_support_method             = length(var.domain_names) > 0 ? "sni-only" : null
    minimum_protocol_version       = var.acm_cert_arn != "" ? "TLSv1.2_2019" : "TLSv1"
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/"
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 403
    response_code         = 200
    response_page_path    = "/"
  }
  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 400
    response_code         = 200
    response_page_path    = "/"
  }

  web_acl_id = var.web_acl_id != "" ? var.web_acl_id : null
  depends_on = [
    aws_s3_bucket.static_site
  ]
}
