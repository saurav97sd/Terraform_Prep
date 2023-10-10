# Get latest AMI ID from AWS using data source block
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#example-usage

data "aws_ami" "amzlinux" {
  most_recent = true # So that we always get the latest image
  # we don't give most recent it will filter a lot of values and throw an error or we can use name regex alternatively
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.2.*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}