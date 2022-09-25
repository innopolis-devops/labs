terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

resource "github_repository" "main" {
  name        = var.repo_name
  description = "Devops labs solutions in my university"
  visibility = "public"

  has_downloads = true
  has_projects  = true
  has_wiki      = true
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_branch_default" "main" {
  repository = github_repository.main.name
  branch     = "master"
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.main.node_id
  pattern = github_repository.main.default_branch
  require_conversation_resolution = true
  allows_deletions                = false
}

