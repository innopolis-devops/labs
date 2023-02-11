## what i did

just follow [guide](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-provider)

a few words to say: this was hell

geralizz@DESKTOP-QGAMLUK:~/labs_devops/app_python/terraform/yandex_cloud$ terraform show
.# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2023-02-11T19:39:38Z"
    folder_id                 = "b1giea309ku46m6d3lhl"
    fqdn                      = "fhmd2e0js0pkouo3l1ie.auto.internal"
    id                        = "fhmd2e0js0pkouo3l1ie"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOtwSjNpSqXyjtbWwrCBRzISzJB1yjl4KcFl9Q3fpGSZ geralizz@DESKTOP-QGAMLUK
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmaisjh49g9p6aljm44"
        disk_id     = "fhmaisjh49g9p6aljm44"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8emvfmfoaordspe1jr"
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
        ip_address         = "192.168.10.28"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:d1:38:13:e0"
        nat                = true
        nat_ip_address     = "51.250.85.185"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bvhf8frgfilpu6lsc9"
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

.# yandex_compute_instance.vm-2:
resource "yandex_compute_instance" "vm-2" {
    created_at                = "2023-02-11T19:39:38Z"
    folder_id                 = "b1giea309ku46m6d3lhl"
    fqdn                      = "fhm7f2h9ijv424eig01m.auto.internal"
    id                        = "fhm7f2h9ijv424eig01m"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOtwSjNpSqXyjtbWwrCBRzISzJB1yjl4KcFl9Q3fpGSZ geralizz@DESKTOP-QGAMLUK
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm7o85bau98b73mh1fl"
        disk_id     = "fhm7o85bau98b73mh1fl"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8emvfmfoaordspe1jr"
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
        ip_address         = "192.168.10.4"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:77:8a:29:94"
        nat                = true
        nat_ip_address     = "51.250.15.69"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bvhf8frgfilpu6lsc9"
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

.# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2023-02-11T19:39:35Z"
    folder_id  = "b1giea309ku46m6d3lhl"
    id         = "enp4nn1g98e4ojebj6ni"
    labels     = {}
    name       = "network1"
    subnet_ids = []
}

.# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-02-11T19:39:36Z"
    folder_id      = "b1giea309ku46m6d3lhl"
    id             = "e9bvhf8frgfilpu6lsc9"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp4nn1g98e4ojebj6ni"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}

geralizz@DESKTOP-QGAMLUK:~/labs_devops/app_python/terraform/yandex_cloud$ terraform output
external_ip_address_vm_1 = "51.250.85.185"
external_ip_address_vm_2 = "51.250.15.69"
internal_ip_address_vm_1 = "192.168.10.28"
internal_ip_address_vm_2 = "192.168.10.4"