# GitHub repository management terraform module

This module contains manifests for creating/managing GitHub repository

## Usage

If you want to apply the module to existing repo use `terraform import` command. Example: `terraform import "github_repository.main" "devops"`.

### Key

Logging in to GitHub is done via setting `GITHUB_TOKEN` environment variable before running terraform. Read [docs](https://registry.terraform.io/providers/integrations/github/latest/docs#authentication) for details or other approaches.

### Target repository

Repo name in the logged in account can be specified via terraform input variables
