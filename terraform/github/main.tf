terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = "khalil19-99"
}

resource "github_repository" "labs" {
  name        = "Devops-labs "
  description = "A description created from terraform"
  visibility  = "public"
}

resource "github_branch" "master" {
  repository = github_repository.labs.name
  branch     = "master"
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.labs.name
  branch     = github_branch.master.branch
}

resource "github_branch_protection_v3" "branch_protection_v3" {
  repository = github_repository.labs.name
  branch = github_branch.master.branch
  restrictions {
    users = ["khalil19-99"]
  }
}
