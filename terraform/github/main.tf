terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {}

# Create and initialise a public GitHub Repository with MIT license
# and a Visual Studio .gitignore file (incl. issues and wiki)
resource "github_repository" "repo" {
  name        = var.repository_name
  description = "New created repository from terraform"
  visibility  = "public"

  has_downloads = true
  has_projects  = true
  has_wiki      = true

  allow_squash_merge = false
  allow_rebase_merge = false
}

# Set default branch 'master'
resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id = github_repository.repo.node_id
  pattern       = github_repository.master.default_branch

  require_conversation_resolution = true
  allows_deletions                = false
}