# Resource Block (To create EC2 instance)
resource "aws_instance" "my_vm" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Web_2"
  }

  # lifecycle meta argument - to prevent destroy action - comment the lifecycle block to run destroy command or change it to false
  lifecycle {
    prevent_destroy = true
  }

}