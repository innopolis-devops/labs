## Best Practices

1. Using Terraform-specific .gitignore
2. Hiding credentials in the environmental variables
3. Getting rid of hard-coded values via input variables
4. Defining output variables
5. Formatting the configuration via `terraform fmt` and `terraform validate`
6. Prompting sensitive variables instead of storing them


## Containers
There are **Docker** and **Yandex.Cloud** configurations

## Docker

Output of the `terraform state show docker_container.nginx` command

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
    hostname          = "cedf33855a87"
    id                = "cedf33855a879eba0ae272892b9cd911826d901580f4523177bc5886d76d6df5"
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
~ name = "tutorial" -> "ExampleNginxContainer" # forces replacement
```

### Defining Output Variables
I have created the `outputs.tf` file that comprises the `container_id` and `image_id` output variables

After running `terraform apply`:
```text
Changes to Outputs:
  + container_id = "a599d224d15f34a26ef175a89cb66e4a0d2d2f3cbc17a4e4be68fdfe18c2412e"
  + image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

After running `terraform output`:
```text
container_id = "a599d224d15f34a26ef175a89cb66e4a0d2d2f3cbc17a4e4be68fdfe18c2412e"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

## Yandex.Cloud

Output of the `terraform state show yandex_compute_instance.vm` command

```text
# yandex_compute_instance.vm:
resource "yandex_compute_instance" "vm" {
    created_at                = "2022-09-25T14:59:26Z"
    folder_id                 = "b1g181ht4hj65h9qf9d7"
    fqdn                      = "fhmhakam128v0cf2ckdr.auto.internal"
    id                        = "fhmhakam128v0cf2ckdr"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa %/ my public ssh-key /% kurmazov@MacBook-Pro-Aleksandr.local
        EOT
    }
    name                      = "terraform"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmc5jfke2ggqn72c7rr"
        disk_id     = "fhmc5jfke2ggqn72c7rr"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8hjvnsltkcdeqjom1n"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.14"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:11:55:15:60"
        nat                = true
        nat_ip_address     = "51.250.13.168"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b1h692q1nob45mubo7"
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
```

Output of the `terraform state list` command

```text
yandex_compute_instance.vm
yandex_vpc_network.network
yandex_vpc_subnet.subnet
```

### Changing the number of cores
I have changed the number of cores and memory GB from `2` to `4`

After running `terraform apply`:
```text
~ resource "yandex_compute_instance" "vm" {
    id                        = "fhmhakam128v0cf2ckdr"
    name                      = "terraform"
    # (9 unchanged attributes hidden)

  ~ resources {
      ~ cores         = 2 -> 4
      ~ memory        = 2 -> 4
        # (2 unchanged attributes hidden)
    }

    # (4 unchanged blocks hidden)
}
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
external_ip_address_vm = "178.154.205.176"
internal_ip_address_vm = "192.168.10.25"
```
