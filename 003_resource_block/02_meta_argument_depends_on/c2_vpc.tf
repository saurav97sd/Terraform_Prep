# Resource Blocks
# Resource 1: Create a VPC
resource "aws_vpc" "vpc-test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-test"
  }
}

# Resource 2: Create Subnets
resource "aws_subnet" "vpc-test-subnet-1" {
  vpc_id                  = aws_vpc.vpc-test.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# Resource 3: Internet Gateway
resource "aws_internet_gateway" "vpc-test-igw" {
  vpc_id = aws_vpc.vpc-test.id
}

# Resource 4: Create Route Table
resource "aws_route_table" "vpc-test-public-route-table" {
  vpc_id = aws_vpc.vpc-test.id
}

# Resource 5: Create Routes in Route Table for internet access
resource "aws_route" "vpc-test-public-route" {
  route_table_id         = aws_route_table.vpc-test-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-test-igw.id
}

# Resource 6: Associate route table with the subnet
resource "aws_route_table_association" "vpc-test-route-table-association" {
  route_table_id = aws_route_table.vpc-test-public-route-table.id
  subnet_id      = aws_subnet.vpc-test-subnet-1.id
}

# Resource 7: Create SG
resource "aws_security_group" "test-vpc-sg" {
  name        = "test-vpc-default-sg"
  description = "Test VPC Default Security Group"
  vpc_id      = aws_vpc.vpc-test.id
}
# Ingress rule to allow port 22 (SSH) access from internet
resource "aws_security_group_rule" "test-vpc-sg-ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test-vpc-sg.id
}
# Ingress rule to allow port 80 (HTTP) access from internet
resource "aws_security_group_rule" "test-vpc-sg-ingress2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test-vpc-sg.id
}
# Allow all IP and Ports outbound
resource "aws_security_group_rule" "test-vpc-sg-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test-vpc-sg.id
}