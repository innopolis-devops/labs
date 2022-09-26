# Best practices
- Described in [docker/TF.md](../docker/TF.md) file.

# Results
- This terraform script created the following
  [repository](https://github.com/SMore-Napi/Terraform_created_repo)
  automatically.

<img width="800" alt="2" src="https://user-images.githubusercontent.com/49106163/192392584-3cfe5a38-aab7-4e74-a70d-78e51b5e4f74.png">
<img width="800" alt="3" src="https://user-images.githubusercontent.com/49106163/192392590-9075be9b-bcc3-46d2-b4ca-a13e0528f8c7.png">
<img width="800" alt="4" src="https://user-images.githubusercontent.com/49106163/192392603-f707f5c8-af17-4c11-b2a1-8003653643ad.png">

# Logs

**Action:** `terraform apply`

**Output:**
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "main"
      + id         = (known after apply)
      + repository = "Terraform_created_repo"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "main"
      + repository_id                   = (known after apply)
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false

      + required_pull_request_reviews {
          + required_approving_review_count = 1
        }
    }

  # github_repository.repo will be created
  + resource "github_repository" "repo" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = true
      + allow_squash_merge          = true
      + archived                    = false
      + auto_init                   = true
      + branches                    = (known after apply)
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "This repo was automatically created by Terraform!"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + gitignore_template          = "VisualStudio"
      + has_issues                  = true
      + has_wiki                    = true
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + license_template            = "mit"
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "Terraform_created_repo"
      + node_id                     = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + visibility                  = "public"
    }

Plan: 3 to add, 0 to change, 0 to destroy.
```

**Action:** `terraform show`

**Output:**
```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "Terraform_created_repo"
    repository = "Terraform_created_repo"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOIEsqL84Bv8d2"
    pattern                         = "main"
    repository_id                   = "Terraform_created_repo"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        require_code_owner_reviews      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    branches                    = [
        {
            name      = "main"
            protected = false
        },
    ]
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "This repo was automatically created by Terraform!"
    etag                        = "W/\"8a3d3e55ef933fce1554b2ecb35f87e662e0ad310808198206fef81447e804c4\""
    full_name                   = "SMore-Napi/Terraform_created_repo"
    git_clone_url               = "git://github.com/SMore-Napi/Terraform_created_repo.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/SMore-Napi/Terraform_created_repo"
    http_clone_url              = "https://github.com/SMore-Napi/Terraform_created_repo.git"
    id                          = "Terraform_created_repo"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "Terraform_created_repo"
    node_id                     = "R_kgDOIEsqLw"
    private                     = false
    repo_id                     = 541796911
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:SMore-Napi/Terraform_created_repo.git"
    svn_url                     = "https://github.com/SMore-Napi/Terraform_created_repo"
    visibility                  = "public"
    vulnerability_alerts        = false
}
```

**Action:** `terraform state list`

**Output:**
```
github_repository.repo
```

**Action:** import `terraform import github_repository.repo2 Terraform_created_repo`

**Output:**
```
github_repository.repo2: Importing from ID "Terraform_created_repo"...
github_repository.repo2: Import prepared!
  Prepared github_repository for import
github_repository.repo2: Refreshing state... [id=Terraform_created_repo]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

**Action:** Disable rebase and squash commits for the repository

**Output:**
```
Terraform will perform the following actions:

  # github_repository.repo will be updated in-place
  ~ resource "github_repository" "repo" {
      ~ allow_rebase_merge          = true -> false
      ~ allow_squash_merge          = true -> false
        id                          = "Terraform_created_repo"
        name                        = "Terraform_created_repo"
```
...
```
github_repository.repo: Modifying... [id=Terraform_created_repo]
github_repository.repo: Modifications complete after 1s [id=Terraform_created_repo]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

```
