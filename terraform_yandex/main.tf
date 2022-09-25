terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-b"
}

resource "yandex_compute_instance" "vm-1" {
  name = var.resource_name
  allow_stopping_for_update = true

  resources {
    cores = 2
    memory = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ingbofbh3j5h7i8ll"
      size = 5
    }
  }
  
  network_interface {
    subnet_id = "${yandex_vpc_subnet.asubnet.id}"
  }
}

resource "yandex_vpc_network" "anetwork" {}

resource "yandex_vpc_subnet" "asubnet" {
  zone       = "ru-central1-b"
  network_id = "${yandex_vpc_network.anetwork.id}"
  v4_cidr_blocks = ["10.0.0.0/22"]
}