# VPC in West US
# Resource Block
resource "aws_vpc" "vpc_west" {
  cidr_block = "10.0.0.0/16"
  # meta-argument (provider inside resource block)
  provider = aws.aws_westus
  tags = {
    "Name" = "vpc_west"
  }
}