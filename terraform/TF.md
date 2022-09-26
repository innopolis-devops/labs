# Terraform

This folder contains all tasks done with the use of terraform.

## Best practices applied
1. Use of terraform variables in file `variables.tf`
2. Use of output values to organize data in file `variables.tf`
3. Use of built-in terraform linter `terraform fmt`
4. Use of built-in terraform validator before changes`terraform validator`
5. Use of built-in terraform planning tool before changes `terraform plan`
6. Use of terraform modules
7. No hardcoded secrets
8. Following a naming convention
9. Readable descriptions of variables

### Building Docker infrastructure using Terraform

#### Resulting states
* After running command `terraform state list` the following output is provided:
```shell
docker_container.app_python
docker_image.app_python
```
* After running command `terraform state show docker_container.app_python` the following output is provided:
```shell
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "python",
        "manage.py",
        "runserver",
        "0.0.0.0:8000",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "90503c6570f2"
    id                                          = "90503c6570f29ac6e60ddfca1e5497269d422dd8754da12ebbf1fc306a494b3b"
    image                                       = "sha256:5712fc06387c8939772bd2f2c466f0c991b9b559d7dcc67eb614691994d66eb5"
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
    user                                        = "app_user:app_user"
    working_dir                                 = "/usr/src/app"

    ports {
        external = 8000
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```
* After running command `terraform state show docker_image.app_python` the following output is provided:
```shell
# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:5712fc06387c8939772bd2f2c466f0c991b9b559d7dcc67eb614691994d66eb5mcflydesigner/django-iu-lab:latest"
    image_id     = "sha256:5712fc06387c8939772bd2f2c466f0c991b9b559d7dcc67eb614691994d66eb5"
    keep_locally = false
    latest       = "sha256:5712fc06387c8939772bd2f2c466f0c991b9b559d7dcc67eb614691994d66eb5"
    name         = "mcflydesigner/django-iu-lab:latest"
    repo_digest  = "mcflydesigner/django-iu-lab@sha256:edc6649f61534012cff8139d223adec1c6978c3d7b643476a53ad598fd99582e"
}
```

#### Changing state
* Changing external port from 80 to 8000. Using command `terraform apply` the following output is obtained:
```shell
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.app_python must be replaced
-/+ resource "docker_container" "app_python" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python",
          - "manage.py",
          - "runserver",
          - "0.0.0.0:8000",
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
      ~ hostname                                    = "bef587a9fc84" -> (known after apply)
      ~ id                                          = "bef587a9fc8422c20256b1a614f6fb3856bf8fe3c5a08ff7de7abe3c668fb274" -> (known after apply)
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
      - user                                        = "app_user:app_user" -> null
      - working_dir                                 = "/usr/src/app" -> null
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
          ~ external = 80 -> 8000 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
```

#### Output of terraform
* After running command `terraform output` the following output is obtained:
```shell
container_id = "4caf922dee2dcb2f61a230c1ee29f3947f585400bf2071364fa36d8d0016c934"
image_id = "sha256:5712fc06387c8939772bd2f2c466f0c991b9b559d7dcc67eb614691994d66eb5mcflydesigner/django-iu-lab:latest"
```



### Building infrastructure in Yandex Cloud using Terraform

#### Resulting states
* After running command `terraform state list` the following output is provided:
```shell
yandex_compute_instance.vm-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```
* After running command `terraform state show yandex_compute_instance.vm-1` the following output is provided:
```shell
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T15:35:58Z"
    folder_id                 = "b1g2voho7k88r1bngi0a"
    fqdn                      = "fhmm42kjb98guofuune1.auto.internal"
    id                        = "fhmm42kjb98guofuune1"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa *RSA_KEY_WAS_HERE* key@OWNER
        EOT
    }
    name                      = "terraform-app"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmfhqfddctbvns4u3vv"
        disk_id     = "fhmfhqfddctbvns4u3vv"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8kdq6d0p8sij7h5qe3"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.22"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:16:20:a9:35"
        nat                = true
        nat_ip_address     = "178.154.204.240"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bdvetclgo4qvh9n0vc"
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
```
* After running command `terraform state show yandex_vpc_network.network-1` the following output is provided:
```shell
# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-26T15:33:17Z"
    folder_id  = "b1g2voho7k88r1bngi0a"
    id         = "enp03ig6v6b4fmd7lbv4"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bdvetclgo4qvh9n0vc",
    ]
}
```

* After running command `terraform state show yandex_vpc_subnet.subnet-1` the following output is provided:
```shell
# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T15:33:18Z"
    folder_id      = "b1g2voho7k88r1bngi0a"
    id             = "e9bdvetclgo4qvh9n0vc"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp03ig6v6b4fmd7lbv4"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
```

#### Changing state
* Changing the the name of VM from `terraform-app` to `terraform-app-name` and adding parameter `allow_stopping_for_update=true` for the resource `yandex_compute_instance`. Using command `terraform apply` the following output is obtained:
```shell
Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-1" {
      + allow_stopping_for_update = true
        id                        = "fhmm42kjb98guofuune1"
      ~ name                      = "terraform-app" -> "terraform-app-name"
        # (9 unchanged attributes hidden)

        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

#### Output of terraform
* After running command `terraform output` the following output is obtained:
```shell
external_ip_address_vm_1 = "178.154.204.240"
internal_ip_address_vm_1 = "192.168.10.22"
```
