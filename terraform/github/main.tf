terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  owner = var.repo_owner
}

resource "github_repository" "repo" {
  name               = var.repo_name
  description        = var.repo_description
  visibility         = var.repo_visibility
  license_template   = var.repo_license
  gitignore_template = var.repo_gitignore
}

resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = var.repo_default_branch_name
}

resource "github_branch_protection" "default" {

  repository_id    = github_repository.repo.id
  pattern          = github_branch_default.master.branch
  allows_deletions = false

  required_pull_request_reviews {
    required_approving_review_count = 1
  }

}
