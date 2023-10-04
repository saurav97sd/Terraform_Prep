# Warning: Never check sensitive values like username and passwords into source 
# Create MySQL RDS Database - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance#example-usage
# Never checkin secrets.tfvars file in public repository as they contains sensitive informations so we have added it to .gitignore file

resource "aws_db_instance" "db1" {
  allocated_storage   = 5
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  db_name             = "mydb1"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}