terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.3.0"
    }
  }
}

provider "github" {
  # All values should be passed by env
}

#Create and initialise a public GitHub Repository
resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.repo_desc
  visibility  = "public"

  auto_init          = true
  license_template   = "mit"
  gitignore_template = "VisualStudio"

  allow_rebase_merge = false # Disable rebase merges on the repository.
  allow_squash_merge = false # Disable squash merges on the repository.
}

#Set default branch 'main'
resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
}

#Create branch protection rule to protect the default branch. (Use "github_branch_protection_v3" resource for Organisation rules)
resource "github_branch_protection" "default" {
  repository_id = github_repository.repo.id
  pattern       = github_branch_default.main.branch

  require_conversation_resolution = true # Requires all conversations on code must be resolved before a pull request can be merged
  enforce_admins                  = true # Enforces status checks for repository administrators.
}


resource "github_repository" "labs" {
  name = "devops-labs"
}