terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.0"
    }
  }
}

provider "github" {
}

resource "github_repository" "devops" {
  name        = "DevOps-Inno-22-summer-labs"
  description = "Solutions to DevOps labs"

  visibility = "public"

  auto_init = true
}

resource "github_branch" "lab4" {
    repository = github_repository.devops.name
    branch     = "lab4"
}

resource "github_branch_default" "default"{
    repository = github_repository.devops.name
    branch     = github_branch.lab4.branch
}

resource "github_branch_protection_v3" "protection" {
  repository     = github_repository.devops.name
  branch         = "lab4"

  restrictions {
    users = ["devops-labs"]
  }
}