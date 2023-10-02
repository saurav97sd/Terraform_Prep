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


# We will try to override the default value of the following variable with environment varianles
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

# Set environment variable
/*
export TF_VAR_ec2_instance_count=1
export TF_VAR_ec2_instance_type=t2.micro

#### - If using powershell use the below commands - ####
Set-Item -Path Env:TF_VAR_ec2_instance_count -Value 1
Set-Item -Path Env:TF_VAR_ec2_instance_type -Value "t2.micro"

echo $TF_VAR_ec2_instance_count, $TF_VAR_ec2_instance_type (Checking the env variables in bash)
Get-Item -Path Env:\TF* (Checking env variables in powershell)
*/

# Run terraform general workflow commands init --> validate --> fmt --> plan --> apply --> destroy

# Unset environment variables 
/*
In Bash------------
unset TF_VAR_ec2_instance_count
unset TF_VAR_ec2_instance_type
echo $TF_VAR_ec2_instance_count, $TF_VAR_ec2_instance_type

In Powershell----------------------------
Remove-Item -Path Env:\TF* -Verbose
Get-Item -Path Env:\TF*
*/