# Docker

1. Starting.
```shell
(iu-devops-labs) f3line@kitty docker % terraform apply -var-file="secrets.tfvars"  
data.aws_caller_identity.current: Reading...
data.aws_ecr_authorization_token.token: Reading...
data.aws_caller_identity.current: Read complete after 2s [id=553667903818]
data.aws_ecr_authorization_token.token: Read complete after 2s [id=eu-north-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.app_python will be created
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
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "app_python"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
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
          + external = 80
          + internal = 8000
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.app_python will be created
  + resource "docker_image" "app_python" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + container_id = (known after apply)
  + image_name   = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.app_python: Creating...
docker_image.app_python: Still creating... [10s elapsed]
docker_image.app_python: Still creating... [20s elapsed]
docker_image.app_python: Still creating... [30s elapsed]
docker_image.app_python: Still creating... [40s elapsed]
docker_image.app_python: Still creating... [50s elapsed]
docker_image.app_python: Still creating... [1m0s elapsed]
docker_image.app_python: Still creating... [1m10s elapsed]
docker_image.app_python: Still creating... [1m20s elapsed]
docker_image.app_python: Still creating... [1m30s elapsed]
docker_image.app_python: Still creating... [1m40s elapsed]
docker_image.app_python: Still creating... [1m50s elapsed]
docker_image.app_python: Still creating... [2m0s elapsed]
docker_image.app_python: Still creating... [2m10s elapsed]
docker_image.app_python: Still creating... [2m20s elapsed]
docker_image.app_python: Still creating... [2m30s elapsed]
docker_image.app_python: Still creating... [2m40s elapsed]
docker_image.app_python: Still creating... [2m50s elapsed]
docker_image.app_python: Creation complete after 2m59s [id=sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod]
docker_container.app_python: Creating...
docker_container.app_python: Creation complete after 1s [id=03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

container_id = "03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a"
image_name = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
```
```shell
(iu-devops-labs) f3line@kitty docker % terraform show                              
# data.aws_caller_identity.current:
data "aws_caller_identity" "current" {
    account_id = "553667903818"
    arn        = "arn:aws:iam::553667903818:user/tf"
    id         = "553667903818"
    user_id    = "AIDAYB2JNYFFLVPXZZHLW"
}

# data.aws_ecr_authorization_token.token:
data "aws_ecr_authorization_token" "token" {
    authorization_token = (sensitive value)
    expires_at          = "2022-09-27T07:02:51Z"
    id                  = "eu-north-1"
    password            = (sensitive value)
    proxy_endpoint      = "https://553667903818.dkr.ecr.eu-north-1.amazonaws.com"
    user_name           = "AWS"
}

# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "python3",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "03aa028e927a"
    id                                          = "03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a"
    image                                       = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
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
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "devops"
    working_dir                                 = "/app"

    ports {
        external = 80
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
    image_id     = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
    keep_locally = false
    latest       = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
    name         = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
    repo_digest  = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api@sha256:2b0093b5b734e56d0b98f1716456c6012329490849af3ffa2a002caa2722321b"
}


Outputs:

container_id = "03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a"
image_name = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
```
```shell
(iu-devops-labs) f3line@kitty docker % terraform state list                        
data.aws_caller_identity.current
data.aws_ecr_authorization_token.token
docker_container.app_python
docker_image.app_python
```
```shell
(iu-devops-labs) f3line@kitty docker % terraform output                                            
container_id = "03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a"
image_name = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
```

2. Modifying (Change docker container name).
```shell
(iu-devops-labs) f3line@kitty docker % terraform apply -var-file="secrets.tfvars"  
data.aws_ecr_authorization_token.token: Reading...
data.aws_caller_identity.current: Reading...
data.aws_caller_identity.current: Read complete after 2s [id=553667903818]
data.aws_ecr_authorization_token.token: Read complete after 2s [id=eu-north-1]
docker_image.app_python: Refreshing state... [id=sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod]
docker_container.app_python: Refreshing state... [id=03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a]

Terraform will perform the following actions:

  # docker_container.app_python will be created
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
      + image                                       = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "new_app_python"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
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
          + external = 80
          + internal = 8000
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  ~ container_id = "03aa028e927a68e214235768bdd6b7c2a86d14e534790a2c4d5652bb58b92f6a" -> (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.app_python: Creating...
docker_container.app_python: Creation complete after 2s [id=d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

container_id = "d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae"
image_name = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
```
```shell
(iu-devops-labs) f3line@kitty docker % terraform state list                      
data.aws_caller_identity.current
data.aws_ecr_authorization_token.token
docker_container.app_python
docker_image.app_python
(iu-devops-labs) f3line@kitty docker % terraform show                              
# data.aws_caller_identity.current:
data "aws_caller_identity" "current" {
    account_id = "553667903818"
    arn        = "arn:aws:iam::553667903818:user/tf"
    id         = "553667903818"
    user_id    = "AIDAYB2JNYFFLVPXZZHLW"
}

# data.aws_ecr_authorization_token.token:
data "aws_ecr_authorization_token" "token" {
    authorization_token = (sensitive value)
    expires_at          = "2022-09-27T07:10:38Z"
    id                  = "eu-north-1"
    password            = (sensitive value)
    proxy_endpoint      = "https://553667903818.dkr.ecr.eu-north-1.amazonaws.com"
    user_name           = "AWS"
}

# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "python3",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "d9888276f21c"
    id                                          = "d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae"
    image                                       = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
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
    name                                        = "new_app_python"
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
    user                                        = "devops"
    working_dir                                 = "/app"

    ports {
        external = 80
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
    image_id     = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
    keep_locally = false
    latest       = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8"
    name         = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
    repo_digest  = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api@sha256:2b0093b5b734e56d0b98f1716456c6012329490849af3ffa2a002caa2722321b"
}


Outputs:

container_id = "d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae"
image_name = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
```
```shell
(iu-devops-labs) f3line@kitty docker % terraform state list                      
data.aws_caller_identity.current
data.aws_ecr_authorization_token.token
docker_container.app_python
docker_image.app_python
```
```shell
(iu-devops-labs) f3line@kitty docker % terraform output                                            
container_id = "d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae"
image_name = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod"
```

3. Stop.
```shell
data.aws_caller_identity.current: Read complete after 1s [id=553667903818]
data.aws_ecr_authorization_token.token: Read complete after 1s [id=eu-north-1]
docker_image.app_python: Refreshing state... [id=sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod]
docker_container.app_python: Refreshing state... [id=d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_image.app_python will be destroyed
  - resource "docker_image" "app_python" {
      - id           = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod" -> null
      - image_id     = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8" -> null
      - keep_locally = false -> null
      - latest       = "sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8" -> null
      - name         = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod" -> null
      - repo_digest  = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api@sha256:2b0093b5b734e56d0b98f1716456c6012329490849af3ffa2a002caa2722321b" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - container_id = "d9888276f21c07f92b7d0f0d7ffc07cc62ac50d59787525bc80e085d98d48fae" -> null
  - image_name   = "553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

docker_image.app_python: Destroying... [id=sha256:e54903d4c7faef563108a7efabb90f29e445c5e199fec27ffa396eeacc8cc4b8553667903818.dkr.ecr.eu-north-1.amazonaws.com/app_python/api:prod]
docker_image.app_python: Destruction complete after 5s

Destroy complete! Resources: 1 destroyed.
```


# AWS

1. Creating
```shell
(iu-devops-labs) f3line@kitty aws % terraform apply -var-file="secrets.tfvars"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.app_server will be created
  + resource "aws_instance" "app_server" {
      + ami                                  = "ami-0bcf2639b551f6b31"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.nano"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "ExampleAppServerInstance"
        }
      + tags_all                             = {
          + "Name" = "ExampleAppServerInstance"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id                 = (known after apply)
              + capacity_reservation_resource_group_arn = (known after apply)
            }
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

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + maintenance_options {
          + auto_recovery = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_card_index    = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + private_dns_name_options {
          + enable_resource_name_dns_a_record    = (known after apply)
          + enable_resource_name_dns_aaaa_record = (known after apply)
          + hostname_type                        = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public_ip = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.app_server: Creating...
aws_instance.app_server: Still creating... [10s elapsed]
aws_instance.app_server: Creation complete after 17s [id=i-054919991de28f4c6]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

ami = "ami-0bcf2639b551f6b31"
public_ip = "13.49.221.8"
```
```shell
(iu-devops-labs) f3line@kitty aws % terraform show                              
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-0bcf2639b551f6b31"
    arn                                  = "arn:aws:ec2:eu-north-1:553667903818:instance/i-054919991de28f4c6"
    associate_public_ip_address          = true
    availability_zone                    = "eu-north-1c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 2
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-054919991de28f4c6"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t3.nano"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-07ce80802fd5757b7"
    private_dns                          = "ip-172-31-15-61.eu-north-1.compute.internal"
    private_ip                           = "172.31.15.61"
    public_dns                           = "ec2-13-49-221-8.eu-north-1.compute.amazonaws.com"
    public_ip                            = "13.49.221.8"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-d8974995"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-7872711e",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "unlimited"
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
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-03ca091bf69783410"
        volume_size           = 8
        volume_type           = "gp2"
    }
}


Outputs:

ami = "ami-0bcf2639b551f6b31"
public_ip = "13.49.221.8"
```
```shell
(iu-devops-labs) f3line@kitty aws % terraform state list                        
aws_instance.app_server
```
```shell
(iu-devops-labs) f3line@kitty aws % terraform output
ami = "ami-0bcf2639b551f6b31"
public_ip = "13.49.221.8"
```

2. Modifying (Change AMI to ami-00b696228b0185ffe (Ubuntu))
```shell
(iu-devops-labs) f3line@kitty aws % terraform apply -var-file="secrets.tfvars"
aws_instance.app_server: Refreshing state... [id=i-054919991de28f4c6]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.app_server must be replaced
-/+ resource "aws_instance" "app_server" {
      ~ ami                                  = "ami-0bcf2639b551f6b31" -> "ami-00b696228b0185ffe" # forces replacement
      ~ arn                                  = "arn:aws:ec2:eu-north-1:553667903818:instance/i-054919991de28f4c6" -> (known after apply)
      ~ associate_public_ip_address          = true -> (known after apply)
      ~ availability_zone                    = "eu-north-1c" -> (known after apply)
      ~ cpu_core_count                       = 1 -> (known after apply)
      ~ cpu_threads_per_core                 = 2 -> (known after apply)
      ~ disable_api_stop                     = false -> (known after apply)
      ~ disable_api_termination              = false -> (known after apply)
      ~ ebs_optimized                        = false -> (known after apply)
      - hibernation                          = false -> null
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      ~ id                                   = "i-054919991de28f4c6" -> (known after apply)
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
      ~ primary_network_interface_id         = "eni-07ce80802fd5757b7" -> (known after apply)
      ~ private_dns                          = "ip-172-31-15-61.eu-north-1.compute.internal" -> (known after apply)
      ~ private_ip                           = "172.31.15.61" -> (known after apply)
      ~ public_dns                           = "ec2-13-49-221-8.eu-north-1.compute.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "13.49.221.8" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [
          - "default",
        ] -> (known after apply)
      ~ subnet_id                            = "subnet-d8974995" -> (known after apply)
        tags                                 = {
            "Name" = "ExampleAppServerInstance"
        }
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-7872711e",
        ] -> (known after apply)
        # (5 unchanged attributes hidden)

      ~ capacity_reservation_specification {
          ~ capacity_reservation_preference = "open" -> (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id                 = (known after apply)
              + capacity_reservation_resource_group_arn = (known after apply)
            }
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
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
          ~ device_name           = "/dev/xvda" -> (known after apply)
          ~ encrypted             = false -> (known after apply)
          ~ iops                  = 100 -> (known after apply)
          + kms_key_id            = (known after apply)
          ~ tags                  = {} -> (known after apply)
          ~ throughput            = 0 -> (known after apply)
          ~ volume_id             = "vol-03ca091bf69783410" -> (known after apply)
          ~ volume_size           = 8 -> (known after apply)
          ~ volume_type           = "gp2" -> (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ ami       = "ami-0bcf2639b551f6b31" -> "ami-00b696228b0185ffe"
  ~ public_ip = "13.49.221.8" -> (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.app_server: Destroying... [id=i-054919991de28f4c6]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 10s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 20s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 30s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 40s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 50s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 1m0s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 1m10s elapsed]
aws_instance.app_server: Still destroying... [id=i-054919991de28f4c6, 1m20s elapsed]
aws_instance.app_server: Destruction complete after 1m24s
aws_instance.app_server: Creating...
aws_instance.app_server: Still creating... [10s elapsed]
aws_instance.app_server: Creation complete after 17s [id=i-0175e749400306908]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

ami = "ami-00b696228b0185ffe"
public_ip = "13.50.110.87"
```
```shell
(iu-devops-labs) f3line@kitty aws % terraform show                            
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-00b696228b0185ffe"
    arn                                  = "arn:aws:ec2:eu-north-1:553667903818:instance/i-0175e749400306908"
    associate_public_ip_address          = true
    availability_zone                    = "eu-north-1c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 2
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-0175e749400306908"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t3.nano"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-019ad84a2c15a414c"
    private_dns                          = "ip-172-31-5-133.eu-north-1.compute.internal"
    private_ip                           = "172.31.5.133"
    public_dns                           = "ec2-13-50-110-87.eu-north-1.compute.amazonaws.com"
    public_ip                            = "13.50.110.87"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-d8974995"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-7872711e",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "unlimited"
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
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-010b808407c19385e"
        volume_size           = 8
        volume_type           = "gp2"
    }
}


Outputs:

ami = "ami-00b696228b0185ffe"
public_ip = "13.50.110.87"
```
```shell
(iu-devops-labs) f3line@kitty aws % terraform state list                      
aws_instance.app_server
```
```shell
(iu-devops-labs) f3line@kitty aws % terraform output
ami = "ami-00b696228b0185ffe"
public_ip = "13.50.110.87"
```

3. Stop
```shell
(iu-devops-labs) f3line@kitty aws % terraform destroy -var-file="secrets.tfvars"
aws_instance.app_server: Refreshing state... [id=i-0175e749400306908]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.app_server will be destroyed
  - resource "aws_instance" "app_server" {
      - ami                                  = "ami-00b696228b0185ffe" -> null
      - arn                                  = "arn:aws:ec2:eu-north-1:553667903818:instance/i-0175e749400306908" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "eu-north-1c" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0175e749400306908" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.nano" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - monitoring                           = false -> null
      - primary_network_interface_id         = "eni-019ad84a2c15a414c" -> null
      - private_dns                          = "ip-172-31-5-133.eu-north-1.compute.internal" -> null
      - private_ip                           = "172.31.5.133" -> null
      - public_dns                           = "ec2-13-50-110-87.eu-north-1.compute.amazonaws.com" -> null
      - public_ip                            = "13.50.110.87" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [
          - "default",
        ] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-d8974995" -> null
      - tags                                 = {
          - "Name" = "ExampleAppServerInstance"
        } -> null
      - tags_all                             = {
          - "Name" = "ExampleAppServerInstance"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-7872711e",
        ] -> null

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-010b808407c19385e" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - ami       = "ami-00b696228b0185ffe" -> null
  - public_ip = "13.50.110.87" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.app_server: Destroying... [id=i-0175e749400306908]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 10s elapsed]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 20s elapsed]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 30s elapsed]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 40s elapsed]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 50s elapsed]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 1m0s elapsed]
aws_instance.app_server: Still destroying... [id=i-0175e749400306908, 1m10s elapsed]
aws_instance.app_server: Destruction complete after 1m14s

Destroy complete! Resources: 1 destroyed.
```


# GitHub
1. Import
```shell
(iu-devops-labs) f3line@kitty github % terraform import -var-file="secrets.tfvars" "github_repository.iu_devops_labs" "iu-devops-labs"
github_repository.iu_devops_labs: Importing from ID "iu-devops-labs"...
github_repository.iu_devops_labs: Import prepared!
  Prepared github_repository for import
github_repository.iu_devops_labs: Refreshing state... [id=iu-devops-labs]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```
```shell
(iu-devops-labs) f3line@kitty github % terraform show                                                                                 
# github_repository.iu_devops_labs:
resource "github_repository" "iu_devops_labs" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = false
    default_branch              = "master"
    delete_branch_on_merge      = false
    etag                        = "W/\"640321799ef22827bd7e6eed4cbe60b60f605d5590239afc84659f6981d2a6cd\""
    full_name                   = "smthngslv/iu-devops-labs"
    git_clone_url               = "git://github.com/smthngslv/iu-devops-labs.git"
    has_downloads               = true
    has_issues                  = false
    has_projects                = true
    has_wiki                    = true
    html_url                    = "https://github.com/smthngslv/iu-devops-labs"
    http_clone_url              = "https://github.com/smthngslv/iu-devops-labs.git"
    id                          = "iu-devops-labs"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "iu-devops-labs"
    node_id                     = "R_kgDOH60uxQ"
    private                     = false
    repo_id                     = 531443397
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:smthngslv/iu-devops-labs.git"
    svn_url                     = "https://github.com/smthngslv/iu-devops-labs"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}
```
```shell
(iu-devops-labs) f3line@kitty github % terraform state list                                                                           
github_repository.iu_devops_labs
```

2. Apply
```shell
(iu-devops-labs) f3line@kitty github % terraform apply -var-file="secrets.tfvars"
github_repository.iu_devops_labs: Refreshing state... [id=iu-devops-labs]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

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

  # github_repository.iu_devops_labs will be updated in-place
  ~ resource "github_repository" "iu_devops_labs" {
      ~ allow_rebase_merge          = true -> false
      ~ allow_squash_merge          = true -> false
      + description                 = "Innopolis DevOps Course."
      - has_downloads               = true -> null
      - has_projects                = true -> null
      - has_wiki                    = true -> null
        id                          = "iu-devops-labs"
        name                        = "iu-devops-labs"
        # (25 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.iu_devops_labs: Modifying... [id=iu-devops-labs]
github_repository.iu_devops_labs: Modifications complete after 3s [id=iu-devops-labs]
github_branch_default.master: Creating...
github_branch_default.master: Creation complete after 2s [id=iu-devops-labs]
github_branch_protection.default: Creating...
github_branch_protection.default: Creation complete after 6s [id=BPR_kwDOH60uxc4Bv7pf]

Apply complete! Resources: 2 added, 1 changed, 0 destroyed.
```
```shell
(iu-devops-labs) f3line@kitty github % terraform show                                                                                 
# github_branch_default.master:
resource "github_branch_default" "master" {
    branch     = "master"
    id         = "iu-devops-labs"
    repository = "iu-devops-labs"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOH60uxc4Bv7pf"
    pattern                         = "master"
    repository_id                   = "iu-devops-labs"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false
}

# github_repository.iu_devops_labs:
resource "github_repository" "iu_devops_labs" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    archived                    = false
    auto_init                   = false
    default_branch              = "master"
    delete_branch_on_merge      = false
    description                 = "Innopolis DevOps Course."
    etag                        = "W/\"dec3cb2fe6b84defd3bbdf50041b89b75b6bcc88900e2c36db55433abb328e1f\""
    full_name                   = "smthngslv/iu-devops-labs"
    git_clone_url               = "git://github.com/smthngslv/iu-devops-labs.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/smthngslv/iu-devops-labs"
    http_clone_url              = "https://github.com/smthngslv/iu-devops-labs.git"
    id                          = "iu-devops-labs"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "iu-devops-labs"
    node_id                     = "R_kgDOH60uxQ"
    private                     = false
    repo_id                     = 531443397
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:smthngslv/iu-devops-labs.git"
    svn_url                     = "https://github.com/smthngslv/iu-devops-labs"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}
```
```shell
(iu-devops-labs) f3line@kitty github % terraform state list                      
github_branch_default.master
github_branch_protection.default
github_repository.iu_devops_labs
```


# Best practices
1. Better to split infrastructure to files (i.e. provides, variables etc).
2. Variables should hide via secret `.tfvars` files.
3. Use `terraform fmt` to format and `terraform validate` to validate files.
