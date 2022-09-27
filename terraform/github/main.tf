terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "labs" {
  name               = "labs"
  description        = "Repository for DevOps labs"

  visibility         = "public"
}

resource "github_branch_default" "master" {
  repository = github_repository.labs.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id = github_repository.labs.node_id
  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true

  required_status_checks {
    strict = true
  }
}