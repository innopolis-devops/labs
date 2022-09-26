terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  # Authentication via env GITHUB_TOKEN
}

resource "github_repository" "repo" {
  name               = var.repo_name
  description        = var.repo_description
  visibility         = "public"
  has_wiki           = true
  allow_rebase_merge = false
  allow_squash_merge = false
}

resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = var.default_branch_name
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.main.branch
  allows_deletions                = false
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
