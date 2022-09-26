terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.3.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  name               = var.repo_name
  description        = var.repo_description
  visibility         = "public"
  auto_init          = true
  license_template   = "mit"
  gitignore_template = "VisualStudio"

  allow_rebase_merge = false
  allow_squash_merge = false
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

resource "github_repository" "devops-labs-terraform" {
  name = "devops-labs"
}
