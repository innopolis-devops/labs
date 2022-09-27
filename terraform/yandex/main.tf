terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone  = var.zone
  token = var.token
  folder_id = var.folder_id
}

resource "yandex_compute_instance" "default-vm" {
  name        = var.name
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8lbi4hr72am1eb2kmf"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default-vpc-subnet.id
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yc.pub")}"
  }
}

resource "yandex_vpc_network" "default-vpc" {}

resource "yandex_vpc_subnet" "default-vpc-subnet" {
  zone       = var.zone
  network_id = yandex_vpc_network.default-vpc.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}
