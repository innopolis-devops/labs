[200~# Terraform

## Docker

 * ```terraform show```:
    ```hcl
    # docker_container.app_python:
    resource "docker_container" "app_python" {
        attach            = false
        command           = [
            "uvicorn",
            "main:app",
            "--host",
            "0.0.0.0",
            "--port",
            "8000",
        ]
        cpu_shares        = 0
        entrypoint        = []
        env               = []
        gateway           = "172.17.0.1"
        hostname          = "e26aa7670815"
        id                = "e26aa76708157b13bce7f1a91178f062ceab45294c6a1addb2427f7f6007ad3e"
        image             = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892"
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
        name              = "moscow_app_inno_devops"
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
        user              = "appuser"
        working_dir       = "/home/appuser"

        ports {
            external = 8000
            internal = 8000
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }

    # docker_image.moscow_app:
    resource "docker_image" "moscow_app" {
        id           = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest"
        keep_locally = false
        latest       = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892"
        name         = "boggda1337/moscow_app:latest"
        repo_digest  = "boggda1337/moscow_app@sha256:0a58b060fd5829e8b2db0e295af1ba221d4cbb1270a654ba25ffd70b6aa56751"
    }


    Outputs:

    container_id = "e26aa76708157b13bce7f1a91178f062ceab45294c6a1addb2427f7f6007ad3e"
    image_id = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest"
    ```

 * ```terraform state list```:
    ```hcl
    docker_container.app_python
    docker_image.moscow_app
    ```
After changing state:
 * ```terraform apply```:
    ```hcl
    docker_image.moscow_app: Refreshing state... [id=sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest]
    docker_container.app_python: Refreshing state... [id=e26aa76708157b13bce7f1a91178f062ceab45294c6a1addb2427f7f6007ad3e]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
    the following symbols:
    -/+ destroy and then create replacement

    Terraform will perform the following actions:

      # docker_container.app_python must be replaced
    -/+ resource "docker_container" "app_python" {
          + bridge            = (known after apply)
          ~ command           = [
              - "uvicorn",
              - "main:app",
              - "--host",
              - "0.0.0.0",
              - "--port",
              - "8000",
            ] -> (known after apply)
          + container_logs    = (known after apply)
          - cpu_shares        = 0 -> null
          - dns               = [] -> null
          - dns_opts          = [] -> null
          - dns_search        = [] -> null
          ~ entrypoint        = [] -> (known after apply)
          ~ env               = [] -> (known after apply)
          + exit_code         = (known after apply)
          ~ gateway           = "172.17.0.1" -> (known after apply)
          - group_add         = [] -> null
          ~ hostname          = "e26aa7670815" -> (known after apply)
          ~ id                = "e26aa76708157b13bce7f1a91178f062ceab45294c6a1addb2427f7f6007ad3e" -> (known after apply)
          ~ init              = false -> (known after apply)
          ~ ip_address        = "172.17.0.2" -> (known after apply)
          ~ ip_prefix_length  = 16 -> (known after apply)
          ~ ipc_mode          = "private" -> (known after apply)
          - links             = [] -> null
          - log_opts          = {} -> null
          - max_retry_count   = 0 -> null
          - memory            = 0 -> null
          - memory_swap       = 0 -> null
            name              = "moscow_app_inno_devops"
          ~ network_data      = [
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
          - network_mode      = "default" -> null
          - privileged        = false -> null
          - publish_all_ports = false -> null
          ~ security_opts     = [] -> (known after apply)
          ~ shm_size          = 64 -> (known after apply)
          - sysctls           = {} -> null
          - tmpfs             = {} -> null
          - user              = "appuser" -> null
          - working_dir       = "/home/appuser" -> null
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

    Changes to Outputs:
      ~ container_id = "e26aa76708157b13bce7f1a91178f062ceab45294c6a1addb2427f7f6007ad3e" -> (known after apply)
    ╷
    │ Warning: Deprecated attribute
    │ 
    │   on main.tf line 18, in resource "docker_container" "app_python":
    │   18:   image = docker_image.moscow_app.latest
    │ 
    │ The attribute "latest" is deprecated. Refer to the provider documentation for details.
    │ 
    │ (and one more similar warning elsewhere)
    ╵

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    docker_container.app_python: Destroying... [id=e26aa76708157b13bce7f1a91178f062ceab45294c6a1addb2427f7f6007ad3e]
    docker_container.app_python: Destruction complete after 0s
    docker_container.app_python: Creating...
    docker_container.app_python: Creation complete after 1s [id=2f44179e69f3b87aaf3d9cd65691005fc1912bed86fa86fb49c08e5a60a1ea98]
    ╷
    │ Warning: Deprecated attribute
    │ 
    │   on main.tf line 18, in resource "docker_container" "app_python":
    │   18:   image = docker_image.moscow_app.latest
    │ 
    │ The attribute "latest" is deprecated. Refer to the provider documentation for details.
    │ 
    │ (and one more similar warning elsewhere)
    ╵

    Apply complete! Resources: 1 added, 0 changed, 1 destroyed.                                                          

    Outputs:                                                                                                             

    container_id = "2f44179e69f3b87aaf3d9cd65691005fc1912bed86fa86fb49c08e5a60a1ea98"                                    
    image_id = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest"                           
    ```
Change container name:
 * ```terraform apply -var "container_name=app_python_test"```:
    ```hcl
    docker_image.moscow_app: Refreshing state... [id=sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest]
    docker_container.app_python: Refreshing state... [id=2f44179e69f3b87aaf3d9cd65691005fc1912bed86fa86fb49c08e5a60a1ea98]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
    the following symbols:
    -/+ destroy and then create replacement

    Terraform will perform the following actions:

      # docker_container.app_python must be replaced
    -/+ resource "docker_container" "app_python" {
          + bridge            = (known after apply)
          ~ command           = [
              - "uvicorn",
              - "main:app",
              - "--host",
              - "0.0.0.0",
              - "--port",
              - "8000",
            ] -> (known after apply)
          + container_logs    = (known after apply)
          - cpu_shares        = 0 -> null
          - dns               = [] -> null
          - dns_opts          = [] -> null
          - dns_search        = [] -> null
          ~ entrypoint        = [] -> (known after apply)
          ~ env               = [] -> (known after apply)
          + exit_code         = (known after apply)
          ~ gateway           = "172.17.0.1" -> (known after apply)
          - group_add         = [] -> null
          ~ hostname          = "2f44179e69f3" -> (known after apply)
          ~ id                = "2f44179e69f3b87aaf3d9cd65691005fc1912bed86fa86fb49c08e5a60a1ea98" -> (known after apply)
          ~ init              = false -> (known after apply)
          ~ ip_address        = "172.17.0.2" -> (known after apply)
          ~ ip_prefix_length  = 16 -> (known after apply)
          ~ ipc_mode          = "private" -> (known after apply)
          - links             = [] -> null
          - log_opts          = {} -> null
          - max_retry_count   = 0 -> null
          - memory            = 0 -> null
          - memory_swap       = 0 -> null
          ~ name              = "moscow_app_inno_devops" -> "app_python_test" # forces replacement
          ~ network_data      = [
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
          - network_mode      = "default" -> null
          - privileged        = false -> null
          - publish_all_ports = false -> null
          ~ security_opts     = [] -> (known after apply)
          ~ shm_size          = 64 -> (known after apply)
          - sysctls           = {} -> null
          - tmpfs             = {} -> null
          - user              = "appuser" -> null
          - working_dir       = "/home/appuser" -> null
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
      ~ container_id = "2f44179e69f3b87aaf3d9cd65691005fc1912bed86fa86fb49c08e5a60a1ea98" -> (known after apply)
    ╷
    │ Warning: Deprecated attribute
    │ 
    │   on main.tf line 18, in resource "docker_container" "app_python":
    │   18:   image = docker_image.moscow_app.latest
    │ 
    │ The attribute "latest" is deprecated. Refer to the provider documentation for details.
    │ 
    │ (and one more similar warning elsewhere)
    ╵

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    docker_container.app_python: Destroying... [id=2f44179e69f3b87aaf3d9cd65691005fc1912bed86fa86fb49c08e5a60a1ea98]
    docker_container.app_python: Destruction complete after 0s
    docker_container.app_python: Creating...
    docker_container.app_python: Creation complete after 1s [id=28b9b8ff8521670aa8413e9a625cf06f71b2d83e28b78e52680d167f43c0e71a]
    ╷
    │ Warning: Deprecated attribute
    │ 
    │   on main.tf line 18, in resource "docker_container" "app_python":
    │   18:   image = docker_image.moscow_app.latest
    │ 
    │ The attribute "latest" is deprecated. Refer to the provider documentation for details.
    │ 
    │ (and one more similar warning elsewhere)
    ╵

    Apply complete! Resources: 1 added, 0 changed, 1 destroyed.                                                          

    Outputs:                                                                                                             

    container_id = "28b9b8ff8521670aa8413e9a625cf06f71b2d83e28b78e52680d167f43c0e71a"                                    
    image_id = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest"
    ```
 * ```terraform output```:
    ```hcl
    container_id = "28b9b8ff8521670aa8413e9a625cf06f71b2d83e28b78e52680d167f43c0e71a"
    image_id = "sha256:e99bb7216bac021bf91799358fd6c036d4593d16f32af05f487615241da8e892boggda1337/moscow_app:latest"
    ```

