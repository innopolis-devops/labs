# Terraform

## Best Practices

1. Using Terraform-specific .gitignore
2. Hiding credentials in the environmental variables
3. Getting rid of hard-coded values via input variables
4. Defining output variables
5. Formatting the configuration via `terraform fmt` and `terraform validate`

## Containers

There are **Docker** and **YandexCloud** configurations

## Docker

Output of the `terraform show` command

```text
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
    hostname          = "7250d8a63385"
    id                = "7250d8a633850c1c597fc5f6351b66eb37e7e82c9b81179b4fdbf6935af989e5"
    image             = "sha256:8a5e3e44915c98a8063d87f2b18d79ab86b80eae45df2e2cde4e32298b89e7b9"
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
    id           = "sha256:8a5e3e44915c98a8063d87f2b18d79ab86b80eae45df2e2cde4e32298b89e7b9nginx:latest"
    keep_locally = false
    latest       = "sha256:8a5e3e44915c98a8063d87f2b18d79ab86b80eae45df2e2cde4e32298b89e7b9"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:6650513efd1d27c1f8a5351cbd33edf85cc7e0d9d0fcb4ffb23d8fa89b601ba8"
}
```

Output of the `terraform state list` command

```text
docker_container.nginx
docker_image.nginx
```

### Changing Port

I have changed the external port from `8000` to `8080`

After running `terraform apply`:

```text
~ ports {
  ~ external = 8000 -> 8080 # forces replacement
    # (3 unchanged attributes hidden)
}
```

Now, the resource is accessible at http://0.0.0.0:8080/

### Defining Input Variables

I have created the `variables.tf` file, and changed the name to `name  = var.container_name` in the nginx resource configuration

After running `terraform apply`:

```text
~ name              = "tutorial" -> "Tutorial" # forces replacement
```

### Defining Output Variables

I have created the `outputs.tf` file that comprises the `container_id` and `image_id` output variables

After running `terraform apply`:

```text
Changes to Outputs:
  + container_id = "e8a5d7d7368a1ec268b16b0babe2cd3e9be8f236bcb8f9db016e03eae0a5d038"
  + image_id     = "sha256:8a5e3e44915c98a8063d87f2b18d79ab86b80eae45df2e2cde4e32298b89e7b9nginx:latest"
```

After running `terraform output`:

```text
container_id = "e8a5d7d7368a1ec268b16b0babe2cd3e9be8f236bcb8f9db016e03eae0a5d038"
image_id = "sha256:8a5e3e44915c98a8063d87f2b18d79ab86b80eae45df2e2cde4e32298b89e7b9nginx:latest"
```

## Yandex.Cloud

Output of the `terraform state show yandex_compute_instance.vm` command

```text
# yandex_compute_instance.vm will be created
  + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIu3/u1lvdfClcTOXsyCF0I/ZMKz+gxqivuTRGpsMLD+ k05m0navt@k05m0navts-MacBook-Air.local
            EOT
        }
      + name                      = "devops"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8hjvnsltkcdeqjom1n"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options {
          + aws_v1_http_endpoint = (known after apply)
          + aws_v1_http_token    = (known after apply)
          + gce_http_endpoint    = (known after apply)
          + gce_http_token       = (known after apply)
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.network will be created
  + resource "yandex_vpc_network" "network" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "network1"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.subnet will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.10.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }
```

Output of the `terraform state list` command

```text
yandex_compute_instance.vm
yandex_vpc_network.network
yandex_vpc_subnet.subnet
```

### Defining Input Variables

I have created the `variables.tf` file, and moved there a couple of configurations. Namely, instance name, id, and default provider zone

After running `terraform apply`:

```text
No changes. Your infrastructure matches the configuration.
```

No changes because there is in fact no difference between the hardcoded values and the ones in the `variables.tf`. Still, the values from the file are used

### Defining Output Variables

I have created the `outputs.tf` file that comprises the `internal_ip_address_vm` and `external_ip_address_vm` output variables

After running `terraform apply`:

```text
No changes. Your infrastructure matches the configuration.
```

No changes because I just moved them from the `main.tf` file

After running `terraform output`:

```text
external_ip_address_vm = "158.160.58.53"
internal_ip_address_vm = "192.168.10.13"
```
