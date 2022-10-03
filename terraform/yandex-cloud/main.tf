terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.zone
}

resource "yandex_vpc_network" "net-1" {
  name = "net1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = var.zone
  network_id     = yandex_vpc_network.net-1.id
  v4_cidr_blocks = ["192.168.1.0/24"]
}

resource "yandex_compute_instance" "app-server" {
  name                      = "app-server"
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = "ubuntu:${file(var.app_server_ssh_key)}"
  }

  resources {
    cores  = var.app_server_cores
    memory = var.app_server_mem
  }

  boot_disk {
    initialize_params {
      image_id = var.app_server_image_id
      size     = var.app_server_image_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
}
