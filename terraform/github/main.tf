terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

resource "github_repository" "repo" {
  name               = var.repo_name
  description        = "Inno DevOps Test repo"
  visibility         = "public"
  has_projects       = true
  has_wiki           = true
  has_downloads      = true
  auto_init          = true
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
