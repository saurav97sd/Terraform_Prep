# Resource Block (To create EC2 instance)
resource "aws_instance" "my_vm" {
  ami               = "ami-03a6eaae9938c858c"
  instance_type     = "t2.micro"
  # availability_zone = "us-east-1a"
  # Changing availability zone to implement create before destroy
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "Web_1"
  }
  
/* Uncomment after running the file to create the resource first
  # lifecycle meta argument
  lifecycle {
    create_before_destroy = true
  }
*/
}