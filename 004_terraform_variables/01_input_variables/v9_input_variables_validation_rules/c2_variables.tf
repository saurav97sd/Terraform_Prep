# Input Variable (Assigning three variables)
# Here we will add custom validation rule for our ec2_ami_id but to do that we need to learn some terraform functions
/*
Terraform Console - We can use terraform console to test/experiment some function or logic before using them in our code.
Terraform Functions - 
1. Length Function - This fuction gives us the length of a string, list or a map
>> terraform console
>> lenght("hi") #2 - length of srting
>> lenght(["a", "b", "c"]) #3 - length of list
>> lenght({"key" = "value"}) #1 - length of map
>> ^c

2. substr Function - substr extracts a substring from a given string by offset and length
Syntax - substr(string, offset, length)
Example - substr("hello world", 1, 4) #ello - output
*/

variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

# We will apply custom validation rule on this variable
variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-03a6eaae9938c858c" # Amazon Linux AMI ID
  # use control+space for tips
  validation {
    condition     = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == "ami-"
    error_message = "The ec2_ami_id must be a valid AMI ID, starting with \"ami-\"."
  }
}

variable "ec2_instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
}
variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
