# VPC in US East
# Resource Block
resource "aws_vpc" "vpc_east" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc_east" 
  }
}