# Creating an EC2 instance
# Resource Block
resource "aws_instance" "my_ec2_vm" {
  # ami and instance_type are the required arguments
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"

  # using availability zone to test resource behaviour later on (optional argument)
  # availability_zone = "us-east-1a"
  # Changing the availability zone to see destroy and recreate behaviour of resources
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "Web"
    # Now we are adding another tag value after deploying once to see the update in place behaviour of resource
    "tag1" = "EC2_Update_in_Place"
  }
}