# Terraform Block (CLI Locking)
terraform {
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Adding backend as S3 for Remote State Storage
  # https://developer.hashicorp.com/terraform/language/settings/backends/s3
  backend "s3" {
    bucket = "terraform-statecommands"
    key    = "statecommands/terraform.tfstate" # dev is the folder which we created after creating S3 bucket in AWS portal
    region = "us-east-1"
    # For state locking
    dynamodb_table = "terraform-test-state-commands"
  }

}

# Provider Block (Used to initialize the region and provide credentials)
provider "aws" {
  region  = var.aws_region
  profile = "default"
}