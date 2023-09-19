# Playing with terraform verions (CLI Locking) inside terraform configuration block
# We will use the version constraints in 3 places 1. required_provider (Terraform Block) 2. Provider Block 3. Module Block
/*
We use operators with the versions
1. = Allow only one exect version number
2. != Exclude one exect version number
3. >, >=, <=, < Comparision against a specific version number
4. ~> Allows only the rightmost version component to increment. So, ~>1.0.4 will allocw installation of 1.0.5, 1.0.10 but not 1.1.0
Only 1st and 4th is commonly used
*/

terraform {
  #CLI Locking
  required_version = "~> 1.5.0"
}

