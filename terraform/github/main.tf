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
  owner = var.repository_owner
}

# Manage the repository
resource "github_repository" "main" {
  name        = var.repository_name
  description = "Devops labs solutions for F22 course at Innopolis University"

  visibility = "public"

  has_downloads = true
  has_projects  = true
  has_wiki      = true
}

resource "github_branch_default" "main" {
  repository = github_repository.main.name
  branch     = "master"
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.main.node_id

  pattern = github_repository.main.default_branch

  allows_deletions                = false
  require_conversation_resolution = true
}

# Rust team

resource "github_team" "rust" {
  name = "rust-developers"
  privacy = "closed"
  create_default_maintainer = true
}

resource "github_team_repository" "rust_main" {
  team_id    = github_team.rust.id
  repository = github_repository.main.name
  permission = "write"
}

# Python team

resource "github_team" "python" {
  name = "python-developers"
  privacy = "closed"
  create_default_maintainer = true
}

resource "github_team_repository" "python_main" {
  team_id    = github_team.python.id
  repository = github_repository.main.name
  permission = "write"
}

# PMs

resource "github_team" "manager" {
  name = "project-managers"
  privacy = "closed"
  create_default_maintainer = true
}

resource "github_team_repository" "manager_main" {
  team_id    = github_team.manager.id
  repository = github_repository.main.name
  permission = "maintain"
}

# Reviewers

resource "github_team" "reviewers" {
  name = "reviewers"
  privacy = "closed"
  create_default_maintainer = true
}

resource "github_team_repository" "reviewer_main" {
  team_id    = github_team.reviewers.id
  repository = github_repository.main.name
  permission = "triage"
}
