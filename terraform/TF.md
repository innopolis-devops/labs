# Docker 

## The Output of Hello-World Terraform plan

- `terraform show` output

```
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
        hostname          = "eb3eb6fe58c4"
        id                = "eb3eb6fe58c4a3f463cea01d3b36cf3e400b8ac841702cb7ff2519cc6831cc93"
        image             = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
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
        id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
        keep_locally = false
        latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
        name         = "nginx:latest"
        repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
    }
```


- `terraform state list` output

```
    docker_container.nginx
    docker_image.nginx
```

## Change infrastructure

- After applying a change to the previous plan(changing port from 8000 to 8080), this is the execution plan.

```
    Terraform used the selected providers to generate the following execution plan. Resource
    actions are indicated with the following symbols:
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
        ~ hostname          = "eb3eb6fe58c4" -> (known after apply)
        ~ id                = "eb3eb6fe58c4a3f463cea01d3b36cf3e400b8ac841702cb7ff2519cc6831cc93" -> (known after apply)
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
```

## Rename Docker Container using Input Variables

Added file `variables.tf` and changing container name in `main.tf` to `var.cat`

## Output Docker Configuration

Added `outputs.tf` to define outputs for your container's ID and the image ID.

The output of `terraform output` is

```
    container_id = "3c73de6345d3717363fdc44b655ffa4baf7aa9d93f88165728a26c570a31ed46"
    image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```



# AWS 

## The Output of Hello-World Terraform plan

- `terraform show` output

```
    # aws_instance.app_server:
    resource "aws_instance" "app_server" {
        ami                                  = "ami-830c94e3"
        arn                                  = "arn:aws:ec2:us-west-2:068288137325:instance/i-018133e19c78135d4"
        associate_public_ip_address          = true
        availability_zone                    = "us-west-2a"
        cpu_core_count                       = 1
        cpu_threads_per_core                 = 1
        disable_api_stop                     = false
        disable_api_termination              = false
        ebs_optimized                        = false
        get_password_data                    = false
        hibernation                          = false
        id                                   = "i-018133e19c78135d4"
        instance_initiated_shutdown_behavior = "stop"
        instance_state                       = "running"
        instance_type                        = "t2.micro"
        ipv6_address_count                   = 0
        ipv6_addresses                       = []
        monitoring                           = false
        primary_network_interface_id         = "eni-013200b15bbe9811a"
        private_dns                          = "ip-172-31-27-121.us-west-2.compute.internal"
        private_ip                           = "172.31.27.121"
        public_dns                           = "ec2-54-185-254-243.us-west-2.compute.amazonaws.com"
        public_ip                            = "54.185.254.243"
        secondary_private_ips                = []
        security_groups                      = [
            "default",
        ]
        source_dest_check                    = true
        subnet_id                            = "subnet-04065c95bab296b5e"
        tags                                 = {
            "Name" = "ExampleAppServerInstance"
        }
        tags_all                             = {
            "Name" = "ExampleAppServerInstance"
        }
        tenancy                              = "default"
        user_data_replace_on_change          = false
        vpc_security_group_ids               = [
            "sg-0880e88163a2562c0",
        ]

        capacity_reservation_specification {
            capacity_reservation_preference = "open"
        }

        credit_specification {
            cpu_credits = "standard"
        }

        enclave_options {
            enabled = false
        }

        maintenance_options {
            auto_recovery = "default"
        }

        metadata_options {
            http_endpoint               = "enabled"
            http_put_response_hop_limit = 1
            http_tokens                 = "optional"
            instance_metadata_tags      = "disabled"
        }

        private_dns_name_options {
            enable_resource_name_dns_a_record    = false
            enable_resource_name_dns_aaaa_record = false
            hostname_type                        = "ip-name"
        }

        root_block_device {
            delete_on_termination = true
            device_name           = "/dev/sda1"
            encrypted             = false
            iops                  = 0
            tags                  = {}
            throughput            = 0
            volume_id             = "vol-0498c72067db1b631"
            volume_size           = 8
            volume_type           = "standard"
        }
    }
```


- `terraform state list` output

```
    aws_instance.app_server
```

## Change infrastructure

- After applying a change to the previous plan(ami in resource & name in tags from ExampleAppServerInstance to Cat), this is the execution plan.

```
    Terraform used the selected providers to generate the following execution plan. Resource
    actions are indicated with the following symbols:
    -/+ destroy and then create replacement

    Terraform will perform the following actions:

    # aws_instance.app_server must be replaced
    -/+ resource "aws_instance" "app_server" {
        ~ ami                                  = "ami-830c94e3" -> "ami-08d70e59c07c61a3a" # forces replacement
        ~ arn                                  = "arn:aws:ec2:us-west-2:068288137325:instance/i-018133e19c78135d4" -> (known after apply)
        ~ associate_public_ip_address          = true -> (known after apply)
        ~ availability_zone                    = "us-west-2a" -> (known after apply)
        ~ cpu_core_count                       = 1 -> (known after apply)
        ~ cpu_threads_per_core                 = 1 -> (known after apply)
        ~ disable_api_stop                     = false -> (known after apply)
        ~ disable_api_termination              = false -> (known after apply)
        ~ ebs_optimized                        = false -> (known after apply)
        - hibernation                          = false -> null
        + host_id                              = (known after apply)
        + host_resource_group_arn              = (known after apply)
        ~ id                                   = "i-018133e19c78135d4" -> (known after apply)
        ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
        ~ instance_state                       = "running" -> (known after apply)
        ~ ipv6_address_count                   = 0 -> (known after apply)
        ~ ipv6_addresses                       = [] -> (known after apply)
        + key_name                             = (known after apply)
        ~ monitoring                           = false -> (known after apply)
        + outpost_arn                          = (known after apply)
        + password_data                        = (known after apply)
        + placement_group                      = (known after apply)
        + placement_partition_number           = (known after apply)
        ~ primary_network_interface_id         = "eni-013200b15bbe9811a" -> (known after apply)
        ~ private_dns                          = "ip-172-31-27-121.us-west-2.compute.internal" -> (known after apply)
        ~ private_ip                           = "172.31.27.121" -> (known after apply)
        ~ public_dns                           = "ec2-54-185-254-243.us-west-2.compute.amazonaws.com" -> (known after apply)
        ~ public_ip                            = "54.185.254.243" -> (known after apply)
        ~ secondary_private_ips                = [] -> (known after apply)
        ~ security_groups                      = [
            - "default",
            ] -> (known after apply)
        ~ subnet_id                            = "subnet-04065c95bab296b5e" -> (known after apply)
        ~ tags                                 = {
            ~ "Name" = "ExampleAppServerInstance" -> "Cat"
            }
        ~ tags_all                             = {
            ~ "Name" = "ExampleAppServerInstance" -> "Cat"
            }
        ~ tenancy                              = "default" -> (known after apply)
        + user_data                            = (known after apply)
        + user_data_base64                     = (known after apply)
        ~ vpc_security_group_ids               = [
            - "sg-0880e88163a2562c0",
            ] -> (known after apply)
            # (4 unchanged attributes hidden)

        ~ capacity_reservation_specification {
            ~ capacity_reservation_preference = "open" -> (known after apply)

            + capacity_reservation_target {
                + capacity_reservation_id                 = (known after apply)
                + capacity_reservation_resource_group_arn = (known after apply)
                }
            }

        - credit_specification {
            - cpu_credits = "standard" -> null
            }

        + ebs_block_device {
            + delete_on_termination = (known after apply)
            + device_name           = (known after apply)
            + encrypted             = (known after apply)
            + iops                  = (known after apply)
            + kms_key_id            = (known after apply)
            + snapshot_id           = (known after apply)
            + tags                  = (known after apply)
            + throughput            = (known after apply)
            + volume_id             = (known after apply)
            + volume_size           = (known after apply)
            + volume_type           = (known after apply)
            }

        ~ enclave_options {
            ~ enabled = false -> (known after apply)
            }

        + ephemeral_block_device {
            + device_name  = (known after apply)
            + no_device    = (known after apply)
            + virtual_name = (known after apply)
            }

        ~ maintenance_options {
            ~ auto_recovery = "default" -> (known after apply)
            }

        ~ metadata_options {
            ~ http_endpoint               = "enabled" -> (known after apply)
            ~ http_put_response_hop_limit = 1 -> (known after apply)
            ~ http_tokens                 = "optional" -> (known after apply)
            ~ instance_metadata_tags      = "disabled" -> (known after apply)
            }

        + network_interface {
            + delete_on_termination = (known after apply)
            + device_index          = (known after apply)
            + network_card_index    = (known after apply)
            + network_interface_id  = (known after apply)
            }

        ~ private_dns_name_options {
            ~ enable_resource_name_dns_a_record    = false -> (known after apply)
            ~ enable_resource_name_dns_aaaa_record = false -> (known after apply)
            ~ hostname_type                        = "ip-name" -> (known after apply)
            }

        ~ root_block_device {
            ~ delete_on_termination = true -> (known after apply)
            ~ device_name           = "/dev/sda1" -> (known after apply)
            ~ encrypted             = false -> (known after apply)
            ~ iops                  = 0 -> (known after apply)
            + kms_key_id            = (known after apply)
            ~ tags                  = {} -> (known after apply)
            ~ throughput            = 0 -> (known after apply)
            ~ volume_id             = "vol-0498c72067db1b631" -> (known after apply)
            ~ volume_size           = 8 -> (known after apply)
            ~ volume_type           = "standard" -> (known after apply)
            }
        }

    Plan: 1 to add, 0 to change, 1 to destroy.
```

## Rename AWS tag name using Input Variables

Added file `variables.tf` and changing container name in `main.tf` to `var.instance_name`

## Output AWS Configuration

Added `outputs.tf` to define outputs of the instance_id and instance_public_ip.

The output of `terraform output` is

```
    instance_id = "i-071b3e78ab3e83398"
    instance_public_ip = "35.89.245.190"
```

# Github

## Output of the `terraform apply -var "token=..."`

```sh
Terraform used the selected providers to generate the following execution plan. Resource
actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_branch_default.repo will be created
  + resource "github_branch_default" "repo" {
      + branch     = "main"
      + id         = (known after apply)
      + repository = "DevOps-Course-Task"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = false
      + id                              = (known after apply)
      + pattern                         = "main"
      + repository_id                   = "R_kgDOIGXLfw"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```

## The output of `terraform import`

```sh
    github_repository.repo: Import prepared!
    Prepared github_repository for import
    github_repository.repo: Refreshing state... [id=DevOps-Course-Task]

    Import successful!

    The resources that were imported are shown above. These resources are now in
    your Terraform state and will henceforth be managed by Terraform.

```

## Bonus part

To disable rebase and squash commits for the repository, set `allow_squash_merge` and `allow_rebase_merge` arguments to false in github_repository resource.

# Terraform Best Practice

- Don't push `.terraform` and `.tfstate` files to VCS

The `.terraform` folder is created by terraform init which is executed by every user that wishes to use terraform configuration, so it's unique for each user.

The `.tfstate` is a sensitive data and should not be shared publicly (or among the developers). It is much saver to use "remote" backend to store it on a server and to allow multiple developers to collaborate on the same state.

- Use `terraform.tfvars` file only in compositions

Composition is the final infrastructure that is composed of many other terraform modules. It is what will be there and it is what should be configurated completely. Don't configurate using `terraform.tfvars` the modules themselves. Their variables are to be configured by the top-level user of the modules.

- `terraform validate` for validating
- `terraform fmt` for formatting code