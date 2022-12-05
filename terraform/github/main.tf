terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN
  owner = "Kastrylia"
}

resource "github_repository" "repo" {
  name               = "devopsterra"
  description        = "devops"
  visibility         = "public"
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  license_template   = "mit"
  
  allow_squash_merge = true
  allow_rebase_merge = true
}

resource "github_repository" "devopsterra" {
  name          = "devopsterra"
  description   = "sample"
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
    required_approving_review_count = 3
  }
}