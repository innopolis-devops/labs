terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.12"
}

provider "github" {
  owner = "AzazKamaz"
}

resource "github_repository" "repo" {
  name        = "tmp_inno_devops_terraform"
  description = "Temprorary repo for inno devops classes"
  visibility  = "public"
}

resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = "master"
}

resource "github_branch_protection" "master" {
  repository_id = github_repository.repo.node_id

  pattern = github_repository.repo.default_branch

  allows_deletions                = false
  require_conversation_resolution = true
}