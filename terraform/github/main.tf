
terraform {
  required_version = ">= 0.13"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
  
}

provider "github" {
  token = var.token 
}


resource "github_repository" "repo" {
  name               = "lab4-devops-terraform"
  description        = "Lab 4 Github example"
  visibility         = "public"
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  license_template   = "mit"
  gitignore_template = "VisualStudio"
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

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}