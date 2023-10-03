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

# Implement Map function for instance type
/*variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = list(string)
  default     = ["t1.micro", "t2.micro", "t3.micro"]
}*/
variable "ec2_instance_type_map" {
  description = "Type of the EC2 instance"
  type        = map(string)
  default = {
    "small_app"  = "t1.micro"
    "medium_app" = "t2.micro"
    "large_app"  = "t3.micro"
  }
}

# Implement Map function for tags
variable "ec2_instance_tags" {
  description = "Tags for EC2 instance"
  type        = map(string)
  default = {
    "Name" = "EC2_VM"
    "Tier" = "Web"
  }
}
