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
