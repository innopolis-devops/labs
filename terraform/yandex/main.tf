terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.80.0"
    }
  }
}

// Configured using environment variables
provider "yandex" {
  zone = var.zone
}

resource "yandex_vpc_network" "network-1" {
  name = var.network
}

resource "yandex_vpc_subnet" "default" {
  network_id     = yandex_vpc_network.network-1.id
  name           = var.subnet
  v4_cidr_blocks = var.subnet_v4_cidr_blocks
  zone           = var.zone
}

data "yandex_compute_image" "default" {
  family = var.image_family
}

resource "yandex_compute_instance" "default" {
  name     = var.name
  hostname = var.name
  zone     = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.default.image_id
      size     = var.disk_size
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = var.nat
  }

  metadata = {
    ssh-keys = "${file("C:/Users/blizz/.ssh/id_ed25519.pub")}"
  }

  timeouts {
    create = var.timeout_create
    delete = var.timeout_delete
  }
}