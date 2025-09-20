# Public S3 Bucket Website with Custom Domain

This Terraform configuration creates a publicly accessible S3 bucket configured for static website hosting with optional custom domain support via Route53.

## Features

- S3 bucket configured for static website hosting
- Public read access for website content
- Optional custom domain with Route53 DNS configuration
- Automatic upload of index.html file

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0
- Domain hosted in Route53 (only if using custom domain)

## Variables

| Variable | Description | Type | Default | Required |
|----------|-------------|------|---------|----------|
| `aws_region` | AWS region for resources | string | `us-east-1` | No |
| `bucket_name` | Name of the S3 bucket (must be globally unique) | string | - | Yes |
| `domain_name` | Domain name for the website (e.g., example.com). Leave empty to skip Route53 configuration. | string | `""` | No |
| `subdomain` | Subdomain for the website (e.g., www). Leave empty to use the root domain. | string | `""` | No |

## Usage

### Basic Usage (S3 only)

```hcl
module "public_bucket" {
  source = "."

  bucket_name = "my-unique-bucket-name"
}
```

### With Custom Domain

```hcl
module "public_bucket" {
  source = "."

  bucket_name  = "my-unique-bucket-name"
  domain_name  = "example.com"
  subdomain    = "www"  # Optional, creates www.example.com
}
```

### Using terraform.tfvars

Create a `terraform.tfvars` file:

```hcl
bucket_name = "my-unique-bucket-name"
domain_name = "example.com"
subdomain   = "www"
aws_region  = "us-west-2"
```

## Deployment

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Plan the deployment:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Outputs

| Output | Description |
|--------|-------------|
| `bucket_name` | Name of the S3 bucket |
| `bucket_arn` | ARN of the S3 bucket |
| `website_endpoint` | Website endpoint for the S3 bucket |
| `website_domain` | Domain name of the website endpoint |
| `custom_domain_url` | Custom domain URL (if configured) |
| `route53_record_fqdn` | FQDN of the Route53 record (if created) |

## Important Notes

- The bucket name must be globally unique across all AWS accounts
- If using a custom domain, the domain must already be hosted in Route53
- The S3 bucket will be configured for public read access
- Static website hosting is enabled with index.html as the default document
- DNS propagation may take some time after deployment

## Clean Up

To destroy the resources:

```bash
terraform destroy
```

**Warning**: This will permanently delete the S3 bucket and all its contents.