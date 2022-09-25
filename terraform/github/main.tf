terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.3.0"
    }
  }
}

resource "github_repository" "repo" {
  name               = "test_repo_inno_devops"
  description        = "DELETE ME PLEASE 😿"
  visibility         = "private"
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  allow_rebase_merge = false
  allow_squash_merge = false
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
}


resource "github_repository" "devops" {
  description = "Innopolis F22 DevOps course"
  name        = "devops"

  visibility = "public"
}

resource "github_branch_default" "devops_master" {
  repository = github_repository.devops.name
  branch     = "master"
}
