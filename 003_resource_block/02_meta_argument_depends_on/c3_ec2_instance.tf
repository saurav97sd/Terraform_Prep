# Resource 8: Creating the EC2 instance
resource "aws_instance" "ec2-test" {
  # Required arguments
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"

  # Need to provide key for remote session
  key_name = "terraform-key"
  # We need to provide subnet id to associate the vm with the subnet we will create
  subnet_id = aws_subnet.vpc-test-subnet-1.id
  # Associating the SG
  vpc_security_group_ids = [aws_security_group.test-vpc-sg.id]

  # Installing Apache Web Server once the VM is deployed using user data and terraform file function
  #user_data = file("apache_install.sh")
  # Another Way is
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo systemctl enable httpd
    echo "<h1>Welcome to Cloud Clone !! AWS Infra created using Terraform in us-east-1 region :)</h1>"
  EOF

  tags = {
    "Name" = "ec2-test"
  }
}