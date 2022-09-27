# Terraform

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

## Cloud

 * ```terraform show```:
    ```hcl
        # yandex_compute_instance.vm-1:
    resource "yandex_compute_instance" "vm-1" {
        created_at                = "2022-09-27T01:57:34Z"
        folder_id                 = "b1g8pd7ir054eeq7eslq"
        fqdn                      = "fhmd9gp1u2l7rvd8ctei.auto.internal"
        id                        = "fhmd9gp1u2l7rvd8ctei"
        metadata                  = {
            "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCJ9VUeLw0IHeSitfXgrpL0GbHiC2/TitQr9jolDwZaSE8blPXZV0bF2j/Xfi6oNKaCESdjNQjz3sh3bO0k0N/POF73ufAl0WV7S2CKs05h1oZrXgTN/8meUyxkDLf1Bg3BMAMOUBfEaRilhpYpK7jcWBKS6PSm/IPG1nv/K1iHzFCn6e8aXvAEJ6UFwu8L1dRq2juBcqwIlr0qSXnTUbrLvhznK88I44tFyfuHUUm0s6tZQznTeuN67tv6/Bwbq0k5DwVfI/7by5COW6Rq62G7aQuRWuEUveVB7V5+RBurOqBg8wKwHc8xZUTRZ1CczC9+6fXELdgxJrYH+ggr2WAhiK6Ao+bgiZqNuZU7q7Q8o8Y7DaH6eJOokN+zcONdJWEptir8ocgO1PJPGvcWJqL0ZlvEURxwxGYFn+WkL46oDFj69lKYf7xM0hjbLhfTOGWDZ8fIWJdkQtHoexmuzkB07mfhDurUoMMdyYBMsnWy+yyOGDyG7WWeHLwhif3vlBs= kali@kali
            EOT
        }
        name                      = "vm-innodevops"
        network_acceleration_type = "standard"
        platform_id               = "standard-v1"
        status                    = "running"
        zone                      = "ru-central1-a"

        boot_disk {
            auto_delete = true
            device_name = "fhm2f8idr0efq6kn8083"
            disk_id     = "fhm2f8idr0efq6kn8083"
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
            ip_address         = "10.13.37.3"
            ipv4               = true
            ipv6               = false
            mac_address        = "d0:0d:d4:c3:21:f0"
            nat                = true
            nat_ip_address     = "51.250.79.146"
            nat_ip_version     = "IPV4"
            security_group_ids = []
            subnet_id          = "e9bgdqvhvc4d3lc8snlo"
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
        created_at = "2022-09-27T01:56:02Z"
        folder_id  = "b1g8pd7ir054eeq7eslq"
        id         = "enpjdpju6nivk2s4i1f7"
        labels     = {}
        name       = "network-1"
        subnet_ids = [
            "e9bgdqvhvc4d3lc8snlo",
        ]
    }

    # yandex_vpc_subnet.subnet-1:
    resource "yandex_vpc_subnet" "subnet-1" {
        created_at     = "2022-09-27T01:56:04Z"
        folder_id      = "b1g8pd7ir054eeq7eslq"
        id             = "e9bgdqvhvc4d3lc8snlo"
        labels         = {}
        name           = "subnet-1"
        network_id     = "enpjdpju6nivk2s4i1f7"
        v4_cidr_blocks = [
            "10.13.37.0/24",
        ]
        v6_cidr_blocks = []
        zone           = "ru-central1-a"
    }


    Outputs:

    external_ip_address_vm_1 = "51.250.79.146"
    internal_ip_address_vm_1 = "10.13.37.3"
    ```
 * ```terraform state list```:
    ```hcl
    yandex_compute_instance.vm-1
    yandex_vpc_network.network-1
    yandex_vpc_subnet.subnet-1
    ```
After changing state:
 * ```terraform apply```:
    ```hcl
    yandex_vpc_network.network-1: Refreshing state... [id=enpjdpju6nivk2s4i1f7]
    yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9bgdqvhvc4d3lc8snlo]
    yandex_compute_instance.vm-1: Refreshing state... [id=fhmd9gp1u2l7rvd8ctei]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
    the following symbols:
      ~ update in-place

    Terraform will perform the following actions:

      # yandex_compute_instance.vm-1 will be updated in-place
      ~ resource "yandex_compute_instance" "vm-1" {
            id                        = "fhmd9gp1u2l7rvd8ctei"
            name                      = "vm-innodevops"
            # (10 unchanged attributes hidden)

          ~ resources {
              ~ cores         = 2 -> 4
              ~ memory        = 2 -> 4
                # (2 unchanged attributes hidden)
            }

            # (4 unchanged blocks hidden)
        }

    Plan: 0 to add, 1 to change, 0 to destroy.

    Changes to Outputs:
      ~ external_ip_address_vm_1 = "51.250.83.187" -> "51.250.71.217"

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    yandex_compute_instance.vm-1: Modifying... [id=fhmd9gp1u2l7rvd8ctei]
    yandex_compute_instance.vm-1: Still modifying... [id=fhmd9gp1u2l7rvd8ctei, 10s elapsed]
    yandex_compute_instance.vm-1: Still modifying... [id=fhmd9gp1u2l7rvd8ctei, 20s elapsed]
    yandex_compute_instance.vm-1: Still modifying... [id=fhmd9gp1u2l7rvd8ctei, 30s elapsed]
    yandex_compute_instance.vm-1: Modifications complete after 40s [id=fhmd9gp1u2l7rvd8ctei]

    Apply complete! Resources: 0 added, 1 changed, 0 destroyed.                                                          

    Outputs:                                                                                                             

    external_ip_address_vm_1 = "51.250.71.217"                                                                           
    internal_ip_address_vm_1 = "10.13.37.3"
    ```
Change vm name:
 * ```terraform apply -var "container_name=app_python_test"```:
    ```hcl
    yandex_vpc_network.network-1: Refreshing state... [id=enpjdpju6nivk2s4i1f7]
    yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9bgdqvhvc4d3lc8snlo]
    yandex_compute_instance.vm-1: Refreshing state... [id=fhmd9gp1u2l7rvd8ctei]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
    the following symbols:
      ~ update in-place

    Terraform will perform the following actions:

      # yandex_compute_instance.vm-1 will be updated in-place
      ~ resource "yandex_compute_instance" "vm-1" {
            id                        = "fhmd9gp1u2l7rvd8ctei"
          ~ name                      = "vm-innodevops" -> "vm-test"
            # (10 unchanged attributes hidden)

            # (5 unchanged blocks hidden)
        }

    Plan: 0 to add, 1 to change, 0 to destroy.

    Changes to Outputs:
      ~ external_ip_address_vm_1 = "51.250.71.217" -> "51.250.86.6"

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    yandex_compute_instance.vm-1: Modifying... [id=fhmd9gp1u2l7rvd8ctei]
    yandex_compute_instance.vm-1: Modifications complete after 6s [id=fhmd9gp1u2l7rvd8ctei]

    Apply complete! Resources: 0 added, 1 changed, 0 destroyed.                                                          

    Outputs:                                                                                                             

    external_ip_address_vm_1 = "51.250.86.6"                                                                             
    internal_ip_address_vm_1 = "10.13.37.3"
    ```
 * ```terraform destroy```:
    ```hcl
    yandex_vpc_network.network-1: Refreshing state... [id=enpjdpju6nivk2s4i1f7]
    yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9bgdqvhvc4d3lc8snlo]
    yandex_compute_instance.vm-1: Refreshing state... [id=fhmd9gp1u2l7rvd8ctei]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
    the following symbols:
      - destroy

    Terraform will perform the following actions:

      # yandex_compute_instance.vm-1 will be destroyed
      - resource "yandex_compute_instance" "vm-1" {
          - allow_stopping_for_update = true -> null
          - created_at                = "2022-09-27T01:57:34Z" -> null
          - folder_id                 = "b1g8pd7ir054eeq7eslq" -> null
          - fqdn                      = "fhmd9gp1u2l7rvd8ctei.auto.internal" -> null
          - id                        = "fhmd9gp1u2l7rvd8ctei" -> null
          - labels                    = {} -> null
          - metadata                  = {
              - "ssh-keys" = <<-EOT
                    ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCJ9VUeLw0IHeSitfXgrpL0GbHiC2/TitQr9jolDwZaSE8blPXZV0bF2j/Xfi6oNKaCESdjNQjz3sh3bO0k0N/POF73ufAl0WV7S2CKs05h1oZrXgTN/8meUyxkDLf1Bg3BMAMOUBfEaRilhpYpK7jcWBKS6PSm/IPG1nv/K1iHzFCn6e8aXvAEJ6UFwu8L1dRq2juBcqwIlr0qSXnTUbrLvhznK88I44tFyfuHUUm0s6tZQznTeuN67tv6/Bwbq0k5DwVfI/7by5COW6Rq62G7aQuRWuEUveVB7V5+RBurOqBg8wKwHc8xZUTRZ1CczC9+6fXELdgxJrYH+ggr2WAhiK6Ao+bgiZqNuZU7q7Q8o8Y7DaH6eJOokN+zcONdJWEptir8ocgO1PJPGvcWJqL0ZlvEURxwxGYFn+WkL46oDFj69lKYf7xM0hjbLhfTOGWDZ8fIWJdkQtHoexmuzkB07mfhDurUoMMdyYBMsnWy+yyOGDyG7WWeHLwhif3vlBs= kali@kali
                EOT
            } -> null
          - name                      = "vm-test" -> null
          - network_acceleration_type = "standard" -> null
          - platform_id               = "standard-v1" -> null
          - status                    = "running" -> null
          - zone                      = "ru-central1-a" -> null

          - boot_disk {
              - auto_delete = true -> null
              - device_name = "fhm2f8idr0efq6kn8083" -> null
              - disk_id     = "fhm2f8idr0efq6kn8083" -> null
              - mode        = "READ_WRITE" -> null

              - initialize_params {
                  - block_size = 4096 -> null
                  - image_id   = "fd8autg36kchufhej85b" -> null
                  - size       = 5 -> null
                  - type       = "network-hdd" -> null
                }
            }

          - network_interface {
              - index              = 0 -> null
              - ip_address         = "10.13.37.3" -> null
              - ipv4               = true -> null
              - ipv6               = false -> null
              - mac_address        = "d0:0d:d4:c3:21:f0" -> null
              - nat                = true -> null
              - nat_ip_address     = "51.250.86.6" -> null
              - nat_ip_version     = "IPV4" -> null
              - security_group_ids = [] -> null
              - subnet_id          = "e9bgdqvhvc4d3lc8snlo" -> null
            }

          - placement_policy {
              - host_affinity_rules = [] -> null
            }

          - resources {
              - core_fraction = 100 -> null
              - cores         = 4 -> null
              - gpus          = 0 -> null
              - memory        = 4 -> null
            }

          - scheduling_policy {
              - preemptible = false -> null
            }
        }

      # yandex_vpc_network.network-1 will be destroyed
      - resource "yandex_vpc_network" "network-1" {
          - created_at = "2022-09-27T01:56:02Z" -> null
          - folder_id  = "b1g8pd7ir054eeq7eslq" -> null
          - id         = "enpjdpju6nivk2s4i1f7" -> null
          - labels     = {} -> null
          - name       = "network-1" -> null
          - subnet_ids = [
              - "e9bgdqvhvc4d3lc8snlo",
            ] -> null
        }

      # yandex_vpc_subnet.subnet-1 will be destroyed
      - resource "yandex_vpc_subnet" "subnet-1" {
          - created_at     = "2022-09-27T01:56:04Z" -> null
          - folder_id      = "b1g8pd7ir054eeq7eslq" -> null
          - id             = "e9bgdqvhvc4d3lc8snlo" -> null
          - labels         = {} -> null
          - name           = "subnet-1" -> null
          - network_id     = "enpjdpju6nivk2s4i1f7" -> null
          - v4_cidr_blocks = [
              - "10.13.37.0/24",
            ] -> null
          - v6_cidr_blocks = [] -> null
          - zone           = "ru-central1-a" -> null
        }

    Plan: 0 to add, 0 to change, 3 to destroy.

    Changes to Outputs:
      - external_ip_address_vm_1 = "51.250.86.6" -> null
      - internal_ip_address_vm_1 = "10.13.37.3" -> null

    Do you really want to destroy all resources?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.

      Enter a value: yes

    yandex_compute_instance.vm-1: Destroying... [id=fhmd9gp1u2l7rvd8ctei]
    yandex_compute_instance.vm-1: Still destroying... [id=fhmd9gp1u2l7rvd8ctei, 10s elapsed]
    yandex_compute_instance.vm-1: Still destroying... [id=fhmd9gp1u2l7rvd8ctei, 20s elapsed]
    yandex_compute_instance.vm-1: Destruction complete after 21s
    yandex_vpc_subnet.subnet-1: Destroying... [id=e9bgdqvhvc4d3lc8snlo]
    yandex_vpc_subnet.subnet-1: Destruction complete after 7s
    yandex_vpc_network.network-1: Destroying... [id=enpjdpju6nivk2s4i1f7]
    yandex_vpc_network.network-1: Destruction complete after 1s

    Destroy complete! Resources: 3 destroyed.                                                                            
    ```

## Best practices

 * Consistence File Structure
 * Terraform configurations files separation
    Putting all code in main.tf is not a good idea, better having several files like:
    - main.tf - call modules, locals, and data sources to create all resources.
    - variables.tf - contains declarations of variables used in main.tf
    - outputs.tf - contains outputs from the resources created in main.tf
    - versions.tf - contains version requirements for Terraform and providers.
    - terraform.tfvars - contains variables values and should not be used anywhere.
 * Use separate directories for each application
    To manage applications and projects independently of each other, put resources for each application and project in their own Terraform directories.
    A service might represent a particular application or a common service such as shared networking. Nest all Terraform code for a particular service under one directory.
 * Use ```terraform fmt```
 * Use ```terraform validate```
 * Use ```terraform plan```
 * Do not use hardcoded secrets/tokens
