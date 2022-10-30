terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.12"
}

# Configure the GitHub Provider
provider "github" {
  # I'm using `GITHUB_TOKEN` env var
  owner = var.repository_owner
}

# Manage the repository
resource "github_repository" "main" {
  name        = var.repository_name
  description = "Devops labs solutions for F22 course at Innopolis University"

  visibility = "public"

  has_downloads = true
  has_projects  = true
  has_wiki      = true

  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "main" {
  repository = github_repository.main.name
  branch     = "master"
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.main.node_id

  pattern = github_repository.main.default_branch

  allows_deletions                = false
  require_conversation_resolution = true
}
