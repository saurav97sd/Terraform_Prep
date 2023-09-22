# Resource 9: Create Elastic IP and add meta argument depends_on
resource "aws_eip" "test-eip" {
  instance = aws_instance.ec2-test.id
  domain   = "vpc"
  # Adding depends_on meta argument
  depends_on = [aws_internet_gateway.vpc-test-igw]
}