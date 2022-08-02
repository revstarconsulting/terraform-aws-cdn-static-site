variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "environment" {
  description = "The environment billing tag."
  type        = string
}
variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "acm_cert_arn" {
  description = "ACM Certification"
  type        = string
  default     = ""

}

variable "web_acl_id" {
  description = "WAF Web ACL ID"
  type        = string
  default     = ""
}

variable "domain_names" {
  description = "Domain name to be mapped with CDN"
  type        = list(string)
  default     = []

}

variable "ordered_cache_behaviours" {
  description = "Additional cache behaviours"
  type        = map(map(string))
  default     = {}
}

variable "origins" {
  description = "S3 origin list"
  type        = map(map(string))
  default = {
    "only-origin" = {
      "origin_id" = "only-origin"
    }
  }
}

variable "origin_access_identities" {
  description = "map of origin access identities"
  type        = map(string)
  default     = {}
}


variable "default_cache_allowed_methods" {
  description = "List of allowed methods for default cache"
  type        = list(string)
  default     = ["HEAD", "GET", "OPTIONS"]
}

variable "default_cache_cached_methods" {
  description = "List of cached methods for default cache"
  type        = list(string)
  default     = ["HEAD", "GET"]
}

variable "default_cache_headers" {
  description = "List of allowed headers for default cache"
  type        = list(string)
  default = [
    "Access-Controll-Allow-Origin",
    "Access-Controll-Request-Headers",
    "Origin",
  ]
}

variable "ordered_cache_headers" {
  description = "List of allowed headers for ordered cache"
  type        = list(string)
  default = [
    "Access-Controll-Allow-Origin",
    "Access-Controll-Request-Headers",
    "Origin",
  ]
}
variable "ordered_cache_allowed_methods" {
  description = "List of allowed methods for ordered cache"
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "ordered_cache_cached_methods" {
  description = "List of cached methods for ordered cache"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

locals {
  common_tags = {
    environment = var.environment
  }
}
