# Local
## Terraform show (Tutorial)
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\docker>terraform show
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach                                      = false
    command                                     = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "ef85d4407a41"
    id                                          = "ef85d4407a418ec1aa77b6999b137b4ed72116b9b583a1700f14f9425d280a44"
    image                                       = "sha256:ac8efec875ce36b619cb41f91d9db579487b9d45ed29393dc957a745b1e0024f"
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
    name                                        = "tutorial"
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
    restart                                     = "no"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_signal                                 = "SIGQUIT"
    stop_timeout                                = 0
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:ac8efec875ce36b619cb41f91d9db579487b9d45ed29393dc957a745b1e0024fnginx:latest"
    image_id     = "sha256:ac8efec875ce36b619cb41f91d9db579487b9d45ed29393dc957a745b1e0024f"
    keep_locally = false
    latest       = "sha256:ac8efec875ce36b619cb41f91d9db579487b9d45ed29393dc957a745b1e0024f"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:ab589a3c466e347b1c0573be23356676df90cd7ce2dbf6ec332a5f0a8b5e59db"
}
```
## Terraform state list (Tutorial)
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\docker>terraform state list
docker_container.nginx
docker_image.nginx
```

## Terrafrom show (Configured)
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\docker>terraform show
# docker_container.moscow_time:
resource "docker_container" "moscow_time" {
    attach                                      = false
    command                                     = [
        "python3",
        "-m",
        "flask",
        "--app",
        "main.py",
        "run",
        "--host=0.0.0.0",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "005e489f9b61"
    id                                          = "005e489f9b616d0ca41cf28b54d1f2fb1099879367cea8d257732438372cab18"
    image                                       = "sha256:02e8218aeb91501100ba019ef1e5ac4414de84cd6c77740df3d9ee92d7553e67"
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
    name                                        = "moscow_time_default"
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
    restart                                     = "no"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app_python"

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.moscow_time:
resource "docker_image" "moscow_time" {
    id           = "sha256:02e8218aeb91501100ba019ef1e5ac4414de84cd6c77740df3d9ee92d7553e67glebsmetanin/moscow_time:latest"
    image_id     = "sha256:02e8218aeb91501100ba019ef1e5ac4414de84cd6c77740df3d9ee92d7553e67"
    keep_locally = false
    latest       = "sha256:02e8218aeb91501100ba019ef1e5ac4414de84cd6c77740df3d9ee92d7553e67"
    name         = "glebsmetanin/moscow_time:latest"
    repo_digest  = "glebsmetanin/moscow_time@sha256:9569763c7bf09e27971d47815d6fbd44310f8f29d1b689bed4ffd2ab7291972f"
}


Outputs:

container_id = "005e489f9b616d0ca41cf28b54d1f2fb1099879367cea8d257732438372cab18"
image_id = "sha256:02e8218aeb91501100ba019ef1e5ac4414de84cd6c77740df3d9ee92d7553e67glebsmetanin/moscow_time:latest"
```

## Terraform state list (Configured)
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\docker>terraform state list
docker_container.moscow_time
docker_image.moscow_time
```

## Terraform output
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\docker>terraform output
container_id = "005e489f9b616d0ca41cf28b54d1f2fb1099879367cea8d257732438372cab18"
image_id = "sha256:02e8218aeb91501100ba019ef1e5ac4414de84cd6c77740df3d9ee92d7553e67glebsmetanin/moscow_time:latest"
```


# Yandex Cloud

## Terraform show

```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\cloud>terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T23:08:39Z"
    folder_id                 = "b1gs6083oeefifj5f1gi"
    fqdn                      = "fhmqtt8pv93t61thl0ej.auto.internal"
    id                        = "fhmqtt8pv93t61thl0ej"
    labels                    = {}
    metadata                  = {
        "ssh-keys" = "AAAAC3NzaC1lZDI1NTE5AAAAIHRdSFvRdINDTMkNSEpbs+EInCXiUaQ8BgAJxr7bwBoi user@DESKTOP-L4BD1JV"
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "fhmuhdpcutoeh0tv66qb"
        disk_id     = "fhmuhdpcutoeh0tv66qb"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd80d7fnvf399b1c207j"
            size       = 30
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.13"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1a:ef:51:9f"
        nat                = true
        nat_ip_address     = "51.250.13.246"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b0ehmkffbi1amt2apv"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-26T23:05:37Z"
    folder_id  = "b1gs6083oeefifj5f1gi"
    id         = "enp2vkc9la71admu33fe"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9b0ehmkffbi1amt2apv",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T23:06:39Z"
    folder_id      = "b1gs6083oeefifj5f1gi"
    id             = "e9b0ehmkffbi1amt2apv"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp2vkc9la71admu33fe"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}


Outputs:

external_ip_address_vm_1 = "51.250.13.246"
internal_ip_address_vm_1 = "192.168.10.13"
```

## Terraform state list
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\cloud>terraform state list
yandex_compute_instance.vm-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

## Terraform output
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\cloud>terraform output
external_ip_address_vm_1 = "51.250.13.246"
internal_ip_address_vm_1 = "192.168.10.13"
```

# Github

## Terraform show
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\github>terraform show
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
    id                              = "BPR_kwDOIlX-784B5bZB"
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
    allow_rebase_merge          = false
    allow_squash_merge          = false
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Test terraform"
    etag                        = "W/\"55b8bfef90fd15dd4c4033460bce4ed6deed838a4afb27bd157b694c8b6d6ec2\""
    full_name                   = "SmetaninGleb/devops_terraform"
    git_clone_url               = "git://github.com/SmetaninGleb/devops_terraform.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/SmetaninGleb/devops_terraform"
    http_clone_url              = "https://github.com/SmetaninGleb/devops_terraform.git"
    id                          = "devops_terraform"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops_terraform"
    node_id                     = "R_kgDOIlX-7w"
    private                     = false
    repo_id                     = 576061167
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:SmetaninGleb/devops_terraform.git"
    svn_url                     = "https://github.com/SmetaninGleb/devops_terraform"
    visibility                  = "public"
    vulnerability_alerts        = false
}
```

## Terraform state list
```
(venv) C:\Users\User\Documents\Python Projects\devops\terraform\github>terraform state list
github_branch_default.master
github_branch_protection.default
github_repository.repo
```

## Best practices
- Use variables to hide information
- Use terraform files formatter
- Variables and outputs are in different files
- Checking changes with validate and plan