# Terraform

## Best practices

- Put the input variables into a separate file [variables.tf](https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables#parameterize-your-configuration).
  - Used `sensitive` field to hide values

- Put the variable definitions into `.tfvars` files, gitignore them

- Put the Terraform files into the Git VCS

### Nix eDSL

- Made a Nix [eDSL](https://github.com/deemp/terrafix) which can be translated into [HCL](https://github.com/hashicorp/hclblob/main/hclsyntax/spec.md). Now, it's possible to generate Terraform files from DRY Nix code

## Generated repository

- [terraform-repo](https://github.com/deemp/terraform-repo)
  - with `squash` and `rebase` disabled

## Docker

### Outputs before changes

<details>
    <summary>Spoiler: <code>terraform show -no-color</code></summary>

```nix
# docker_container.app_purescript:
resource "docker_container" "app_purescript" {
    attach                                      = false
    command                                     = []
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "bash",
        "-c",
        "parcel serve -p $PORT --host $HOST dev/index.html",
    ]
    env                                         = [
        "HOST=0.0.0.0",
        "PORT=80",
    ]
    gateway                                     = "172.17.0.1"
    hostname                                    = "e69f24ef80b2"
    id                                          = "e69f24ef80b203483aafee32623c3c41b6fcf8d8cd8f5dde1bcb8842b8c08713"
    image                                       = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79"
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
    name                                        = "app_purescript"
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
    user                                        = "codewarrior"
    working_dir                                 = "/app"

    host {
        host = "localhost"
        ip   = "0.0.0.0"
    }

    ports {
        external = 8003
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }

    volumes {
        container_path = "/app"
        host_path      = "/home/eyjafjallajokull/Desktop/devops-labs/app_purescript"
        read_only      = false
    }
}

# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "uvicorn --reload --host $HOST --port $PORT app.main:app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "bash",
        "-c",
    ]
    env                                         = [
        "HOST=0.0.0.0",
        "PORT=80",
    ]
    gateway                                     = "172.17.0.1"
    hostname                                    = "54405fcecef9"
    id                                          = "54405fcecef9a1829f9fd5757e92cdba5b6f18c6fd861ad972a3d57d5d5b6550"
    image                                       = "sha256:59f8ae5d996cdc41d7053fc4ae278f56ab03fd1570ae1a2342bdd7d0c66d9f5b"
    init                                        = false
    ip_address                                  = "172.17.0.3"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python"
    network_data                                = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.3"
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
    working_dir                                 = "/app"

    host {
        host = "localhost"
        ip   = "0.0.0.0"
    }

    ports {
        external = 8002
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }

    volumes {
        container_path = "/app"
        host_path      = "/home/eyjafjallajokull/Desktop/devops-labs/app_python"
        read_only      = false
    }
}

# docker_image.app_purescript:
resource "docker_image" "app_purescript" {
    id           = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79dademd/app_purescript:latest"
    image_id     = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79"
    keep_locally = false
    latest       = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79"
    name         = "dademd/app_purescript:latest"
    repo_digest  = "dademd/app_purescript@sha256:de33a30dd54322229b15f22a0d453442b4d66fea8e193d03137a0825f5784d56"
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:59f8ae5d996cdc41d7053fc4ae278f56ab03fd1570ae1a2342bdd7d0c66d9f5bdademd/app_python:latest"
    image_id     = "sha256:59f8ae5d996cdc41d7053fc4ae278f56ab03fd1570ae1a2342bdd7d0c66d9f5b"
    keep_locally = false
    latest       = "sha256:59f8ae5d996cdc41d7053fc4ae278f56ab03fd1570ae1a2342bdd7d0c66d9f5b"
    name         = "dademd/app_python:latest"
    repo_digest  = "dademd/app_python@sha256:3cbf4ea5dab7085bb77587e1312bb36c5e48a2de2637e502093f213d442f4fd4"
}
```

</details>

`terraform state list`

```nix
docker_container.try_app_purescript
docker_container.try_app_python
docker_image.try_app_purescript
docker_image.try_app_python
```

### Diff of outputs after changes

<details>
    <summary>Spoiler: <code>terraform show -no-color</code></summary>

```diff
1,2c1,2
< # docker_container.app_purescript:
< resource "docker_container" "app_purescript" {
---
> # docker_container.try_app_purescript:
> resource "docker_container" "try_app_purescript" {
17,19c17,19
<     hostname                                    = "e69f24ef80b2"
<     id                                          = "e69f24ef80b203483aafee32623c3c41b6fcf8d8cd8f5dde1bcb8842b8c08713"
<     image                                       = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79"
---
>     hostname                                    = "e7c2d7f188b6"
>     id                                          = "e7c2d7f188b62520914a73f11c459ec28c24ace5926579fc598806824191a271"
>     image                                       = "sha256:092bf844fd0268da99bb35cd543a454c201dec87c8404d125c72ce6759b14d80"
30c30
<     name                                        = "app_purescript"
---
>     name                                        = "try_app_purescript"
78,79c78,79
< # docker_container.app_python:
< resource "docker_container" "app_python" {
---
> # docker_container.try_app_python:
> resource "docker_container" "try_app_python" {
95,96c95,96
<     hostname                                    = "54405fcecef9"
<     id                                          = "54405fcecef9a1829f9fd5757e92cdba5b6f18c6fd861ad972a3d57d5d5b6550"
---
>     hostname                                    = "6b6ef98bdb2a"
>     id                                          = "6b6ef98bdb2a4e12f7ee502d4e35a9434f3c5f79957e1bec4616a46de113419a"
108c108
<     name                                        = "app_python"
---
>     name                                        = "try_app_python"
155,158c155,158
< # docker_image.app_purescript:
< resource "docker_image" "app_purescript" {
<     id           = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79dademd/app_purescript:latest"
<     image_id     = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79"
---
> # docker_image.try_app_purescript:
> resource "docker_image" "try_app_purescript" {
>     id           = "sha256:092bf844fd0268da99bb35cd543a454c201dec87c8404d125c72ce6759b14d80dademd/app_purescript:latest"
>     image_id     = "sha256:092bf844fd0268da99bb35cd543a454c201dec87c8404d125c72ce6759b14d80"
160c160
<     latest       = "sha256:054063923f038046ef882f5a08279f93b65942068362f6bf87f1a397c306ff79"
---
>     latest       = "sha256:092bf844fd0268da99bb35cd543a454c201dec87c8404d125c72ce6759b14d80"
162d161
<     repo_digest  = "dademd/app_purescript@sha256:de33a30dd54322229b15f22a0d453442b4d66fea8e193d03137a0825f5784d56"
165,166c164,165
< # docker_image.app_python:
< resource "docker_image" "app_python" {
---
> # docker_image.try_app_python:
> resource "docker_image" "try_app_python" {
```

</details>

`terraform state list`:

```diff
1,4c1,4
< docker_container.app_purescript
< docker_container.app_python
< docker_image.app_purescript
< docker_image.app_python
---
> docker_container.try_app_purescript
> docker_container.try_app_python
> docker_image.try_app_purescript
> docker_image.try_app_python
```

## Yandex Cloud

- [Tutorial](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#get-credentials)

- `.gitignore` [template](https://github.com/github/gitignore/blob/main/Terraform.gitignore)

### Outputs before changes

<details>
    <summary>Spoiler: <code>terraform show -no-color</code></summary>


```nix
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-10-17T18:07:04Z"
    folder_id                 = "b1gts78appf1ipshtfmb"
    fqdn                      = "fhmtmtq5tjk5lnhh5oq5.auto.internal"
    id                        = "fhmtmtq5tjk5lnhh5oq5"
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: br4ch
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh_authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhKZZ1GE1Pj8xWNXZhzWnJAu4JZnvXd5ZV9nsEPD9++ eyjafjallajokull@Eyjafjallajokull
        EOT
    }
    name                      = "terraform-1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmtvf13qtftt6tsavel"
        disk_id     = "fhmtvf13qtftt6tsavel"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8ingbofbh3j5h7i8ll"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.10"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1d:b7:74:5e"
        nat                = true
        nat_ip_address     = "178.154.204.228"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b6kgu8fvdokldofl7m"
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
    created_at                = "2022-10-17T18:04:55Z"
    folder_id                 = "b1gts78appf1ipshtfmb"
    fqdn                      = "fhm9jv5dtsq4qkjko7c1.auto.internal"
    id                        = "fhm9jv5dtsq4qkjko7c1"
    labels                    = {}
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: br4ch
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh_authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhKZZ1GE1Pj8xWNXZhzWnJAu4JZnvXd5ZV9nsEPD9++ eyjafjallajokull@Eyjafjallajokull
        EOT
    }
    name                      = "terraform-2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmghlt6qhjj5at17818"
        disk_id     = "fhmghlt6qhjj5at17818"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8ingbofbh3j5h7i8ll"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.23"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:99:fc:ad:ef"
        nat                = true
        nat_ip_address     = "178.154.220.39"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b6kgu8fvdokldofl7m"
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
    created_at = "2022-10-11T18:02:20Z"
    folder_id  = "b1gts78appf1ipshtfmb"
    id         = "enpr4jc0itligrtg8h54"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9b6kgu8fvdokldofl7m",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-10-11T18:02:21Z"
    folder_id      = "b1gts78appf1ipshtfmb"
    id             = "e9b6kgu8fvdokldofl7m"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpr4jc0itligrtg8h54"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "178.154.204.228"
external_ip_address_vm_2 = "178.154.220.39"
internal_ip_address_vm_1 = "192.168.10.10"
internal_ip_address_vm_2 = "192.168.10.23"
```

</details>

`terraform state list`:

```nix
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

### Diff of outputs after changes

`terraform show -no-color`

```diff
6a7
>     labels                    = {}
19c20
<     name                      = "terraform-1"
---
>     name                      = "try-terraform-1"
87c88
<     name                      = "terraform-2"
---
>     name                      = "try-terraform-2"
```

`terraform state list`

```diff
```
