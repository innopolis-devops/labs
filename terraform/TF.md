# Terraform part

## Cloud
In this lab implementation I'm using Yandex Cloud as a target cloud provider.
I've used [Guide for using Yandex Cloud with Terraform](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart) as a reference.

## Github
I've generated a Github PAT with the following permissions:
- repo
- read:repo_hook
- read:org
- read:discussion
- delete_repo

Then I've imported a repository with the following command:
```bash
terraform import github_repository.innodevops-terraform terraform
```

## Best practices applied

When working with Terraform, I find it important to follow best practices to ensure that my infrastructure is consistent, maintainable, and scalable. Here are some of the best practices that I applied in my Terraform projects:

Firstly, I organized my Terraform projects by using separate directories for each application. This helps me to keep things organized and prevents different applications from interfering with each other.

Secondly, I declared all variables in a separate file named variables.tf. This makes it easy for me to manage and update variables, and also makes the code more readable.

Thirdly, I organized all outputs in a separate file named outputs.tf. This makes it easy for me to access the outputs of the infrastructure after it has been created.

In addition, I ensured that all variables and outputs had meaningful descriptions to make it easier for me and other developers to understand the code.

Finally, I used the built-in formatting tool, terraform fmt, to ensure that the code is consistently formatted and easy to read. This also helps me to prevent formatting errors and ensures that the code follows best practices.

## Outputs

1. `terraform show`
<details>
<summary>terraform show</summary>

```plain
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach            = false
    command           = [
        "flask",
        "run",
        "--host=0.0.0.0",
    ]
    cpu_shares        = 0
    entrypoint        = []
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "35c7401034e2"
    id                = "35c7401034e2530c6dc4e0db99add906a4be91e95dac9418912b4891dba2a2ca"
    image             = "sha256:7c1f52901364cdd1bae256ea15a2a19c5a64c31a5b2636210f2ef656b8600efa"
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
    name              = "app"
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
    working_dir       = "/app"

    ports {
        external = 8080
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:7c1f52901364cdd1bae256ea15a2a19c5a64c31a5b2636210f2ef656b8600efasemior/innodevops:latest"
    keep_locally = false
    latest       = "sha256:7c1f52901364cdd1bae256ea15a2a19c5a64c31a5b2636210f2ef656b8600efa"
    name         = "semior/innodevops:latest"
    repo_digest  = "semior/innodevops@sha256:573582aea41a971948351d22d838c8f0f608de8f30676af51a579ca41293861d"
}


Outputs:

container_id = "35c7401034e2530c6dc4e0db99add906a4be91e95dac9418912b4891dba2a2ca"
image_id = "sha256:7c1f52901364cdd1bae256ea15a2a19c5a64c31a5b2636210f2ef656b8600efasemior/innodevops:latest"
```
</details>

2. terraform state list

```plain
docker_container.app_python
docker_image.app_python
```

4. `terraform output`

```plain
container_id = "35c7401034e2530c6dc4e0db99add906a4be91e95dac9418912b4891dba2a2ca"
image_id = "sha256:7c1f52901364cdd1bae256ea15a2a19c5a64c31a5b2636210f2ef656b8600efasemior/innodevops:latest"
```

## Yandex cloud infrastructure using Terraform

1. `terraform show`

<details>
<summary>terraform show</summary>

```plain
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    allow_stopping_for_update = true
    created_at                = "2023-02-14T04:05:17Z"
    folder_id                 = "b1gpoeve0qjq1amh801g"
    fqdn                      = "fhmmsvfc2u8rag5igtel.auto.internal"
    id                        = "fhmmsvfc2u8rag5igtel"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD1iluXBa7OipSUF7DEww2mzjWC8lsj8QxWAI+viE95By1gnaT8IyTBW9rFPgguYlwdhVaMmb8dNlulTb0yAJarjlzXqA/vQ+8Gwx0I8OFbxDq7lcJtDiepi/43YQNNss5+QlE+g2u2V1kHbwXV5vLIPXQyAVuXcaFnt4LDLrN4lziBnb2GrcXvZy/ytXB9GwgmhhhuD1T+gUEWO6v1etXxUi6yMZ3JUklXW8N1DhPcNCzwchOafe54qyFQqIwPq0VrJtmQWrvP3HqgHGcMmAjyhor/E07hIF0Pg8rHva4Rmn1Anawe6lC2SfLikx7X4KkhjPTxug6KQG+v/oQ4za9Kt9+hGvRGWjlMYQ+P/zTcPVQoR1nBAUXmNe0BrxMJ6MHl20iuqPw8Ez1N346AlbL+CVHiPua6iT732O4irbkHLBaY4Y2RN7qPZK8PNCy9/paRjAV8YsFClvnU2lhYDgJQQikiAVW7o9nYQjGk7Bujg6qyXedJDaMEt124eiL0846YW3hg1B2alyJANc94QU/B1rgsn3kqAryuoG0pToHWfH+lvBqnxDoH3t2FdMa+krAFDKDhnMeRiK/i1vo/8qAaOdGxowOoUcnetRObBZtSHLEMY1B97wahIUUT1y07RAWxFKbtDENG7KxZGp3m4X6Fz20AX0iju6/8dPgzeuHAjQ== ura2178@gmail.com
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmjcb3l0tvh8l1pqgq6"
        disk_id     = "fhmjcb3l0tvh8l1pqgq6"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8kdq6d0p8sij7h5qe3"
            size       = 5
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.14"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:16:e7:de:c1"
        nat                = true
        nat_ip_address     = "62.84.124.32"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9br23rkpq9dip3p7mlv"
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

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2023-02-14T04:04:54Z"
    folder_id  = "b1gpoeve0qjq1amh801g"
    id         = "enptf4icj1sli3paa88b"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9br23rkpq9dip3p7mlv",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-02-14T04:04:55Z"
    folder_id      = "b1gpoeve0qjq1amh801g"
    id             = "e9br23rkpq9dip3p7mlv"
    labels         = {}
    name           = "subnet1"
    network_id     = "enptf4icj1sli3paa88b"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "62.84.124.32"
internal_ip_address_vm_1 = "192.168.10.14"
```
</details>

2. terraform state list

```plain
yandex_compute_instance.vm-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

4. terraform output
```plain
external_ip_address_vm_1 = "62.84.124.32"
internal_ip_address_vm_1 = "192.168.10.14"
```
