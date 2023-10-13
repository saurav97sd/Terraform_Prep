# Resource Block (EC2 Instance)
resource "aws_instance" "my_vm" {
  ami           = data.aws_ami.amzlinux.id # using datasource
  instance_type = var.ec2_instance_type    # using variable with no default value to get prompt from CLI
  key_name      = "terraform-key"

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
    #"demotag" = "refresh_test"
  }
}