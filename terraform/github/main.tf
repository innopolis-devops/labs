terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {}

resource "github_repository" "repo" {
  name               = var.name
  description        = "Demo repo for devops labs"
  visibility         = "public"
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  license_template   = "mit"
  gitignore_template = "Python"
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.repo.name
  branch     = var.default_branch_name
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.default_branch.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
