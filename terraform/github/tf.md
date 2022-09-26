# Github Provider

## Excution 

* First, I created ```main.tf``` file, and run the following commands:

- ```terrform init ```
- ```terraform validate```
- ```terraform fmt```

* Import labs repo

* Enter ```terraform import github_repository.labs Devops-labs```, resutls:

```
var.github_token
  Specifies the GitHub PAT token or `GITHUB_TOKEN`

  Enter a value: <my_token>

github_repository.labs: Importing from ID "Devops-labs"...
github_repository.labs: Import prepared!
  Prepared github_repository for import
github_repository.labs: Refreshing state... [id=Devops-labs]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```
* Then we run ```terraform apply```, after that run ```terrafrom show```:

```
terraform show
# github_repository.labs:
resource "github_repository" "labs" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = false
    branches                    = [
        {
            name      = "gh-pages"
            protected = false
        },
        {
            name      = "lab1"
            protected = false
        },
        {
            name      = "lab2"
            protected = false
        },
        {
            name      = "lab3"
            protected = false
        },
        {
            name      = "master"
            protected = false
        },
    ]
    default_branch              = "master"
    delete_branch_on_merge      = false
    description                 = "A description created from terraform"
    etag                        = "W/\"2b71446ff2e0cd360c3adefc37397e9462c787e9659bdeabcef3e56774142ca5\""
    full_name                   = "Khalil19-99/Devops-labs-"
    git_clone_url               = "git://github.com/Khalil19-99/Devops-labs-.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/Khalil19-99/Devops-labs-"
    http_clone_url              = "https://github.com/Khalil19-99/Devops-labs-.git"
    id                          = "Devops-labs-"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "Devops-labs-"
    node_id                     = "R_kgDOH73mpA"
    private                     = false
    repo_id                     = 532539044
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:Khalil19-99/Devops-labs-.git"
    svn_url                     = "https://github.com/Khalil19-99/Devops-labs-"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false

    pages {
        custom_404 = false
        html_url   = "https://khalil19-99.github.io/Devops-labs-/"
        status     = "building"
        url        = "https://api.github.com/repos/Khalil19-99/Devops-labs-/pages"

        source {
            branch = "gh-pages"
            path   = "/"
        }
    }
}

```
* finally we run ```terraform state list```:
```github_repository.labs```

