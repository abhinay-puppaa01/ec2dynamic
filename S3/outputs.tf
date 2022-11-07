output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3_bucket.arn
  description = "The bucket ARN."
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.s3_bucket.id
  description = "The bucket name (ID)."
}

output "tags" {
  value       = aws_s3_bucket.s3_bucket.tags
  description = "Tags applied to the resources created by this module."
}

output "s3_bucket_domain" {
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
  description = "The bucket domain name."
}
 
output "s3_bucket_regional_domain_name" {
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
}