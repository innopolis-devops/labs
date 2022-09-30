# Outputs from Terraform setups

## Docker infrastructure

```terraform show```
```sh
# docker_container.msc_time:
resource "docker_container" "msc_time" {
    attach                                      = false
    command                                     = [
        "/bin/sh",
        "-c",
        "python main.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "19ad0db4e9a9"
    id                                          = "19ad0db4e9a9958a298f1ccbd79562b6e0a584a76303423154119543b10b4416"
    image                                       = "sha256:4e4a65efc5ebecb583fa11de6050d4427429507647873d914aeffe0ef748aa5d"
    init                                        = false
    ip_address                                  = "172.17.0.2"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "msc_time_py"
    network_data                                = [
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
    network_mode                                = "default"
    privileged                                  = false
    publish_all_ports                           = false
    read_only                                   = false
    remove_volumes                              = true
    restart                                     = "always"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "app_user"
    working_dir                                 = "/app"

    ports {
        external = 80
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```

```terraform state list```
```sh
docker_container.msc_time
```

## ~~AWS infrastructure~~
> Sorry, we need to pay to use AWS but we live in Russia. I can use VPN (and what I do), but I have no foreign bank card to link with account...

## Yandex.Cloud

```terraform show```
```sh
# yandex_compute_instance.msc_time-vm:
resource "yandex_compute_instance" "msc_time-vm" {
    created_at                = "2022-09-30T20:04:02Z"
    folder_id                 = "b1gep7igk87unm156jvk"
    fqdn                      = "fhmm3stnspng49ld24cd.auto.internal"
    id                        = "fhmm3stnspng49ld24cd"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm2g2g3gm3cjg8l71cl"
        disk_id     = "fhm2g2g3gm3cjg8l71cl"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8kdq6d0p8sij7h5qe3"
            size       = 10
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.9"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:16:1f:3b:7e"
        nat                = false
        security_group_ids = []
        subnet_id          = "e9bupthc9p5nlro20ok3"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.default:
resource "yandex_vpc_network" "default" {
    created_at = "2022-09-30T20:04:00Z"
    folder_id  = "b1gep7igk87unm156jvk"
    id         = "enplbdrhs338r82dp76j"
    labels     = {}
    name       = "msc_time-network"
    subnet_ids = []
}

resource "yandex_vpc_subnet" "default" {
    created_at     = "2022-09-30T20:04:01Z"
    folder_id      = "b1gep7igk87unm156jvk"
    id             = "e9bupthc9p5nlro20ok3"
    labels         = {}
    name           = "msc_tim-subnetwork"
    network_id     = "enplbdrhs338r82dp76j"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
``` 

```terraform state list```
```sh
yandex_compute_instance.msc_time-vm
yandex_vpc_network.default
yandex_vpc_subnet.default
```

## GitHub infrastructure

After the use of `terraform apply`, entering the GitHub access token and printing yes, I got:
```sh
github_repository.test: Creating...
github_repository.test: Creation complete after 7s [id=Andrey-Terraform-Test]
github_branch.master: Creating...
github_branch.master: Creation complete after 3s [id=Andrey-Terraform-Test:master]
github_branch_default.master: Creating...
github_branch_default.master: Creation complete after 3s [id=Andrey-Terraform-Test]
github_branch_protection.default: Creating...
github_branch_protection.default: Creation complete after 5s [id=BPR_kwDOIErgis4Bv8JG]
```

As a result:

`terraform show`
```sh
# github_branch.master:
resource "github_branch" "master" {
    branch        = "master"
    etag          = "W/\"6b1d2a8c5f90779b892d667401b43e0c8668af340d8c746ad060334c32577c22\""
    id            = "Andrey-Terraform-Test:master"
    ref           = "refs/heads/master"
    repository    = "Andrey-Terraform-Test"
    sha           = "f3469bcc2d47106d65b0273f329fb618c0dd0413"
    source_branch = "main"
    source_sha    = "f3469bcc2d47106d65b0273f329fb618c0dd0413"
}

# github_branch_default.master:
resource "github_branch_default" "master" {
    branch     = "master"
    id         = "Andrey-Terraform-Test"
    repository = "Andrey-Terraform-Test"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOIEsAzM4Bv8St"
    pattern                         = "master"
    repository_id                   = "Andrey-Terraform-Test"
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

# github_repository.test:
resource "github_repository" "test" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Test repo to learn the Terraform functionality with GitHub"
    etag                        = "W/\"f1e6ee81e3a8e3f9d1632249d4df0c1e2d9ab788bb01e2e52d8668f81d3e3061\""
    full_name                   = "Andrew174194/Andrey-Terraform-Test"
    git_clone_url               = "git://github.com/Andrew174194/Andrey-Terraform-Test.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/Andrew174194/Andrey-Terraform-Test"
    http_clone_url              = "https://github.com/Andrew174194/Andrey-Terraform-Test.git"
    id                          = "Andrey-Terraform-Test"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "Andrey-Terraform-Test"
    node_id                     = "R_kgDOIEsAzA"
    private                     = false
    repo_id                     = 541786316
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:Andrew174194/Andrey-Terraform-Test.git"
    svn_url                     = "https://github.com/Andrew174194/Andrey-Terraform-Test"
    visibility                  = "public"
    vulnerability_alerts        = false
}
```
`terraform state list`
```sh
github_branch.master
github_branch_default.master
github_branch_protection.default
github_repository.test
```

Also, here is a link to that repo as a proof: https://github.com/Andrew174194/Andrey-Terraform-Test
> (I'll keep it for a while and will delete it after the grading)
