# Terraform Block (CLI Locking)
terraform {
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block (Providing region and credentials)
provider "aws" {
  region  = var.aws_region
  profile = "default"
}