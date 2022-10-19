terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.5.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  allow_rebase_merge = false
  allow_squash_merge = false
  auto_init          = true
  description        = var.repo_description
  gitignore_template = ""
  license_template   = "mit"
  name               = var.repo_name
  visibility         = "public"
}

resource "github_branch_default" "main" {
  branch     = "main"
  repository = github_repository.repo.name
}

resource "github_branch_protection" "default" {
  enforce_admins                  = true
  pattern                         = github_branch_default.main.branch
  repository_id                   = github_repository.repo.id
  require_conversation_resolution = true
}