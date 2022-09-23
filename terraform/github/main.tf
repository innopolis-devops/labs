terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.2.0"
    }
  }
}

# Access is configured through GITHUB_TOKEN env variable
provider "github" {}

resource "github_repository" "repo" {
  name        = "iu-devops-labs"
  description = "Yet another IU homework repo"
  visibility  = "public"

  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false
}
