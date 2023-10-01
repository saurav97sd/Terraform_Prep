# Resource Block (EC2 Instance)
resource "aws_instance" "my_vm" {
  ami           = var.ec2_ami_id # using variables
  instance_type = "t2.micro"
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

  tags = {
    "Name" = "my_vm"
  }
}