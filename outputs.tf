output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.website.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.website.arn
}

output "website_endpoint" {
  description = "Website endpoint for the S3 bucket"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "website_domain" {
  description = "Domain name of the website endpoint"
  value       = aws_s3_bucket_website_configuration.website.website_domain
}

output "custom_domain_url" {
  description = "Custom domain URL (if configured)"
  value       = var.domain_name != "" ? "http://${var.subdomain != "" ? "${var.subdomain}." : ""}${var.domain_name}" : null
}

output "route53_record_fqdn" {
  description = "FQDN of the Route53 record (if created)"
  value       = var.domain_name != "" ? aws_route53_record.website[0].fqdn : null
}