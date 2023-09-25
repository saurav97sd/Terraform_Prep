# Resource Block (To create EC2 instance)
resource "aws_instance" "my_vm" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Web_3"
  }

  # lifecycle meta argument - to ignore changes done in through Web Console and if we don't do it the change what we have done
  # manually will be deleted in the next terraform apply as it's not tracked in terraform state file
  lifecycle {
    ignore_changes = [ 
      # ignore changes to tags, e.g. because a management agent
      # updates this based on some ruleset managed elsewhere.
      tags,
    ]
  }

}