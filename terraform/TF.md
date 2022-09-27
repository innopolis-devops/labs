# TF

## Docker

### Init

```bash
terraform show
# module.py_app.docker_container.app:
resource "docker_container" "app" {
    attach                                      = false
    command                                     = [
        "python",
        "-m",
        "app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "72960d41bfc4"
    id                                          = "72960d41bfc4a5b6859cda601264de771440704571bfca9d002b5d3b5e2db8c3"
    image                                       = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
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
    name                                        = "web_py"
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
    rm                                          = true
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "user"
    working_dir                                 = "/app"

    ports {
        external = 5000
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# module.py_app.docker_image.test:
resource "docker_image" "test" {
    id           = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0wat4er/inno_devops:python"
    image_id     = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    keep_locally = false
    latest       = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    name         = "wat4er/inno_devops:python"
}
```

```bash
terraform state list
module.py_app.docker_container.app
module.py_app.docker_image.test
```

### add dart module

```bash
terraform apply
module.py_app.docker_image.test: Refreshing state... [id=sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0wat4er/inno_devops:python]
module.py_app.docker_container.app: Refreshing state... [id=72960d41bfc4a5b6859cda601264de771440704571bfca9d002b5d3b5e2db8c3]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.dart_app.docker_container.app will be created
  + resource "docker_container" "app" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "web_dart"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = true
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false

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

      + ports {
          + external = 5050
          + internal = 5000
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # module.dart_app.docker_image.test will be created
  + resource "docker_image" "test" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "wat4er/inno_devops:dart"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.dart_app.docker_image.test: Creating...
module.dart_app.docker_image.test: Creation complete after 0s [id=sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dabwat4er/inno_devops:dart]
module.dart_app.docker_container.app: Creating...
module.dart_app.docker_container.app: Creation complete after 1s [id=4856fa3afc8cbe9e360e6ff55510b1e963c6be76953cf7ec4997cb08be036c70]
```

### change container name

```bash
terraform apply 
module.py_app.docker_image.test: Refreshing state... [id=sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0wat4er/inno_devops:python]
module.dart_app.docker_image.test: Refreshing state... [id=sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dabwat4er/inno_devops:dart]
module.py_app.docker_container.app: Refreshing state... [id=72960d41bfc4a5b6859cda601264de771440704571bfca9d002b5d3b5e2db8c3]
module.dart_app.docker_container.app: Refreshing state... [id=4856fa3afc8cbe9e360e6ff55510b1e963c6be76953cf7ec4997cb08be036c70]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.dart_app.docker_container.app must be replaced
-/+ resource "docker_container" "app" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python",
          - "-m",
          - "http.server",
          - "5000",
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
      ~ hostname                                    = "4856fa3afc8c" -> (known after apply)
      ~ id                                          = "4856fa3afc8cbe9e360e6ff55510b1e963c6be76953cf7ec4997cb08be036c70" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.3" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = "web_dart" -> "best_app_ever" # forces replacement
      ~ network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.3"
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
      - user                                        = "user" -> null
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

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.dart_app.docker_container.app: Destroying... [id=4856fa3afc8cbe9e360e6ff55510b1e963c6be76953cf7ec4997cb08be036c70]
module.dart_app.docker_container.app: Destruction complete after 0s
module.dart_app.docker_container.app: Creating...
module.dart_app.docker_container.app: Creation complete after 1s [id=1930ccc6589979b1aab7512ca95c9d2ff77891e55eb9f1bd105f7a34c93fba62]
```

## Cloud

### Init

```bash
# module.py_app.docker_container.app:
resource "docker_container" "app" {
    attach                                      = false
    command                                     = [
        "python",
        "-m",
        "app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    group_add                                   = []
    hostname                                    = "72960d41bfc4"
    id                                          = "72960d41bfc4a5b6859cda601264de771440704571bfca9d002b5d3b5e2db8c3"
    image                                       = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    init                                        = false
    ip_address                                  = "172.17.0.2"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    links                                       = []
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "web_py"
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
    rm                                          = true
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    storage_opts                                = {}
    sysctls                                     = {}
    tmpfs                                       = {}
    tty                                         = false
    user                                        = "user"
    working_dir                                 = "/app"

    ports {
        external = 5000
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# module.py_app.docker_image.test:
resource "docker_image" "test" {
    id           = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0wat4er/inno_devops:python"
    image_id     = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    keep_locally = false
    latest       = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    name         = "wat4er/inno_devops:python"
}



# module.cloud.data.yandex_compute_image.ubuntu-2204-lts:
data "yandex_compute_image" "ubuntu-2204-lts" {
    created_at    = "2022-09-26T10:45:51Z"
    description   = "ubuntu 22.04 lts"
    family        = "ubuntu-2204-lts"
    folder_id     = "standard-images"
    id            = "fd8autg36kchufhej85b"
    image_id      = "fd8autg36kchufhej85b"
    labels        = {}
    min_disk_size = 5
    name          = "ubuntu-22-04-lts-v20220926"
    os_type       = "linux"
    pooled        = true
    product_ids   = [
        "f2e454d6jm9tftcpj6g4",
    ]
    size          = 4
    status        = "ready"
}

# module.cloud.yandex_compute_instance.default:
resource "yandex_compute_instance" "default" {
    allow_stopping_for_update = true
    created_at                = "2022-09-27T01:50:47Z"
    folder_id                 = "b1gl4k75ncd12js9u8bd"
    fqdn                      = "asdf.ru-central1.internal"
    hostname                  = "asdf"
    id                        = "fhmbr2ibjac1nujtb9sj"
    metadata                  = {
        "serial-port-enable" = "1"
        "ssh-keys"           = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgIqWffIX4mJ8p362euQUDx2+FrRy7ephQSzTaBRwUFS4rbssnUVcn82ibeGfNEiOnOen9OW+igL4DrKkSPAoLgUwAhZuQ4jCRZnCSPMF+X4FwyR+yLXvuZBqxNJrsmirOpClOTlThJKRZO/++XpxiF/HW8zftMulBY3SB+TjsbpVbgPFag0tazdYNHvt/6Oo5VlyLArp5QGT1KdwqJ1s7Y+3v0J5Js088vivRg7+X1TbDXNEhqBSMR2eniUzX0L6RpULe3gAnz3fqsN8iG0eN363vhrWqpv9lymFNvPq6ky6KxzxvlpnDDgwlvgRjvOqQlTMmdr5jmyubftIoa5/D wat4er@macbook
        EOT
    }
    name                      = "asdf"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmbk8r2f4lcdletfcgl"
        disk_id     = "fhmbk8r2f4lcdletfcgl"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8autg36kchufhej85b"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "10.128.0.3"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:bd:8a:4b:9a"
        nat                = true
        nat_ip_address     = "51.250.79.227"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bnls074uig7404ed1s"
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

# module.cloud.yandex_vpc_address.addr:
resource "yandex_vpc_address" "addr" {
    created_at = "2022-09-27T01:33:11Z"
    folder_id  = "b1gl4k75ncd12js9u8bd"
    id         = "e9b5ec019hibf8mt1852"
    labels     = {}
    name       = "addr"
    reserved   = true
    used       = false

    external_ipv4_address {
        address = "51.250.79.227"
        zone_id = "ru-central1-a"
    }
}

# module.cloud.yandex_vpc_network.default:
resource "yandex_vpc_network" "default" {
    created_at = "2022-09-27T01:50:37Z"
    folder_id  = "b1gl4k75ncd12js9u8bd"
    id         = "enpqafb8sog8sl57h4g1"
    labels     = {}
    subnet_ids = []
}

# module.cloud.yandex_vpc_subnet.subnet:
resource "yandex_vpc_subnet" "subnet" {
    created_at     = "2022-09-27T01:50:38Z"
    folder_id      = "b1gl4k75ncd12js9u8bd"
    id             = "e9bnls074uig7404ed1s"
    labels         = {}
    network_id     = "enpqafb8sog8sl57h4g1"
    v4_cidr_blocks = [
        "10.128.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


# module.dart_app.docker_container.app:
resource "docker_container" "app" {
    attach                                      = false
    command                                     = [
        "python",
        "-m",
        "http.server",
        "5000",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    group_add                                   = []
    hostname                                    = "1930ccc65899"
    id                                          = "1930ccc6589979b1aab7512ca95c9d2ff77891e55eb9f1bd105f7a34c93fba62"
    image                                       = "sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dab"
    init                                        = false
    ip_address                                  = "172.17.0.3"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    links                                       = []
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "best_app_ever"
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
    restart                                     = "no"
    rm                                          = true
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    storage_opts                                = {}
    sysctls                                     = {}
    tmpfs                                       = {}
    tty                                         = false
    user                                        = "user"
    working_dir                                 = "/app"

    ports {
        external = 5050
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# module.dart_app.docker_image.test:
resource "docker_image" "test" {
    id           = "sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dabwat4er/inno_devops:dart"
    image_id     = "sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dab"
    keep_locally = false
    latest       = "sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dab"
    name         = "wat4er/inno_devops:dart"
    repo_digest  = "wat4er/inno_devops@sha256:cd412a017be441b24a05010214e240c93e274890f052ff57eb32ce9ebfbe4ee3"
}
```

```bash
terraform state list
module.cloud.data.yandex_compute_image.ubuntu-2204-lts
module.cloud.yandex_compute_instance.default
module.cloud.yandex_vpc_address.addr
module.cloud.yandex_vpc_network.default
module.cloud.yandex_vpc_subnet.subnet
module.dart_app.docker_container.app
module.dart_app.docker_image.test
module.py_app.docker_container.app
module.py_app.docker_image.test
```

### Change sth

```bash
terraform apply                          lab4 6 2 2 
module.py_app.docker_image.test: Refreshing state... [id=sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0wat4er/inno_devops:python]
module.dart_app.docker_image.test: Refreshing state... [id=sha256:5b8614f28ba41c94b505556e1f57049cb0e3faea545bcb220c2b8f93e6b32dabwat4er/inno_devops:dart]
module.dart_app.docker_container.app: Refreshing state... [id=1930ccc6589979b1aab7512ca95c9d2ff77891e55eb9f1bd105f7a34c93fba62]
module.py_app.docker_container.app: Refreshing state... [id=72960d41bfc4a5b6859cda601264de771440704571bfca9d002b5d3b5e2db8c3]
module.cloud.data.yandex_compute_image.ubuntu-2204-lts: Reading...
module.cloud.yandex_vpc_network.default: Refreshing state... [id=enpqafb8sog8sl57h4g1]
module.cloud.yandex_vpc_address.addr: Refreshing state... [id=e9b5ec019hibf8mt1852]
module.cloud.data.yandex_compute_image.ubuntu-2204-lts: Read complete after 1s [id=fd8autg36kchufhej85b]
module.cloud.yandex_vpc_subnet.subnet: Refreshing state... [id=e9bnls074uig7404ed1s]
module.cloud.yandex_compute_instance.default: Refreshing state... [id=fhmbr2ibjac1nujtb9sj]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.cloud.yandex_compute_instance.default must be replaced
-/+ resource "yandex_compute_instance" "default" {
      ~ created_at                = "2022-09-27T01:50:47Z" -> (known after apply)
      ~ folder_id                 = "b1gl4k75ncd12js9u8bd" -> (known after apply)
      ~ fqdn                      = "asdf.ru-central1.internal" -> (known after apply)
      ~ hostname                  = "asdf" -> "asdfffff" # forces replacement
      ~ id                        = "fhmbr2ibjac1nujtb9sj" -> (known after apply)
      - labels                    = {} -> null
      ~ name                      = "asdf" -> "asdfffff"
      + service_account_id        = (known after apply)
      ~ status                    = "running" -> (known after apply)
        # (5 unchanged attributes hidden)

      ~ boot_disk {
          ~ device_name = "fhmbk8r2f4lcdletfcgl" -> (known after apply)
          ~ disk_id     = "fhmbk8r2f4lcdletfcgl" -> (known after apply)
          ~ mode        = "READ_WRITE" -> (known after apply)
            # (1 unchanged attribute hidden)

          ~ initialize_params {
              ~ block_size  = 4096 -> (known after apply)
              + description = (known after apply)
              + name        = (known after apply)
              ~ size        = 5 -> (known after apply)
              + snapshot_id = (known after apply)
                # (2 unchanged attributes hidden)
            }
        }

      ~ network_interface {
          ~ index              = 0 -> (known after apply)
          ~ ip_address         = "10.128.0.3" -> (known after apply)
          ~ ipv6               = false -> (known after apply)
          + ipv6_address       = (known after apply)
          ~ mac_address        = "d0:0d:bd:8a:4b:9a" -> (known after apply)
          ~ nat_ip_version     = "IPV4" -> (known after apply)
          ~ security_group_ids = [] -> (known after apply)
            # (4 unchanged attributes hidden)
        }

      ~ placement_policy {
          ~ host_affinity_rules = [] -> (known after apply)
          + placement_group_id  = (known after apply)
        }

      ~ resources {
          - gpus          = 0 -> null
            # (3 unchanged attributes hidden)
        }

      ~ scheduling_policy {
          ~ preemptible = false -> (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.cloud.yandex_compute_instance.default: Destroying... [id=fhmbr2ibjac1nujtb9sj]
module.cloud.yandex_compute_instance.default: Still destroying... [id=fhmbr2ibjac1nujtb9sj, 10s elapsed]
module.cloud.yandex_compute_instance.default: Still destroying... [id=fhmbr2ibjac1nujtb9sj, 20s elapsed]
module.cloud.yandex_compute_instance.default: Destruction complete after 25s
module.cloud.yandex_compute_instance.default: Creating...
module.cloud.yandex_compute_instance.default: Still creating... [10s elapsed]
module.cloud.yandex_compute_instance.default: Still creating... [20s elapsed]
module.cloud.yandex_compute_instance.default: Creation complete after 28s [id=fhmns7osoj3r9llg535j]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

## GITHUB

## Best practices

- Use terraform modules
- Use variables and outputs
- Use terraform validate and fmt
- Use `terraform validate` and `terraform plan` before applying the changes