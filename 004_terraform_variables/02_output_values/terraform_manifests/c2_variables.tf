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

variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t1.micro"
}