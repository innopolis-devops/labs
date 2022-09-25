# Terraform best pracitces that were appplied

1. Use .gitignore to isolate temporary Terraform files.

1. Use `terraform fmt` to automatically format files.

1. Do not expose secrets in Terraform configuration files. Instead, store them
   in the environment.

1. Define Terraform variable in the variables.tf file.

1. Define Terraform outputs in the outputs.tf file.
