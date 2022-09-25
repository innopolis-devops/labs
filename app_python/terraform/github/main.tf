terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

// Token is injected through a variable in terraform.tfvars
provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  name               = "tf-generated-repo"
  description        = "This repository was generated using Terraform GitHub provider"
  visibility         = "public"
  auto_init          = true
  allow_squash_merge = false
  allow_rebase_merge = false
}

// 'master' name is too offensive
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


// This configuration is written manually to match the imported state
resource "github_repository" "imported_repo" {
  name          = "innopolis-devops-labs"
  visibility    = "public"
  has_downloads = true
  has_projects  = true
  has_wiki      = true
}