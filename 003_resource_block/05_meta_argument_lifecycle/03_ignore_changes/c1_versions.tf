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

# Provider Block (Setting Resource and Credentials)
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}