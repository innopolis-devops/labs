# Yandex Cloud GitHub configuration

This module contains Terraform configuration for GitHub.

## Envs

For running the configuration you should provide `GITHUB_TOKEN` env,
which should contain GitHub Personal Access Token (PAT). Token can be obtained
[here](https://github.com/settings/tokens). Required scopes for token are:

1. repo
2. read:org
3. read:discussion

## Import

If configuration applied to existing repositories, they should be imported
first using the following command:

    terraform import "github_repository.<resouce_name>" "<repository_name>"
