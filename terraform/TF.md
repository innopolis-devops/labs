# Docker
Terraform show command after creating main.tf and variables.tf file and apply them:

```shell
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/docker$ terraform show
```
Output:
```
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach            = false
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "3a38e7c418fe"
    id                = "3a38e7c418fed10a0614d58926b19cb750f259840de1ac8622d16ba83fa67e9a"
    image             = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    init              = false
    ip_address        = "172.17.0.2"
    ip_prefix_length  = 16
    ipc_mode          = "private"
    log_driver        = "json-file"
    logs              = false
    max_retry_count   = 0
    memory            = 0
    memory_swap       = 0
    must_run          = true
    name              = "ExampleNginxContainer"
    network_data      = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            network_name              = "bridge"
        },
    ]
    network_mode      = "default"
    privileged        = false
    publish_all_ports = false
    read_only         = false
    remove_volumes    = true
    restart           = "no"
    rm                = false
    runtime           = "runc"
    security_opts     = []
    shm_size          = 64
    start             = true
    stdin_open        = false
    stop_signal       = "SIGQUIT"
    stop_timeout      = 0
    tty               = false

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}


Outputs:

container_id = "3a38e7c418fed10a0614d58926b19cb750f259840de1ac8622d16ba83fa67e9a"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"

```

Terraform state list:
```shell
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/docker$ terraform state list
```
Output:
```
docker_container.container_id
docker_image.nginx
```

Showing output once terraform apply is finished after creating outputs.tf file 
```
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/terraform-docker-container$ terraform output
```

Output:
```
container_id = "3a38e7c418fed10a0614d58926b19cb750f259840de1ac8622d16ba83fa67e9a"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

# Github

Showing terraform repository:
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/github$ terraform show

Output:
```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "terraform-repo"
    repository = "terraform-repo"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOIE1o4M4Bv-pE"
    pattern                         = "main"
    repository_id                   = "terraform-repo"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false
}

# github_repository.devops-lab4:
resource "github_repository" "devops-lab4" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    branches                    = []
    default_branch              = "main"
    delete_branch_on_merge      = false
    etag                        = "W/\"e6a013e3d6af4172f77d61e6956330c6018941b5b623aeaa4b0db90c27762896\""
    full_name                   = "TalgatBektleuov/devops-lab4"
    git_clone_url               = "git://github.com/TalgatBektleuov/devops-lab4.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/TalgatBektleuov/devops-lab4"
    http_clone_url              = "https://github.com/TalgatBektleuov/devops-lab4.git"
    id                          = "devops-lab4"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops-lab4"
    node_id                     = "R_kgDOIE1o8g"
    private                     = false
    repo_id                     = 541944050
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:TalgatBektleuov/devops-lab4.git"
    svn_url                     = "https://github.com/TalgatBektleuov/devops-lab4"
    visibility                  = "public"
    vulnerability_alerts        = false
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
    description                 = "Repository of terraform"
    etag                        = "W/\"bfdee8f7bd319c1f77dc188e2d09d1ac22f365764e1a80d5638a4be7d066c445\""
    full_name                   = "TalgatBektleuov/terraform-repo"
    git_clone_url               = "git://github.com/TalgatBektleuov/terraform-repo.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/TalgatBektleuov/terraform-repo"
    http_clone_url              = "https://github.com/TalgatBektleuov/terraform-repo.git"
    id                          = "terraform-repo"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "terraform-repo"
    node_id                     = "R_kgDOIE1o4A"
    private                     = false
    repo_id                     = 541944032
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:TalgatBektleuov/terraform-repo.git"
    svn_url                     = "https://github.com/TalgatBektleuov/terraform-repo"
    visibility                  = "public"
    vulnerability_alerts        = false
}

```

Importing the labs:
```
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/github$ terraform state list
```

Output:
```
github_branch_default.main
github_branch_protection.default
github_repository.devops-lab4
github_repository.repo
```
