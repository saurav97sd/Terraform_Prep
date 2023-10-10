# Define Output Values
# We can check what all arguments and attributes we can reference from the Terraform document below -
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference

# Attribute Reference : EC2 Instance Public IP
output "ec2_instance_publicip" {
  description = "Public IP of EC2 Instance"
  value       = aws_instance.my_vm.public_ip
}

# Attribute Reference : Create Public DNS URL with http:// appended
output "ec2_publicdns" {
  description = "Public DNS URL of an EC2 Instance"
  value       = "http://${aws_instance.my_vm.public_dns}"
}