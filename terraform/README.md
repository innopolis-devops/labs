# Terraform - Important information

## Yandex

In order for Terraform to work with the Yandex cloud, it needs your Yandex credentials.

Get familiar with <https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#get-credentials>

## Github

In order for Terraform to work with Github, it needs
[Github Personal access token(PAT)](https://docs.github.com/en/enterprise-server@3.4/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with the following permissions:

1. "repo"
2. "read:repo_hook"
3. "read:org"
4. "read:discussion"
5. "delete_repo"

Set value of PAT to the environment variable *GITHUB_TOKEN* before running Terraform

Then import your repository if exists:

``terraform import "github_repository.name" "name"``
