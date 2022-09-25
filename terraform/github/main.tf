terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  owner = var.repository_owner
}

resource "github_repository" "main" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = "public"
}

resource "github_branch_default" "main" {
  repository = github_repository.main.name
  branch     = "master"
}

resource "github_branch_protection" "main" {
  repository_id       = github_repository.main.node_id
  pattern             = github_repository.main.default_branch
  allows_deletions    = false
  allows_force_pushes = false

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
