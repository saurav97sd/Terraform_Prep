# We will create a simple AWS VPC resource here
# Resource Block
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "myvpc1"
  }
}

