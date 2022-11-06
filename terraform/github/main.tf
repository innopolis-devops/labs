terraform {
  required_version = "~> 1.2.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN
  owner = "ParfenovIgor"
}

resource "github_repository" "repo" {
  name               = "terraform-github-example"
  description        = "The Example of Terraform + Github"
  visibility         = "public"
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  license_template   = "mit"
  
  allow_squash_merge = false
  allow_rebase_merge = false
}

resource "github_repository" "labs" {
  name          = "labs"
  description   = "This description was generated using Terraform"
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

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
