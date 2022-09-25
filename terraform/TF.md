# Terraform

## Docker Tutorial

### Initial state

- `terraform show`

  - ```hcl
    # module.docker_app_python.docker_container.app_python:
    resource "docker_container" "app_python" {
        attach                                      = false
        command                                     = []
        container_read_refresh_timeout_milliseconds = 15000
        cpu_shares                                  = 0
        entrypoint                                  = [
            "gunicorn",
            "-k",
            "uvicorn.workers.UvicornWorker",
            "-w",
            "4",
            "--bind",
            "0.0.0.0:8080",
            "app:app",
        ]
        env                                         = []
        gateway                                     = "172.17.0.1"
        hostname                                    = "3672233ec594"
        id                                          = "3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb"
        image                                       = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
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
        name                                        = "app_python"
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
            external = 8080
            internal = 8080
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }

    # module.docker_app_python.docker_image.test_image:
    resource "docker_image" "test_image" {
        id           = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python"
        image_id     = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
        keep_locally = false
        latest       = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
        name         = "chermnyx/inno-devops-python"
        repo_digest  = "chermnyx/inno-devops-python@sha256:5ebf03fdcf4de12193582110e4a7e4d551b4ef8656b385f5cffee02acc7eb217"
    }
    ```

- `terraform state list`

  - ```hcl
    module.docker_app_python.docker_container.app_python
    module.docker_app_python.docker_image.test_image
    ```

### Changing the state

Let's add a rust container and change the python container's name.

- After adding rust container

  - `terraform apply`

    - ```hcl
      module.docker_app_python.docker_image.test_image: Refreshing state... [id=sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python]
      module.docker_app_rust.docker_image.test_image: Refreshing state... [id=sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3chermnyx/inno-devops-rust]
      module.docker_app_rust.docker_container.app_python: Refreshing state... [id=6c6a7a97b8039e7f911adb4b6b83d5fd8f7cbbe46ff1f0e63761d06dfe992d4f]
      module.docker_app_python.docker_container.app_python: Refreshing state... [id=3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb]

      Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
        + create

      Terraform will perform the following actions:

        # module.docker_app_rust.docker_container.app_python will be created
        + resource "docker_container" "app_python" {
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
            + image                                       = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
            + init                                        = (known after apply)
            + ip_address                                  = (known after apply)
            + ip_prefix_length                            = (known after apply)
            + ipc_mode                                    = (known after apply)
            + log_driver                                  = (known after apply)
            + logs                                        = false
            + must_run                                    = true
            + name                                        = "app_rust"
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
                + external = 8081
                + internal = 8080
                + ip       = "0.0.0.0"
                + protocol = "tcp"
              }
          }

      Plan: 1 to add, 0 to change, 0 to destroy.

      Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value: yes

      module.docker_app_rust.docker_container.app_python: Creating...
      module.docker_app_rust.docker_container.app_python: Creation complete after 0s [id=0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5]

      Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
      ```

  - `terraform show`

    - ```hcl
      # module.docker_app_python.docker_container.app_python:
      resource "docker_container" "app_python" {
          attach                                      = false
          command                                     = []
          container_read_refresh_timeout_milliseconds = 15000
          cpu_shares                                  = 0
          dns                                         = []
          dns_opts                                    = []
          dns_search                                  = []
          entrypoint                                  = [
              "gunicorn",
              "-k",
              "uvicorn.workers.UvicornWorker",
              "-w",
              "4",
              "--bind",
              "0.0.0.0:8080",
              "app:app",
          ]
          env                                         = []
          gateway                                     = "172.17.0.1"
          group_add                                   = []
          hostname                                    = "3672233ec594"
          id                                          = "3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb"
          image                                       = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
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
          name                                        = "app_python"
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
              external = 8080
              internal = 8080
              ip       = "0.0.0.0"
              protocol = "tcp"
          }
      }

      # module.docker_app_python.docker_image.test_image:
      resource "docker_image" "test_image" {
          id           = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python"
          image_id     = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
          keep_locally = false
          latest       = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
          name         = "chermnyx/inno-devops-python"
          repo_digest  = "chermnyx/inno-devops-python@sha256:5ebf03fdcf4de12193582110e4a7e4d551b4ef8656b385f5cffee02acc7eb217"
      }


      # module.docker_app_rust.docker_container.app_python:
      resource "docker_container" "app_python" {
          attach                                      = false
          command                                     = []
          container_read_refresh_timeout_milliseconds = 15000
          cpu_shares                                  = 0
          entrypoint                                  = [
              "/app_rust",
          ]
          env                                         = []
          gateway                                     = "172.17.0.1"
          hostname                                    = "0ce50d451ba4"
          id                                          = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
          image                                       = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
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
          name                                        = "app_rust"
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
          tty                                         = false
          user                                        = "user"

          ports {
              external = 8081
              internal = 8080
              ip       = "0.0.0.0"
              protocol = "tcp"
          }
      }

      # module.docker_app_rust.docker_image.test_image:
      resource "docker_image" "test_image" {
          id           = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3chermnyx/inno-devops-rust"
          image_id     = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
          keep_locally = false
          latest       = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
          name         = "chermnyx/inno-devops-rust"
          repo_digest  = "chermnyx/inno-devops-rust@sha256:196d4d86f5011410240524e1dab7cbf7397730a58c572b197e3d9f37dee55369"
      }

      ```

  - `terraform state list`

    - ```hcl
      module.docker_app_python.docker_container.app_python
      module.docker_app_python.docker_image.test_image
      module.docker_app_rust.docker_container.app_python
      module.docker_app_rust.docker_image.test_image
      ```

- After changing python container name from `app_python` to `app_python-1`

  - `terraform apply`

    - ```hcl
      module.docker_app_python.docker_image.test_image: Refreshing state... [id=sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python]
      module.docker_app_rust.docker_image.test_image: Refreshing state... [id=sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3chermnyx/inno-devops-rust]
      module.docker_app_python.docker_container.app_python: Refreshing state... [id=3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb]
      module.docker_app_rust.docker_container.app_python: Refreshing state... [id=0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5]

      Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      -/+ destroy and then create replacement

      Terraform will perform the following actions:

        # module.docker_app_python.docker_container.app_python must be replaced
      -/+ resource "docker_container" "app_python" {
            + bridge                                      = (known after apply)
            ~ command                                     = [] -> (known after apply)
            + container_logs                              = (known after apply)
            - cpu_shares                                  = 0 -> null
            - dns                                         = [] -> null
            - dns_opts                                    = [] -> null
            - dns_search                                  = [] -> null
            ~ entrypoint                                  = [
                - "gunicorn",
                - "-k",
                - "uvicorn.workers.UvicornWorker",
                - "-w",
                - "4",
                - "--bind",
                - "0.0.0.0:8080",
                - "app:app",
              ] -> (known after apply)
            ~ env                                         = [] -> (known after apply)
            + exit_code                                   = (known after apply)
            ~ gateway                                     = "172.17.0.1" -> (known after apply)
            - group_add                                   = [] -> null
            ~ hostname                                    = "3672233ec594" -> (known after apply)
            ~ id                                          = "3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb" -> (known after apply)
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
            ~ name                                        = "app_python" -> "app_python-1" # forces replacement
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

      Changes to Outputs:
        ~ python_container_id = "3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb" -> (known after apply)

      Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value: yes

      module.docker_app_python.docker_container.app_python: Destroying... [id=3672233ec594419cc15236a539c26a150ec79280d5fbdad25c2ec9f78623f2fb]
      module.docker_app_python.docker_container.app_python: Destruction complete after 1s
      module.docker_app_python.docker_container.app_python: Creating...
      module.docker_app_python.docker_container.app_python: Creation complete after 0s [id=29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920]

      Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

      Outputs:

      python_container_id = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
      rust_container_id = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
      ```

- `terraform output`

  - ```hcl
    python_container_id = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
    rust_container_id = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
    ```

## Cloud

### Initial state

- `terraform show`

  - ```hcl
    # module.cloud.data.yandex_compute_image.ubuntu-2204-lts:
    data "yandex_compute_image" "ubuntu-2204-lts" {
        created_at    = "2022-09-05T10:45:49Z"
        description   = "ubuntu 22.04 lts"
        family        = "ubuntu-2204-lts"
        folder_id     = "standard-images"
        id            = "fd8c00efhiopj3rlnlbn"
        image_id      = "fd8c00efhiopj3rlnlbn"
        labels        = {}
        min_disk_size = 5
        name          = "ubuntu-22-04-lts-v20220905"
        os_type       = "linux"
        pooled        = true
        product_ids   = [
            "f2e0aim2l3cg4p6d9ce6",
        ]
        size          = 4
        status        = "ready"
    }

    # module.cloud.yandex_compute_instance.default:
    resource "yandex_compute_instance" "default" {
        created_at                = "2022-09-25T17:26:10Z"
        folder_id                 = "b1g9u83spqp1gnm5vo93"
        fqdn                      = "test1.ru-central1.internal"
        hostname                  = "test1"
        id                        = "fhm3gpj0vsl31k460dnn"
        metadata                  = {
            "serial-port-enable" = "1"
            "ssh-keys"           = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3tK2eoNvXTfgg/2yBiJ4eQqg+5Tt2In612l/KtOzPk chermnyx@laptop
            EOT
        }
        name                      = "test"
        network_acceleration_type = "standard"
        platform_id               = "standard-v1"
        status                    = "running"
        zone                      = "ru-central1-a"

        boot_disk {
            auto_delete = true
            device_name = "fhmg5juopujpsr8f9dg2"
            disk_id     = "fhmg5juopujpsr8f9dg2"
            mode        = "READ_WRITE"

            initialize_params {
                block_size = 4096
                image_id   = "fd8c00efhiopj3rlnlbn"
                size       = 5
                type       = "network-hdd"
            }
        }

        network_interface {
            index              = 0
            ip_address         = "10.228.0.20"
            ipv4               = true
            ipv6               = false
            mac_address        = "d0:0d:38:66:60:ff"
            nat                = true
            nat_ip_address     = "51.250.68.89"
            nat_ip_version     = "IPV4"
            security_group_ids = []
            subnet_id          = "e9b8geapcje1av24gvo2"
        }

        placement_policy {
            host_affinity_rules = []
        }

        resources {
            core_fraction = 20
            cores         = 2
            gpus          = 0
            memory        = 4
        }

        scheduling_policy {
            preemptible = false
        }
    }

    # module.cloud.yandex_vpc_address.vm1_addr:
    resource "yandex_vpc_address" "vm1_addr" {
        created_at = "2022-09-25T17:25:45Z"
        folder_id  = "b1g9u83spqp1gnm5vo93"
        id         = "e9bg7pbjmqa0e6kj7125"
        labels     = {}
        name       = "vm1_addr"
        reserved   = true
        used       = false

        external_ipv4_address {
            address = "51.250.68.89"
            zone_id = "ru-central1-a"
        }
    }

    # module.cloud.yandex_vpc_network.foo:
    resource "yandex_vpc_network" "foo" {
        created_at = "2022-09-25T17:25:45Z"
        folder_id  = "b1g9u83spqp1gnm5vo93"
        id         = "enpbbstj31vt4frgefb0"
        labels     = {}
        subnet_ids = [
            "e9b8geapcje1av24gvo2",
        ]
    }

    # module.cloud.yandex_vpc_subnet.foo:
    resource "yandex_vpc_subnet" "foo" {
        created_at     = "2022-09-25T17:25:47Z"
        folder_id      = "b1g9u83spqp1gnm5vo93"
        id             = "e9b8geapcje1av24gvo2"
        labels         = {}
        network_id     = "enpbbstj31vt4frgefb0"
        v4_cidr_blocks = [
            "10.228.0.0/24",
        ]
        v6_cidr_blocks = []
        zone           = "ru-central1-a"
    }


    # module.docker_app_python.docker_container.app_python:
    resource "docker_container" "app_python" {
        attach                                      = false
        command                                     = []
        container_read_refresh_timeout_milliseconds = 15000
        cpu_shares                                  = 0
        dns                                         = []
        dns_opts                                    = []
        dns_search                                  = []
        entrypoint                                  = [
            "gunicorn",
            "-k",
            "uvicorn.workers.UvicornWorker",
            "-w",
            "4",
            "--bind",
            "0.0.0.0:8080",
            "app:app",
        ]
        env                                         = []
        gateway                                     = "172.17.0.1"
        group_add                                   = []
        hostname                                    = "29707318cf8b"
        id                                          = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
        image                                       = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
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
        name                                        = "app_python-1"
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
            external = 8080
            internal = 8080
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }

    # module.docker_app_python.docker_image.test_image:
    resource "docker_image" "test_image" {
        id           = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python"
        image_id     = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
        keep_locally = false
        latest       = "sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434de"
        name         = "chermnyx/inno-devops-python"
        repo_digest  = "chermnyx/inno-devops-python@sha256:5ebf03fdcf4de12193582110e4a7e4d551b4ef8656b385f5cffee02acc7eb217"
    }


    # module.docker_app_rust.docker_container.app_python:
    resource "docker_container" "app_python" {
        attach                                      = false
        command                                     = []
        container_read_refresh_timeout_milliseconds = 15000
        cpu_shares                                  = 0
        dns                                         = []
        dns_opts                                    = []
        dns_search                                  = []
        entrypoint                                  = [
            "/app_rust",
        ]
        env                                         = []
        gateway                                     = "172.17.0.1"
        group_add                                   = []
        hostname                                    = "0ce50d451ba4"
        id                                          = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
        image                                       = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
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
        name                                        = "app_rust"
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

        ports {
            external = 8081
            internal = 8080
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }

    # module.docker_app_rust.docker_image.test_image:
    resource "docker_image" "test_image" {
        id           = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3chermnyx/inno-devops-rust"
        image_id     = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
        keep_locally = false
        latest       = "sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3"
        name         = "chermnyx/inno-devops-rust"
        repo_digest  = "chermnyx/inno-devops-rust@sha256:196d4d86f5011410240524e1dab7cbf7397730a58c572b197e3d9f37dee55369"
    }


    Outputs:

    python_container_id = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
    rust_container_id = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
    vm_instance_external_ip = "51.250.68.89"

    ```

- `terraform state list`

  - ```hcl
    ```

### Changing the state

Let's change vCPU share for the vm

- After changing vCPU share

  - `terraform apply`

    - ```hcl
      module.docker_app_python.docker_image.test_image: Refreshing state... [id=sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python]
      module.docker_app_rust.docker_image.test_image: Refreshing state... [id=sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3chermnyx/inno-devops-rust]
      module.docker_app_rust.docker_container.app_python: Refreshing state... [id=0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5]
      module.docker_app_python.docker_container.app_python: Refreshing state... [id=29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920]
      module.cloud.data.yandex_compute_image.ubuntu-2204-lts: Reading...
      module.cloud.yandex_vpc_network.foo: Refreshing state... [id=enpbbstj31vt4frgefb0]
      module.cloud.yandex_vpc_address.vm1_addr: Refreshing state... [id=e9bg7pbjmqa0e6kj7125]
      module.cloud.data.yandex_compute_image.ubuntu-2204-lts: Read complete after 1s [id=fd8c00efhiopj3rlnlbn]
      module.cloud.yandex_vpc_subnet.foo: Refreshing state... [id=e9b8geapcje1av24gvo2]
      module.cloud.yandex_compute_instance.default: Refreshing state... [id=fhm3gpj0vsl31k460dnn]

      Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
        ~ update in-place

      Terraform will perform the following actions:

        # module.cloud.yandex_compute_instance.default will be updated in-place
        ~ resource "yandex_compute_instance" "default" {
            + allow_stopping_for_update = true
              id                        = "fhm3gpj0vsl31k460dnn"
              name                      = "test"
              # (10 unchanged attributes hidden)

            ~ resources {
                ~ core_fraction = 20 -> 100
                  # (3 unchanged attributes hidden)
              }

              # (4 unchanged blocks hidden)
          }

      Plan: 0 to add, 1 to change, 0 to destroy.

      Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value: yes

      module.cloud.yandex_compute_instance.default: Modifying... [id=fhm3gpj0vsl31k460dnn]
      module.cloud.yandex_compute_instance.default: Still modifying... [id=fhm3gpj0vsl31k460dnn, 10s elapsed]
      module.cloud.yandex_compute_instance.default: Still modifying... [id=fhm3gpj0vsl31k460dnn, 20s elapsed]
      module.cloud.yandex_compute_instance.default: Modifications complete after 21s [id=fhm3gpj0vsl31k460dnn]

      Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

      Outputs:

      python_container_id = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
      rust_container_id = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
      vm_instance_external_ip = "51.250.68.89"
      ```

  - `terraform state list`

    - ```hcl
      module.cloud.data.yandex_compute_image.ubuntu-2204-lts
      module.cloud.yandex_compute_instance.default
      module.cloud.yandex_vpc_address.vm1_addr
      module.cloud.yandex_vpc_network.foo
      module.cloud.yandex_vpc_subnet.foo
      module.docker_app_python.docker_container.app_python
      module.docker_app_python.docker_image.test_image
      module.docker_app_rust.docker_container.app_python
      module.docker_app_rust.docker_image.test_image
      ```

- After changing vm name

  - `terraform apply`

    - ```hcl
      module.docker_app_rust.docker_image.test_image: Refreshing state... [id=sha256:107882b09da8994a0e6ca03430558d6b5f2a256cad0c72b3a30a5333e99b70f3chermnyx/inno-devops-rust]
      module.docker_app_python.docker_image.test_image: Refreshing state... [id=sha256:b4f85e3f4d5728d6c0899a8bf331f9bdbeda83426bd437b91babff8a981434dechermnyx/inno-devops-python]
      module.docker_app_rust.docker_container.app_python: Refreshing state... [id=0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5]
      module.docker_app_python.docker_container.app_python: Refreshing state... [id=29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920]
      module.cloud.data.yandex_compute_image.ubuntu-2204-lts: Reading...
      module.cloud.yandex_vpc_address.vm1_addr: Refreshing state... [id=e9bg7pbjmqa0e6kj7125]
      module.cloud.yandex_vpc_network.foo: Refreshing state... [id=enpbbstj31vt4frgefb0]
      module.cloud.data.yandex_compute_image.ubuntu-2204-lts: Read complete after 1s [id=fd8c00efhiopj3rlnlbn]
      module.cloud.yandex_vpc_subnet.foo: Refreshing state... [id=e9b8geapcje1av24gvo2]
      module.cloud.yandex_compute_instance.default: Refreshing state... [id=fhm3gpj0vsl31k460dnn]

      Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
        ~ update in-place

      Terraform will perform the following actions:

        # module.cloud.yandex_compute_instance.default will be updated in-place
        ~ resource "yandex_compute_instance" "default" {
              id                        = "fhm3gpj0vsl31k460dnn"
            ~ name                      = "test" -> "test1"
              # (11 unchanged attributes hidden)

              # (5 unchanged blocks hidden)
          }

      Plan: 0 to add, 1 to change, 0 to destroy.

      Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value: yes

      module.cloud.yandex_compute_instance.default: Modifying... [id=fhm3gpj0vsl31k460dnn]
      module.cloud.yandex_compute_instance.default: Modifications complete after 6s [id=fhm3gpj0vsl31k460dnn]

      Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

      Outputs:

      python_container_id = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
      rust_container_id = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
      vm_instance_external_ip = "51.250.68.89"
      ```

- `terraform output`

  - ```hcl
    python_container_id = "29707318cf8bc3bad4dea0652217ac99b95797ad2c9c76a08ed4e7fbe222e920"
    rust_container_id = "0ce50d451ba4c5e9b0b74fe5f0a36aa66cbfaba3cf97e5209edd9302fd05cab5"
    vm_instance_external_ip = "51.250.68.89"
    ```

## Best practices

- Use terraform modules
- Provide outputs
- Use `terraform fmt`
- Use dependency lock file
- Do not hardcode sensitive data (secrets)
- Use variables and outputs
- Use `terraform validate` and `terraform plan` before applying the changes
- Do not upload the state to the repo as code unless it's required by the task ( ͡° ͜ʖ ͡°)
