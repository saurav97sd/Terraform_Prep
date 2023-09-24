# Create S3 bucket per each environment with for_each and map
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

# Resource Block
resource "aws_s3_bucket" "mys3bucket" {

  # for_each meta argument
  for_each = {
    "dev"   = "my-dev-bucket"
    "stage" = "my-stage-bucket"
    "prod"  = "my-prod-bucket"
  }

  bucket = "${each.key}-${each.value}"
  # acl = "private" (depriciated)

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}