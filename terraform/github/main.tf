terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {}

resource "github_repository" "devops_labs" {
  name               = "devops_labs"
  description        = "Innopolis DevOps Course Labs"
  visibility         = "public"
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "master" {
  repository = github_repository.devops_labs.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.devops_labs.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false
}
