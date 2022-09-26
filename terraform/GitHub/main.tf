terraform {
  required_version = ">= 1.2.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "test" {
  name               = "Andrey-Terraform-Test"
  description        = "Test repo to learn the Terraform functionality with GitHub"
  visibility         = "public"
  has_wiki           = false
  auto_init          = true
  # for 2 bonus points
  allow_rebase_merge = false
  allow_squash_merge = false
}

resource "github_branch" "master" {
  repository = github_repository.test.name
  branch     = "master"
}

#Set default branch 'master'
resource "github_branch_default" "master" {
  repository = github_repository.test.name
  branch     = github_branch.master.branch
}

#Create branch protection rule to protect the default branch
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.test.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}