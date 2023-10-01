# Input Variable (Assigning three variables)
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}
variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-03a6eaae9938c858c" # Amazon Linux AMI ID
}
variable "ec2_instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
}

# We are trying to assign the value of the variable when prompted when we run terraform plan/apply
# So we will not assign any default value for the following variable
variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}