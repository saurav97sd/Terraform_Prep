#terraform setting block
terraform{
    required_providers {
      aws = {
        source = "hashicorp/aws"
      }
    }
}

#provider block
provider "aws" {
    profile = "default" # provide credentials in your local desktop terminal
    region = "us-east-1"
}

#resource block
resource "aws_instance" "ec2demo" {
    ami = "ami-04cb4ca688797756f"
    instance_type = "t2.micro"
}