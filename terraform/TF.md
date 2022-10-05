# Terraform Infrastructure

<!-- Suppress linter warnings for HTML tags -->
<!-- markdownlint-disable MD033 -->

## Table of contents

- [Docker](#docker)
- [Yandex Cloud](#yandex-cloud)
- [GitHub](#github-repository) (with the [bonus task](#bonus-disable-squash-and-rebase-commits))
- [Best practices](#best-practices-used)

## Docker

### Initial setup

#### `terraform show` output

<details>
<summary>Click to show...</summary>

```terraform
# docker_container.python_app:
resource "docker_container" "python_app" {
    attach                                      = false
    command                                     = [
        "./.venv/bin/gunicorn",
        "--config",
        "./app/config/gunicorn.conf.py",
        "app.api:app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "2c7d1f456f52"
    id                                          = "2c7d1f456f5232a60d412423b3e2a0bca13941de8fe92871aa08121ce080e5a7"
    image                                       = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349f"
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
    name                                        = "python_app"
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
    user                                        = "app"
    working_dir                                 = "/app"

    ports {
        external = 8000
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.python_app:
resource "docker_image" "python_app" {
    id           = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349fntdesmond/iu-devops-python:latest"
    image_id     = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349f"
    keep_locally = false
    latest       = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349f"
    name         = "ntdesmond/iu-devops-python:latest"
    repo_digest  = "ntdesmond/iu-devops-python@sha256:2473c63d1e737369473c3af1ea4b3ef1c20539553a946be3f0f957c087097885"
}
```

</details>

#### `terraform state list` output

```terraform
docker_container.python_app
docker_image.python_app
```

### Changes

The changes applied were:

- the container being renamed (not seen in `terraform plan` since the default value matched the one used previously)
- external port changed from `8000` to `8080`
- added outputs (see [`outputs.tf`](./docker/outputs.tf))

#### `terraform plan` output (changes preview)

##### Full output

<details>
<summary>Click to show...</summary>

```terraform
Terraform will perform the following actions:

  # docker_container.python_app must be replaced
-/+ resource "docker_container" "python_app" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "./.venv/bin/gunicorn",
          - "--config",
          - "./app/config/gunicorn.conf.py",
          - "app.api:app",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      ~ gateway                                     = "172.17.0.1" -> (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "2c7d1f456f52" -> (known after apply)
      ~ id                                          = "2c7d1f456f5232a60d412423b3e2a0bca13941de8fe92871aa08121ce080e5a7" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "python_app"
      ~ network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> (known after apply)
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      + stop_signal                                 = (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - user                                        = "app" -> null
      - working_dir                                 = "/app" -> null
        # (12 unchanged attributes hidden)

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
```

</details>

##### The part that is controlled manually

```terraform
      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
```

#### `terraform output` output

```terraform
container_id = "94f215dbdb034aef3734438e10870177db4971c71e69559725ced8ad04e138fb"
image_name = "ntdesmond/iu-devops-python:latest"
ports = [
  "8080 -> 8000",
]
```

## Yandex Cloud

Followed the tutorial from Yandex Cloud Docs, available here:
<https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart>.

It goes through creating two virtual machines and a network between them.

### Setup

Refer to the [`yandex_cloud`](./yandex_cloud) folder for the source files.

Outputs have been also created at the initial setup.

#### `terraform show`

<details>
<summary>Click to show...</summary>

```terraform
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-22T20:55:05Z"
    folder_id                 = "<REDACTED>"
    fqdn                      = "epd6gt5t47g7johbvruu.auto.internal"
    id                        = "epd6gt5t47g7johbvruu"
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: amogus
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh_authorized_keys:
                  - ssh-ed25519 AAAA......Z1Pc user@hehe-host
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epd7q7n0qoldae61411m"
        disk_id     = "epd7q7n0qoldae61411m"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd80jdh4pvsj48qftb3d"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.20"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:68:74:bd:21"
        nat                = true
        nat_ip_address     = "51.250.27.108"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e2lqh2jj3krtj4h1tmjo"
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

# yandex_compute_instance.vm-2:
resource "yandex_compute_instance" "vm-2" {
    created_at                = "2022-09-22T20:55:05Z"
    folder_id                 = "<REDACTED>"
    fqdn                      = "epd8mek89vp90odvt48c.auto.internal"
    id                        = "epd8mek89vp90odvt48c"
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: sus
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh_authorized_keys:
                  - ssh-ed25519 AAAA......hHUb user@hehe-host
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epdh0t9fh4egfdajts14"
        disk_id     = "epdh0t9fh4egfdajts14"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd80jdh4pvsj48qftb3d"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.16"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:8b:3a:88:4f"
        nat                = true
        nat_ip_address     = "84.201.162.213"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e2lqh2jj3krtj4h1tmjo"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 4
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-22T20:33:17Z"
    folder_id  = "<REDACTED>"
    id         = "enpj6tmle0e1jv99681f"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e2lqh2jj3krtj4h1tmjo",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-22T20:54:13Z"
    folder_id      = "<REDACTED>"
    id             = "e2lqh2jj3krtj4h1tmjo"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpj6tmle0e1jv99681f"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}


Outputs:

external_ip_address_vm_1 = "51.250.27.108"
external_ip_address_vm_2 = "84.201.162.213"
internal_ip_address_vm_1 = "192.168.10.20"
internal_ip_address_vm_2 = "192.168.10.16"
```

</details>

At this point I was able to try out SSH connections between the VMs.

<details>
<summary>Click to show the image...</summary>

![SSH connection](https://i.imgur.com/BO9B1OJ.png)

</details>

#### `terraform state list`

```terraform
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

### Changes to the plan

The changes applied were:

- Change RAM and CPU count for the second VM (to 2 GB and 2 vCPU instead of 4 and 4)

#### `terraform plan` output

##### First attempt

<details>
<summary>Click to show...</summary>

```terraform
Terraform will perform the following actions:

  # yandex_compute_instance.vm-2 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-2" {
        id                        = "epd8mek89vp90odvt48c"
        name                      = "terraform2"
        # (9 unchanged attributes hidden)

      ~ resources {
          ~ cores         = 4 -> 2
          ~ memory        = 4 -> 2
            # (2 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

</details>

##### The problem

But after running `terraform apply`, here appears an error:

```text
Error: Changing the resources, platform_id, network_acceleration_type, scheduling_policy, placement_policy in an instance requires stopping it. To acknowledge this action, please set allow_stopping_for_update = true in your config file.
```

##### The new version

<details>
<summary>Click to show...</summary>

```terraform
Terraform will perform the following actions:

  # yandex_compute_instance.vm-2 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-2" {
      + allow_stopping_for_update = true
        id                        = "epd8mek89vp90odvt48c"
        name                      = "terraform2"
        # (9 unchanged attributes hidden)

      ~ resources {
          ~ cores         = 4 -> 2
          ~ memory        = 4 -> 2
            # (2 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  - external_ip_address_vm_2 = "84.201.162.213" -> null
```

</details>

#### `terraform output`

##### First attempt (yes)

```terraform
external_ip_address_vm_1 = "51.250.27.108"
external_ip_address_vm_2 = ""
internal_ip_address_vm_1 = "192.168.10.20"
internal_ip_address_vm_2 = "192.168.10.16"
```

##### Another problem

For some reason, the second VM now does not have an IP address... or does it? While trying to run `terraform destroy`, I noticed that IP is written there:

```terraform
Changes to Outputs:
  - external_ip_address_vm_1 = "51.250.27.108" -> null
  - external_ip_address_vm_2 = "84.201.137.155" -> null
  - internal_ip_address_vm_1 = "192.168.10.20" -> null
  - internal_ip_address_vm_2 = "192.168.10.16" -> null
```

But it was still unavailable in `terraform output`.

I googled a bit and found out that there is a way to *refresh* the outputs:

```sh
terraform apply -refresh-only
```

After that, `terraform output` worked as it should had done originally:

##### Final result

```terraform
external_ip_address_vm_1 = "51.250.27.108"
external_ip_address_vm_2 = "84.201.137.155"
internal_ip_address_vm_1 = "192.168.10.20"
internal_ip_address_vm_2 = "192.168.10.16"
```

## Github repository

### Importing the repo

In the [`./github`](./github/) folder, running:

```sh
export GITHUB_TOKEN="<TOKEN>"
terraform init
terraform import "github_repository.repo" "iu-devops-labs"
```

After the successful import, `terraform show` shows the `github_repository.repo` resource with all the params.

### Applying changes

The changes added were:

- default `master` branch
- protection rules on the `master` branch
  - no force pushes
  - no branch deletion
  - conversation resolutions are required
- (unintentional) disable downloads, projects and issues
  - decided not to keep them since we're not using them anyway

#### The plan

<details>
<summary>Click to show...</summary>

```terraform
Terraform will perform the following actions:

  # github_branch_default.master will be created
  + resource "github_branch_default" "master" {
      + branch     = "master"
      + id         = (known after apply)
      + repository = "iu-devops-labs"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "master"
      + repository_id                   = "iu-devops-labs"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false
    }

  # github_repository.repo will be updated in-place
  ~ resource "github_repository" "repo" {
      - has_downloads               = true -> null
      - has_projects                = true -> null
      - has_wiki                    = true -> null
        id                          = "iu-devops-labs"
        name                        = "iu-devops-labs"
        # (28 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 0 to destroy.
```

</details>

#### Result (checking GitHub web interface)

<details>
<summary>Click to show the image...</summary>

![Screenshot](https://imgur.com/IHeifgR.png)

</details>

### Bonus: disable squash and rebase commits

#### Plan

<details>
<summary>Click to show...</summary>

```terraform
Terraform will perform the following actions:

  # github_repository.repo will be updated in-place
  ~ resource "github_repository" "repo" {
      ~ allow_rebase_merge          = true -> false
      ~ allow_squash_merge          = true -> false
        id                          = "iu-devops-labs"
        name                        = "iu-devops-labs"
        # (29 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

</details>

#### Result (GitHub web interface)

<details>
<summary>Click to show the image...</summary>

![Screenshot](https://i.imgur.com/Cd8Qvlz.png)

</details>

## Best practices used

- Variables and outputs:
  - are declared separately
  - have a descriptive name and description
  - variables also have types defined
- External files (e.g. user configs for Yandex Cloud setup) are moved into a separate directories
- Built-in formatting is used (`terraform fmt`)
- dependency lock (`.terraform.lock.hcl`) is uploaded together with other files to track the changes of dependencies
- secrets are not commited, stored as env variables instead
