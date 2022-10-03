terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = var.zone
}

resource "yandex_vpc_address" "addr" {
  name = "addr"

  external_ipv4_address {
    zone_id = var.zone
  }
}

data "yandex_compute_image" "ubuntu-2204-lts" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "default" {
  name        = var.vm_name
  platform_id = "standard-v1"
  zone        = var.zone

  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id  = data.yandex_compute_image.ubuntu-2204-lts.image_id
      size      = 20
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.subnet.id
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
    nat            = true
  }

  hostname = var.hostname

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file("~/.ssh/yc.pub")}"
  }
}

resource "yandex_vpc_network" "default" {}

resource "yandex_vpc_subnet" "subnet" {
  zone           = var.zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.128.0.0/24"]
}