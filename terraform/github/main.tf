terraform {
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

resource "github_repository" "devops" {
  name        = "DevOps"
  description = "Repository for completing lab assignments for the DevOps course in Innopolis University"
  visibility  = "public"
  has_issues  = true
  has_wiki    = false
  auto_init   = true
  has_downloads = true
  has_projects = true
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "master" {
  repository = github_repository.devops.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.devops.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}