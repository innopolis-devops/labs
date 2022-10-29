terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.12"
}

provider "github" {}

# Manage the repository
resource "github_repository" "labs" {
  name        = "devops"
  description = "Devops labs"

  visibility = "public"

  has_downloads = true
  has_projects  = true
  has_wiki      = true

  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "main" {
  repository = github_repository.labs.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.labs.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}