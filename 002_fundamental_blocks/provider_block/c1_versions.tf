# Terraform Block (CLI Locking)
terraform {
    #CLI Locking
  required_version = "~> 1.5.0"
  
  # Initializing Provider and which version to use
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block for defining region and credential
provider "aws" {
  region = "us-east-1"
  profile = "default"
}