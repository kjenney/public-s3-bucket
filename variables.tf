variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the website (e.g., example.com). Leave empty to skip Route53 configuration."
  type        = string
  default     = ""
}

variable "subdomain" {
  description = "Subdomain for the website (e.g., www). Leave empty to use the root domain."
  type        = string
  default     = ""
}

variable "site_title" {
  description = "Title for the website"
  type        = string
  default     = "My Website"
}

variable "site_header" {
  description = "Header text for the website"
  type        = string
  default     = "Welcome to My Website"
}