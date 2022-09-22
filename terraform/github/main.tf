terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.12"
}

# Configure the GitHub Provider
provider "github" {
    # I'm using `GITHUB_TOKEN` env var
}

# Manage the repository
resource "github_repository" "devops_fork" {
  name = var.repository_name
  description = "Devops labs solutions for F22 course at Innopolis University"

  visibility = "public"

  has_downloads = true
  has_projects = true
  has_wiki = true
}

resource "github_branch_default" "master" {
  repository = github_repository.devops_fork.name
  branch = "master"
}

resource "github_branch_protection" "master" {
  repository_id = github_repository.devops_fork.node_id

  pattern = github_repository.devops_fork.default_branch
  
  allows_deletions = false
  require_conversation_resolution = true
}