# Input Variable for AWS Region
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

# App Name s3 bucket used for
variable "app_name" {
  description = "Application Name"
  type        = string
  # Won't assign default value as we want to take it from the CLI
}

# Environment name
variable "env_name" {
  description = "Environment Name"
  type        = string
  # Won't assign default value as we want to take it from the CLI 
}