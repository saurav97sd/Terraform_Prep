# Define Output Values
# We can check what all arguments and attributes we can reference from the Terraform document below -
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference

# Attribute Reference : EC2 Instance Public IP
output "ec2_instance_publicip" {
  description = "Public IP of EC2 Instance"
  value       = aws_instance.my_vm.public_ip
}

# Argument Reference : EC2 Instance Private IP
output "ec2_instance_privateip" {
  description = "Private IP of EC2 Instance"
  value       = aws_instance.my_vm.private_ip
}

# Argument Reference : Security Groups associated with to EC2 instance
output "ec2_security_groups" {
  description = "List Security Groups associated with to EC2 Instance"
  value       = aws_instance.my_vm.security_groups
}

# Attribute Reference : Create Public DNS URL with http:// appended
output "ec2_publicdns" {
  description = "Public DNS URL of an EC2 Instance"
  value       = "http://${aws_instance.my_vm.public_dns}"
  sensitive = true # testing how to make an output value sensitive, comment if you want to see the value in CLI
}