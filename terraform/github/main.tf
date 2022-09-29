terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

resource "github_repository" "DevOps" {
  name               = var.repo_name
  description        = var.repo_description
  visibility         = "public"
  has_wiki           = true
  allow_squash_merge = false
  allow_rebase_merge = false
}

#Set default branch 'master'
resource "github_branch_default" "main" {
  repository = github_repository.DevOps.name
  branch     = "master"
}

#Create branch protection rule to protect the default branch. (Use "github_branch_protection_v3" resource for Organisation rules)
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.DevOps.node_id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false

}