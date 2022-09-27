terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  #token is in env
}

resource "github_repository" "repo" {
  name               = var.repository_name
  description        = var.repository_desc
  visibility         = "public"
  auto_init          = true
  allow_squash_merge = false
  allow_rebase_merge = false
  license_template   = "mit"
  gitignore_template = "VisualStudio"
}

resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true
}
