# Terraform

## Docker task

### `terraform show` output

```
resource "docker_container" "app_python" {
    attach            = false
    command           = [
        "gunicorn",
        "--bind=0.0.0.0",
        "app:app",
    ]
    cpu_shares        = 0
    entrypoint        = []
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "0f29627956cd"
    id                = "0f29627956cd4e7bb79d6809d08c1e503923128e8b465dba739ef56b5102d47e"
    image             = "sha256:23c15ff1d1d39a2f3382b0f59244ce055a588cc6e83c02a744aa8f941394d44a"
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
    name              = "app_python_container"
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
    security_opts     = []
    shm_size          = 64
    start             = true
    stdin_open        = false
    tty               = false
    user              = "app"
    working_dir       = "/usr/src/app_python"

    ports {
        external = 8000
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:23c15ff1d1d39a2f3382b0f59244ce055a588cc6e83c02a744aa8f941394d44ailyakolomin/devops_app_python:latest"
    keep_locally = false
    latest       = "sha256:23c15ff1d1d39a2f3382b0f59244ce055a588cc6e83c02a744aa8f941394d44a"
    name         = "ilyakolomin/devops_app_python:latest"
    repo_digest  = "ilyakolomin/devops_app_python@sha256:2b8debba00ff52f8266a52830c490b94a52cf3e188eda3bb5036d1fbcae33499"
}
```

### `terraform state list` output

```
docker_container.app_pythonython
docker_image.app_python
```

### Change structure

```
Terraform will perform the following actions:

  # docker_container.app_python must be replaced
-/+ resource "docker_container" "app_python" {
      + bridge            = (known after apply)
      ~ command           = [
          - "gunicorn",
          - "--bind=0.0.0.0",
          
      ...
          
      ~ image             = "sha256:23c15ff1d1d39a2f3382b0f59244ce055a588cc6e83c02a744aa8f941394d44a" -> "ilyakolomin/devops_app_python:latest" # forces replacement

      ...
      
      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
```

### `terraform output` output

```
container_id = "daa672528f35e2ef91b55b8b697e5a9fb54e5884a8da1d25ac398c0411140ab6" 
image_id = "sha256:23c15ff1d1d39a2f3382b0f59244ce055a588cc6e83c02a744aa8f941394d44ailyakolomin/devops_app_python:latest"
```

## Yandex cloud task

### `terraform show` output

```
# yandex_compute_instance.ilya-vm: 
resource "yandex_compute_instance" "ilya-vm" {
    created_at                = "2022-09-26T17:07:36Z"
    folder_id                 = "b1g9ea4vhpe8sc5fv452"
    fqdn                      = "fhm6vf8dgmka0upn33i9.auto.internal"
    id                        = "fhm6vf8dgmka0upn33i9"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjj0M/wwxHM77P/jIvXeOG8lrksD0Xq0hiGzNcsEnmKxmi7udXEcH3x6bUZ+VH3BRH+zVbFiuOOjhLTR/Uf3dozRA+CMcTaDqsI03M6CGBPCr9RUxts52rdvLjDNSIiUsZBsoRacxb4fHOJOtVLys8rdTVF05V+WFb1fysvTzYfTs1ZckA+7IgI1DxpNk3i+14x1ITDZRkYnRXyZTUtqqhG9+2ciGEZ8S32htNyUP4wfOXJ+MgeCNAr6sj6Bq/knGCyF9zC467qTPcIq3OPUnEN/uj//UNnEBCLTKxdXNzhX1qSyUy0lR8cDp6RcZh/7GWWHhmvEEpSVpAJRtAWvEbPrwt2yNK0ljnsPBlXHBG5+4AAxmb7JUVDB4zr8CYp5JT8fcSchK0CBnnRbTTAytGzMgaj2d2M55Q8iBShleM+b7fsBvQFaJyPY3Odt6YqIk1NUfOWHoiA2XVDPxFm8logt4Ii7PkHoObfOCJzkdGKDl4E2rb9Nch66smmZPlIAk= ilya@MacBook-Pro-Ilya.local
        EOT
    }
    name                      = "ilya-vm"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmvcktnuph8rl4b0s7e"
        disk_id     = "fhmvcktnuph8rl4b0s7e"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8lbi4hr72am1eb2kmf"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "10.2.0.33"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:6f:bd:0d:85"
        nat                = false
        security_group_ids = []
        subnet_id          = "e9bv9ikf6qjgacmcgobv"
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

# yandex_vpc_network.ilya-vpc:
resource "yandex_vpc_network" "ilya-vpc" {
    created_at = "2022-09-26T16:59:32Z"
    folder_id  = "b1g9ea4vhpe8sc5fv452"
    id         = "enpf3cfm4414e91mo2nv"
    labels     = {}
    subnet_ids = [
        "e9bv9ikf6qjgacmcgobv",
    ]
}

# yandex_vpc_subnet.ilya-vpc-subnet:
resource "yandex_vpc_subnet" "ilya-vpc-subnet" {
    created_at     = "2022-09-26T17:00:35Z"
    folder_id      = "b1g9ea4vhpe8sc5fv452"
    id             = "e9bv9ikf6qjgacmcgobv"
    labels         = {}
    network_id     = "enpf3cfm4414e91mo2nv"
    v4_cidr_blocks = [
        "10.2.0.0/16",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

vm-id = "fhm6vf8dgmka0upn33i9"
```

### `terraform state list` output

```
yandex_compute_instance.ilya-vm 
yandex_vpc_network.ilya-vpc
yandex_vpc_subnet.ilya-vpc-subnet
```

### Changed structure and input variables output

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.ilya-vm will be updated in-place
  ~ resource "yandex_compute_instance" "ilya-vm" {
        id                        = "fhm6vf8dgmka0upn33i9"
      ~ name                      = "ilya-vm" -> "ilya-vm-new"
        # (9 unchanged attributes hidden)

        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

### `terraform output` output

```
❯ terraform output
vm-id = "fhm6vf8dgmka0upn33i9" 
```

## GitHub task

### `terraform apply` output

```
github_repository.devops: Refreshing state... [id=DevOps] 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_branch_default.master will be created
  + resource "github_branch_default" "master" {
      + branch     = "master"
      + id         = (known after apply)
      + repository = "DevOps"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "master"
      + repository_id                   = "DevOps"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false

      + required_pull_request_reviews {
          + required_approving_review_count = 1
        }
    }

  # github_repository.devops will be updated in-place
  ~ resource "github_repository" "devops" {
      ~ allow_rebase_merge          = true -> false
      ~ allow_squash_merge          = true -> false
      ~ auto_init                   = false -> true
      - has_downloads               = true -> null
      ~ has_issues                  = false -> true
      - has_projects                = true -> null
      ~ has_wiki                    = true -> false
        id                          = "DevOps"
        name                        = "DevOps"
        # (25 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 0 to destroy.
```

## Best practices

- Do not hard-code tokens, use env variables
- `.terraform.lock.hcl` is used
- Variables declared in `variables.tf`
- Used terraform linter
- use `.gitignore` for terraform
