terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "ilya-vm" {
  name        = var.vm_name
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      // got it by "yc compute image list --folder-id standard-images"
      image_id = "fd8lbi4hr72am1eb2kmf" // ubuntu-20-04-lts-v20211027
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.ilya-vpc-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "ilya-vpc" {}

resource "yandex_vpc_subnet" "ilya-vpc-subnet" {
  zone       = "ru-central1-a"
  network_id = yandex_vpc_network.ilya-vpc.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}

output "vm-id" {
  description = "ID of the Virtual machine"
  value       = yandex_compute_instance.ilya-vm.id
}