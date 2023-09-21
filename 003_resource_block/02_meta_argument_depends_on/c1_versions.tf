# Terraform Block (CLI Locking)
terraform {
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block (Initializing region and credentials)
provider "aws" {
  region = "us-east-1"
  profile = "default"
}