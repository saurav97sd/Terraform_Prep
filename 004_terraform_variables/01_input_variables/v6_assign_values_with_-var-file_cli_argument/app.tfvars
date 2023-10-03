# We will need -var-file CLI argument to load this value in the variables.tf as the file name is not terraform.tfvars
# terraform plan/apply -var-file app.tfvars
ec2_instance_type = "t3.micro"