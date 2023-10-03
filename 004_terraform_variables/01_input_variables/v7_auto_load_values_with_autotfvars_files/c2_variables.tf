# Input Variable (Assigning three variables)
# In this case we will override the default values with the help of somename.auto.tfvars file
# When we do not use anyname.auto.tfvars file we do not need to use the -var-file cli argument
# anyname.auto.tfvars file is equivalent to terraform.tfvars file

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
  default     = 2 # We will override it to 1 using terrafrom.tfvars file
}
variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t1.micro" # We will override it to t2.micro using web.auto.tfvars file
}
