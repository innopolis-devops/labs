# Yandex Cloud Terraform
## Create VM through [yandex documentation](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart) and `terraform show` result
~~~
$ terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T23:08:39Z"
    folder_id                 = "b1g1rkhclgip74ttms9j"
    fqdn                      = "fhmqtt8pv93t61thl0ej.auto.internal"
    id                        = "fhmqtt8pv93t61thl0ej"
    labels                    = {}
    metadata                  = {
        "ssh-keys" = "AAAAB3NzaC1yc2EAAAADAQABAAABAQDZr6wEDvl6A6xFcU6Nq8ITSBBW+cQW8igm360YaPALrzShyp35DeKNDqCD8J7SMKvEYXgbsTy7K11uVBSLb0r3KZHze1LM9NRqGy5iY+O1yaWCsXe2f3r/Vne4SsqAEKdWURuknAn6uRqEOtLWSfZdLKXgg1D8+W+XApUI6HlcCKKPRhQgH1hTNKwZI5gIBqW2XeLFby3KbBgMd/6fLRgB2VTg0iHUD6dAHkfOj3EKpfCOi58OFr+5hZJ+E4WHFmQb71VpBKihzy34C/sBJct3uhpeKS4ATh5VbDS3OkL0hJSdTv+QgrWAlo6jVROvfdryH2kIxbML+90Naa5J0FCT alex@DESKTOP-PQBNF98"
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmuhdpcutoeh0tv66qb"
        disk_id     = "fhmuhdpcutoeh0tv66qb"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd80d7fnvf399b1c207j"
            size       = 30
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.13"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1a:ef:51:9f"
        nat                = true
        nat_ip_address     = "51.250.13.246"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b0ehmkffbi1amt2apv"
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

# yandex_compute_instance.vm-2:
resource "yandex_compute_instance" "vm-2" {
    created_at                = "2022-09-26T23:10:14Z"
    folder_id                 = "b1g1rkhclgip74ttms9j"
    fqdn                      = "fhmr9ijacpbkdnsibvn5.auto.internal"
    id                        = "fhmr9ijacpbkdnsibvn5"
    metadata                  = {
        "ssh-keys" = "AAAAB3NzaC1yc2EAAAADAQABAAABAQDZr6wEDvl6A6xFcU6Nq8ITSBBW+cQW8igm360YaPALrzShyp35DeKNDqCD8J7SMKvEYXgbsTy7K11uVBSLb0r3KZHze1LM9NRqGy5iY+O1yaWCsXe2f3r/Vne4SsqAEKdWURuknAn6uRqEOtLWSfZdLKXgg1D8+W+XApUI6HlcCKKPRhQgH1hTNKwZI5gIBqW2XeLFby3KbBgMd/6fLRgB2VTg0iHUD6dAHkfOj3EKpfCOi58OFr+5hZJ+E4WHFmQb71VpBKihzy34C/sBJct3uhpeKS4ATh5VbDS3OkL0hJSdTv+QgrWAlo6jVROvfdryH2kIxbML+90Naa5J0FCT alex@DESKTOP-PQBNF98"
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmo60ove3jn0ro1d0tq"
        disk_id     = "fhmo60ove3jn0ro1d0tq"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd80d7fnvf399b1c207j"
            size       = 30
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.29"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1b:4c:a6:a6"
        nat                = true
        nat_ip_address     = "51.250.82.213"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b0ehmkffbi1amt2apv"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 4
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-26T23:05:37Z"
    folder_id  = "b1g1rkhclgip74ttms9j"
    id         = "enp2vkc9la71admu33fe"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9b0ehmkffbi1amt2apv",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T23:06:39Z"
    folder_id      = "b1g1rkhclgip74ttms9j"
    id             = "e9b0ehmkffbi1amt2apv"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp2vkc9la71admu33fe"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "51.250.13.246"
external_ip_address_vm_2 = "51.250.82.213"
internal_ip_address_vm_1 = "192.168.10.13"
internal_ip_address_vm_2 = "192.168.10.29"
~~~
## `terraform state list` result:
~~~
$ terraform state list
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
~~~
## `terraform output` result:
~~~
$ terraform output
external_ip_address_vm_1 = "51.250.13.246"
external_ip_address_vm_2 = "51.250.82.213"
internal_ip_address_vm_1 = "192.168.10.13"
internal_ip_address_vm_2 = "192.168.10.29"
~~~