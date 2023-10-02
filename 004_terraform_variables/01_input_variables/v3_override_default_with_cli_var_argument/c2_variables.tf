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


# We will try to override the default value of the following variable with -var argument
variable "ec2_instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2 # We will override it to 1
}
variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t1.micro" # We will override it to t2.micro
}

# Option 1
# terraform plan/apply -var="ec2_instance_type=t2.micro" -var="ec2_instance_count=1"

# Option 2
# terraform plan -var="ec2_instance_type=t2.micro" -var="ec2_instance_count=1" -out v3out.plan
# terraform apply v3out.plan
