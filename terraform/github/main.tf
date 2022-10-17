terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.2.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_branch_default" "master" {
  repository = github_repository.iu_devops_labs.name
  branch     = "master"
}

resource "github_repository" "iu_devops_labs" {
  name        = "iu-devops-labs"
  description = "Innopolis DevOps Course."
  visibility  = "public"

  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.iu_devops_labs.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false
}
