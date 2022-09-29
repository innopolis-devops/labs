# Terraform

## Terraform Best Practices I Applied

1. One directory per application
1. Use input variables (`variables.tf`)
1. Use `output.tf` for outputs
1. Use `.gitignore`
1. Use the environmental variables for authentication data
1. Use proper naming
1. Write meaningful description
1. Use `terraform fmt` and `terraform validate`

## Build A Docker Infrastructure Using Terraform

### Outputs

1. The output of `terraform show`:

    ```sh
        # docker_container.nginx:
        resource "docker_container" "nginx" {
            attach            = false
            command           = [
                "nginx",
                "-g",
                "daemon off;",
            ]
            cpu_shares        = 0
            entrypoint        = [
                "/docker-entrypoint.sh",
            ]
            env               = []
            gateway           = "172.17.0.1"
            hostname          = "b8cbfcfffb48"
            id                = "b8cbfcfffb48a09fb8d9ac0d61b4e70b0ecc9516de4975840160a56827469456"
            image             = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
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
            name              = "tutorial"
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

            ports {
                external = 8000
                internal = 80
                ip       = "0.0.0.0"
                protocol = "tcp"
            }
        }

        # docker_image.nginx:
        resource "docker_image" "nginx" {
            id           = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
            keep_locally = false
            latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
            name         = "nginx:latest"
            repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
        }
    ```

1. The output of `terraform state list`:

    ```sh
        docker_container.nginx
        docker_image.nginx
    ```

### Change Infrastructure

Run `terraform apply`:

```sh
    docker_image.nginx: Refreshing state... [id=sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest]
    docker_container.nginx: Refreshing state... [id=b8cbfcfffb48a09fb8d9ac0d61b4e70b0ecc9516de4975840160a56827469456]

    Terraform used the selected providers to generate the following
    execution plan. Resource actions are indicated with the following
    symbols:
    -/+ destroy and then create replacement

    Terraform will perform the following actions:

    # docker_container.nginx must be replaced
    -/+ resource "docker_container" "nginx" {
        + bridge            = (known after apply)
        ~ command           = [
            - "nginx",
            - "-g",
            - "daemon off;",
            ] -> (known after apply)
        + container_logs    = (known after apply)
        - cpu_shares        = 0 -> null
        - dns               = [] -> null
        - dns_opts          = [] -> null
        - dns_search        = [] -> null
        ~ entrypoint        = [
            - "/docker-entrypoint.sh",
            ] -> (known after apply)
        ~ env               = [] -> (known after apply)
        + exit_code         = (known after apply)
        ~ gateway           = "172.17.0.1" -> (known after apply)
        - group_add         = [] -> null
        ~ hostname          = "b8cbfcfffb48" -> (known after apply)
        ~ id                = "b8cbfcfffb48a09fb8d9ac0d61b4e70b0ecc9516de4975840160a56827469456" -> (known after apply)
        ~ init              = false -> (known after apply)
        ~ ip_address        = "172.17.0.2" -> (known after apply)
        ~ ip_prefix_length  = 16 -> (known after apply)
        ~ ipc_mode          = "private" -> (known after apply)
        - links             = [] -> null
        - log_opts          = {} -> null
        - max_retry_count   = 0 -> null
        - memory            = 0 -> null
        - memory_swap       = 0 -> null
            name              = "tutorial"
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

    Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes

    docker_container.nginx: Destroying... [id=b8cbfcfffb48a09fb8d9ac0d61b4e70b0ecc9516de4975840160a56827469456]
    docker_container.nginx: Destruction complete after 0s
    docker_container.nginx: Creating...
    docker_container.nginx: Creation complete after 0s [id=00860844cb8363e91f01569bab84de82a737aece6dd2438024864a6db8e0d28a]

    Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

### Define Input Variables

To set the docker container name with a variable I've created a new file called `variables.tf` with a block defining a new `container_name` variable:

```sh
    variable "container_name" {
    description = "Value of the name for the Docker container"
    type        = string
    default     = "ExampleNginxContainer"
    }
```

In `main.tf`, I updated the `docker_container` resource block to use the new variable. I declared the `container_name` value as `"ExampleNginxContainer"`.

### Output Docker Container Configuration

I've created a file called `outputs.tf` and added the configuration below to it:

```sh
    output "container_id" {
    description = "ID of the Docker container"
    value       = docker_container.nginx.id
    }

    output "image_id" {
    description = "ID of the Docker image"
    value       = docker_image.nginx.id
    }
```

Run `terraform output`:

```sh
    container_id = "beeb7ea6fdd71b428e6981207a34db1af9784a29703971f2252518e2ae056eca"
    image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```

## Yandex Cloud

1. I've created service account and installed Yandex Cloud CLI.
1. Then I've created an authorized key for the service account and record its file:

```sh
    yc iam key create \
    --service-account-id <service_account id> \
    --folder-name <service_account directory name> \
    --output key.json
```

1. After that I've created a CLI profile to perform operations on behalf of the service account:

    ```sh
        yc config profile create <profile_name>
    ```

1. Setted the profile configuration:

    ```sh
        yc config set service-account-key key.json
        yc config set cloud-id <block_id>
        yc config set folder-id <directory id>
    ```

1. Added authentication data to environment variables:

    ```sh
        PowerShell
        export YC_TOKEN=$(yc iam create-token)
        export YC_CLOUD_ID=$(yc config get cloud-id)
        export YC_FOLDER_ID=$(yc config get folder-id)
    ```

1. Created a configuration file `main.tf`
1. Edited the Terraform CLI configuration file with `nano ~/.terraformrc`:

    ```sh
        provider_installation {
        network_mirror {
            url = "https://terraform-mirror.yandexcloud.net/"
            include = ["registry.terraform.io/*/*"]
        }
        direct {
            exclude = ["registry.terraform.io/*/*"]
        }
        }
    ```

### Outputs (Yandex part)

1. The output of `terraform show`:

    ```sh
        # yandex_compute_instance.vm-1:
        resource "yandex_compute_instance" "vm-1" {
            created_at                = "2022-09-29T12:34:43Z"
            folder_id                 = "b1g1j1i6en6gp7r74vak"
            fqdn                      = "epd9ac16sqnm9hn8uhv9.auto.internal"
            id                        = "epd9ac16sqnm9hn8uhv9"
            labels                    = {}
            metadata                  = {
                "ssh-keys" = <<-EOT
                    ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDiE/0TXI8c4PfOmXy9jsMyI1l13iSqb1LmPIMzEVzeMNHBhHmjh6Jf2+t/t3Lgyq8vuQzd74xy8y/O2GluekEsQKjzH+wgVRusmQrrTbQPULdaK/LenNnyLN+jX5f265vQe4DqD7BBqwbe/3mL8j4LZReD3U2aJcVWsqojM2rUK4vBJsE2O9GNRermU2Lz+UetO1tzmVg6qk5zcC2onhIVSMLdBPgpbFeuLeHWQ8HZhaWdwX/2LCrSuicUiOkM1Rbhwu+mZERKqsp4GW8LzCQyz9DY42+toSrYJeoyCgyGyjPbeg8lxjZcWHkxezA2IcXFrzqr+Ntstrg9PpCOytBVy+KOiiNxbN7OgxCK2IeaW3CCXBI3K4YcByL8O4SS/0cBQ5IfNnwAOdms4enRRfQEDYBim18Wc0/l/+FtWlPdhJ1zCz7Y+YqprbPdG8Uk971j58zUIf3mxMIeYqcMdHtlull/QO2pZR4fGWEvbJJujjfxUd1gci2Oo8nQWZa1SA0= amina@Aminas-MacBook-Air.local
                EOT
            }
            name                      = "terraform1"
            network_acceleration_type = "standard"
            platform_id               = "standard-v1"
            status                    = "running"
            zone                      = "ru-central1-b"

            boot_disk {
                auto_delete = true
                device_name = "epdhufpqv54o879qe4qv"
                disk_id     = "epdhufpqv54o879qe4qv"
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
                ip_address         = "192.168.0.23"
                ipv4               = true
                ipv6               = false
                mac_address        = "d0:0d:95:30:26:e6"
                nat                = true
                nat_ip_address     = "158.160.3.187"
                nat_ip_version     = "IPV4"
                security_group_ids = []
                subnet_id          = "e2lskiqqfjuql7cknkbr"
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
            created_at = "2022-09-29T12:33:34Z"
            folder_id  = "b1g1j1i6en6gp7r74vak"
            id         = "enpitmricc8fqmk486vk"
            labels     = {}
            name       = "network1"
            subnet_ids = [
                "e2lskiqqfjuql7cknkbr",
            ]
        }

        # yandex_vpc_subnet.subnet-1:
        resource "yandex_vpc_subnet" "subnet-1" {
            created_at     = "2022-09-29T12:33:35Z"
            folder_id      = "b1g1j1i6en6gp7r74vak"
            id             = "e2lskiqqfjuql7cknkbr"
            labels         = {}
            name           = "subnet1"
            network_id     = "enpitmricc8fqmk486vk"
            v4_cidr_blocks = [
                "192.168.0.0/24",
            ]
            v6_cidr_blocks = []
            zone           = "ru-central1-b"
        }


        Outputs:

        external_ip_address_vm_1 = "158.160.3.187"
        internal_ip_address_vm_1 = "192.168.0.23"
    ```

1. The output of `terraform state list`:

   ```sh
        yandex_compute_instance.vm-1
        yandex_vpc_network.network-1
        yandex_vpc_subnet.subnet-1
   ```

### Define Input Variables (Yandex part)

I've created a new file called `variables.tf` with block defining new variables:

```sh
    "vm_name"
    "zone"
    "net_name"
    "subnet_name"
    "cloud_id"
    "folder_id"
    "image_id"
```

In `main.tf`, I've updated all blocks to use the new variables.

### Output Yandex Configuration

I've created a file called `outputs.tf` and added the configuration below to it:

```sh
    output "internal_ip_address_vm_1" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
    }

    output "external_ip_address_vm_1" {
    value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
    }
```

Run `terraform output`:

```sh
    external_ip_address_vm_1 = "158.160.3.187"
    internal_ip_address_vm_1 = "192.168.0.23"
```
