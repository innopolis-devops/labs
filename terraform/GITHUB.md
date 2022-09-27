# Terraform with GitHub
## `terraform show` result:
~~~
$ terraform show
# github_branch_default.master:
resource "github_branch_default" "master" {
    branch     = "main"
    id         = "devops_terraform"
    repository = "devops_terraform"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOIEwlIc4Bv9uT"
    pattern                         = "main"
    repository_id                   = "devops_terraform"
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
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Test terraform"
    etag                        = "W/\"564e033ab16721170c1a69cf7fdbcfc81fd110e36b8423942fc06ff1ce35b5e6\""
    full_name                   = "AlexDest-Dev/devops_terraform"
    git_clone_url               = "git://github.com/AlexDest-Dev/devops_terraform.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/AlexDest-Dev/devops_terraform"
    http_clone_url              = "https://github.com/AlexDest-Dev/devops_terraform.git"
    id                          = "devops_terraform"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops_terraform"
    node_id                     = "R_kgDOIEwlIQ"
    private                     = false
    repo_id                     = 541861153
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:AlexDest-Dev/devops_terraform.git"
    svn_url                     = "https://github.com/AlexDest-Dev/devops_terraform"
    visibility                  = "public"
    vulnerability_alerts        = false
}
~~~
## `terraform state list` result:
~~~
$ terraform state list
github_branch_default.master
github_branch_protection.default
github_repository.repo
~~~
## `terraform import` result:
~~~
$ terraform import 'github_repository.repo["allow_rebase_merge"]' false
var.GITHUB_TOKEN
  Specifies the GitHub PAT token or `GITHUB_TOKEN`

  Enter a value: TOKEN


Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

~~~