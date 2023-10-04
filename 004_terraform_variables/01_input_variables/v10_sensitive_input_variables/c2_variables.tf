# Variable Block - Providing Input variable
variable "aws_region" {
  description = "Region in which AWS Resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "db_username" {
  description = "AWS RDs Database Administrator Username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "AWS RDs Database Administrator Password"
  type        = string
  sensitive   = true
}