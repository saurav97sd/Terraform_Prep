# Create 3 IAM users in AWS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user

# Resource Block
resource "aws_iam_user" "myuser" {
  # for_each meta argument with strings
  for_each = toset(["TRahul", "TShailesh", "TBhaskar"])

  # only name is the required argument
  name = each.key
}

/*
For Set of Strings
each.key = each.value
*/
