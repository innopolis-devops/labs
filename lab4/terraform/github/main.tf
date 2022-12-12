resource "github_repository" "terraform" {
   name        = "DevOps Inno Terraform"
   description = "Solutions for devops labs"

   private = false
   teams = {}
   webhooks = {}
   default_branch = "main"

   branch_protection = {
     main = {}
   }
 }