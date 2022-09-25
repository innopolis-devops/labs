terraform {
  required_version = "~> 1.3.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  name = "labs"
  description = "DevOps Fall '22 Labs"
  visibility = "public"
  has_downloads = true
  has_projects = true
  has_wiki = true
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = "master"
}

resource "github_branch_protection" "master" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}

resource "github_branch_protection" "lab_branches" {
  repository_id                   = github_repository.repo.id
  pattern                         = "lab*"
  require_conversation_resolution = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}