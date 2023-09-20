# Terraform Block
terraform {
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block
#1st Provider for us east region (default provider)
provider "aws" { 
  region = "us-east-1"
  profile = "default"
}

#2nd Provider for us west region
provider "aws" {
    region = "us-west-1"
    profile = "default"
    alias = "aws_westus"
}