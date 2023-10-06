# Create S3 bucket - with input variables
/*
resource "aws_s3_bucket" "mys3bucket" {
  bucket = "${var.app_name}-${var.env_name}-bucket"
  # acl = "private" (depriciated)
  tags = {
    "Name" = "${var.app_name}-${var.env_name}-bucket"
    "Environment" = var.env_name
  }
}
*/

# Define Local Values
locals {
  bucket_name = "${var.app_name}-${var.env_name}-bucket" # Complex Expression
}

# Create S3 bucket - with local variables
resource "aws_s3_bucket" "mys3bucket" {
  bucket = local.bucket_name
  # acl = "private" (depriciated)
  tags = {
    "Name"        = local.bucket_name
    "Environment" = var.env_name
  }
}