terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.3.0"
    }
  }
}

provider "github" {
}

resource "github_repository" "labs" {
  name               = "labs"
  description        = "DevOps labs"
  visibility         = "public"
  allow_rebase_merge = false
  allow_squash_merge = false
}

resource "github_branch_default" "master" {
  repository = github_repository.labs.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.labs.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false
}