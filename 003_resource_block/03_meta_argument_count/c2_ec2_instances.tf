# Create multiple ec2 instances with count meta argument
# Resource Block
resource "aws_instance" "web" {
  ami           = "ami-03a6eaae9938c858c" # Amazon Linux AMI
  instance_type = "t2.micro"
  # Using count meta-argument
  count = 3
  tags = {
    "Name" = "Web-${count.index}" # Using count.index to give unique vm name
  }
}