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
  token = var.GH_TOKEN
}

#Create and initialise a public GitHub Repository with MIT license and a Visual Studio .gitignore file (incl. issues and wiki)
resource "github_repository" "repo" {
  name               = "devops_auto_tf"
  description        = "devops f22"
  visibility         = "public"
  auto_init = true
  license_template = "mit"
  default_branch = "main"
}

#Create branch protection rule to protect the default branch. (Use "github_branch_protection_v3" resource for Organisation rules)
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = "main"
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}