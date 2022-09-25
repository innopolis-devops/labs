# Terraform for Yandex cloud
## Outputs
### `terraform show`
```
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-25T17:19:09Z"
    folder_id                 = "b1gg24sfngs7756vertu"
    fqdn                      = "epd3nflk4gqifp7evi09.auto.internal"
    id                        = "epd3nflk4gqifp7evi09"
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epdc90tunlk0mmqqa1b5"
        disk_id     = "epdc90tunlk0mmqqa1b5"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8ingbofbh3j5h7i8ll"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "10.0.0.12"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:3b:be:b4:24"
        nat                = false
        security_group_ids = []
        subnet_id          = "e2lquv8vs1cu6rc459va"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 5
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.anetwork:
resource "yandex_vpc_network" "anetwork" {
    created_at = "2022-09-25T17:18:42Z"
    folder_id  = "b1gg24sfngs7756vertu"
    id         = "enpvlh31firnherqoank"
    labels     = {}
    subnet_ids = [
        "e2lquv8vs1cu6rc459va",
    ]
}

# yandex_vpc_subnet.asubnet:
resource "yandex_vpc_subnet" "asubnet" {
    created_at     = "2022-09-25T17:18:43Z"
    folder_id      = "b1gg24sfngs7756vertu"
    id             = "e2lquv8vs1cu6rc459va"
    labels         = {}
    network_id     = "enpvlh31firnherqoank"
    v4_cidr_blocks = [
        "10.0.0.0/22",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}
```
### `terraform state list`
```
yandex_compute_instance.vm-1
yandex_vpc_network.anetwork
yandex_vpc_subnet.asubnet
```
### changed infrastructure and ran `terraform apply`
```
yandex_vpc_network.anetwork: Refreshing state... [id=enpvlh31firnherqoank]
yandex_vpc_subnet.asubnet: Refreshing state... [id=e2lquv8vs1cu6rc459va]
yandex_compute_instance.vm-1: Refreshing state... [id=epd3nflk4gqifp7evi09]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-1" {
        id                        = "epd3nflk4gqifp7evi09"
        name                      = "terraform1"
        # (10 unchanged attributes hidden)

      ~ resources {
          ~ memory        = 1 -> 2
            # (3 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
``` 
### I added `variables.tf` file so that I can specify resource name using `-var="resource_name=yourResourceName"` 
### `terraform output`
```
instance_id = "epd3nflk4gqifp7evi09"
network_id = "enpvlh31firnherqoank"
```