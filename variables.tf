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

locals {
  common_tags = {
    environment = var.environment
  }
}
