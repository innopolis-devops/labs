![](https://github.com/markovvn1/devops-labs/actions/workflows/terraform.yml/badge.svg?branch=lab4)


# Terraform reprot

## Docker

Output of the `terraform show`:

<img src=".github/docker_1.png" style="zoom:60%;" />

Output of the `terraform state list`:

![](.github/docker_2.png)

Change Infrastructure:

<img src=".github/docker_3.png" style="zoom:60%;" />

Output of the `terraform output`:

![](.github/docker_4.png)

## Yandex

To run read [manual](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs) and use the following command to init environment:

```bash
export YC_TOKEN=...
export YC_CLOUD_ID=...
export YC_FOLDER_ID=...
```

Output of the `terraform show`:

<img src=".github/yandex_1.png" style="zoom:60%;" />

Output of the `terraform state list`:

![](.github/yandex_2.png)

Change Infrastructure:

<img src=".github/yandex_3.png" style="zoom:60%;" />

Output of the `terraform output`:

![](.github/yandex_4.png)

## Github

To run read [manual](https://docs.github.com/en/enterprise-server@3.4/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) and use the following command to init environment:

```bash
export GITHUB_TOKEN=...
```

Output of the `terraform show`:

<img src=".github/github_1.png" style="zoom:60%;" />

Output of the `terraform state list` and `terraform output`:

![](.github/github_2.png)

Import your existing repository using `terraform import` command:

![](.github/github_3.png)

Apply changes from your terraform config to the repository (**disable rebase and squash commits for the repository using terraform**):

<img src=".github/github_4.png" style="zoom:60%;" />

## Best practices

* Use `terraform fmt` and `terraform validate` to autoformat and validate terraform files
* Use environment variables for the secrets (not terraform variables)
* Declare outputs and variables in separate files (`outputs.tf` and `variables.tf`)
* Add `terraform.tfstate` to `.gitignore` cause it may contain secret credentials