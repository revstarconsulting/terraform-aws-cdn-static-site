## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_s3_bucket.static_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.static_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.static_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_logging.static_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.static_site_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.static_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.static_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.static_site_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_acm_cert_arn"></a> [acm\_cert\_arn](#input\_acm\_cert\_arn) | ACM Certification | `string` | `""` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket. | `string` | n/a | yes |
| <a name="input_default_cache_allowed_methods"></a> [default\_cache\_allowed\_methods](#input\_default\_cache\_allowed\_methods) | List of allowed methods for default cache | `list(string)` | <pre>[<br>  "HEAD",<br>  "GET",<br>  "OPTIONS"<br>]</pre> | no |
| <a name="input_default_cache_cached_methods"></a> [default\_cache\_cached\_methods](#input\_default\_cache\_cached\_methods) | List of cached methods for default cache | `list(string)` | <pre>[<br>  "HEAD",<br>  "GET"<br>]</pre> | no |
| <a name="input_default_cache_headers"></a> [default\_cache\_headers](#input\_default\_cache\_headers) | List of allowed headers for default cache | `list(string)` | <pre>[<br>  "Access-Controll-Allow-Origin",<br>  "Access-Controll-Request-Headers",<br>  "Origin"<br>]</pre> | no |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | Domain name to be mapped with CDN | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment billing tag. | `string` | n/a | yes |
| <a name="input_ordered_cache_allowed_methods"></a> [ordered\_cache\_allowed\_methods](#input\_ordered\_cache\_allowed\_methods) | List of allowed methods for ordered cache | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD",<br>  "OPTIONS"<br>]</pre> | no |
| <a name="input_ordered_cache_behaviours"></a> [ordered\_cache\_behaviours](#input\_ordered\_cache\_behaviours) | Additional cache behaviours | `map(map(string))` | `{}` | no |
| <a name="input_ordered_cache_cached_methods"></a> [ordered\_cache\_cached\_methods](#input\_ordered\_cache\_cached\_methods) | List of cached methods for ordered cache | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_ordered_cache_headers"></a> [ordered\_cache\_headers](#input\_ordered\_cache\_headers) | List of allowed headers for ordered cache | `list(string)` | <pre>[<br>  "Access-Controll-Allow-Origin",<br>  "Access-Controll-Request-Headers",<br>  "Origin"<br>]</pre> | no |
| <a name="input_origin_access_identities"></a> [origin\_access\_identities](#input\_origin\_access\_identities) | map of origin access identities | `map(string)` | `{}` | no |
| <a name="input_origins"></a> [origins](#input\_origins) | S3 origin list | `map(map(string))` | <pre>{<br>  "only-origin": {<br>    "origin_id": "only-origin"<br>  }<br>}</pre> | no |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | WAF Web ACL ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | CloudFront Distribution ID |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | The domain name corresponding to the distribution. |
| <a name="output_s3_bucket_regional_domain_name"></a> [s3\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_regional\_domain\_name) | n/a |
| <a name="output_s3_canonical_user_ids"></a> [s3\_canonical\_user\_ids](#output\_s3\_canonical\_user\_ids) | n/a |
| <a name="output_static_site_s3_bucket_name"></a> [static\_site\_s3\_bucket\_name](#output\_static\_site\_s3\_bucket\_name) | The name of the bucket. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | zone id for route53 alias record |
