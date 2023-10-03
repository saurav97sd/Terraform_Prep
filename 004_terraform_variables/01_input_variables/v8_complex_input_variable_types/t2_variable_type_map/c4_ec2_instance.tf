# Resource Block (EC2 Instance)
resource "aws_instance" "my_vm" {
  ami           = var.ec2_ami_id                         # using variables
  instance_type = var.ec2_instance_type_map["small_app"] # since the varible is of type map of string
  key_name      = "terraform-key"
  count         = var.ec2_instance_count # using variables
  # Installing apache web server
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd.x86_64
  systemctl start httpd.service
  systemctl enable httpd.service
  echo "<h1>Welcome to test site on us east 1 region !!</h1>"
  EOF

  # Adding/Referencing the security groups we created
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]

  # Using the tag variable of type map of string here
  tags = var.ec2_instance_tags
}