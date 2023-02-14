terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone                     = "ru-central1-a"
  service_account_key_file = "key.tfvars.json"
}

resource "yandex_compute_instance" "vm-1" {
  folder_id                 = "b1gpoeve0qjq1amh801g"
  name                      = "terraform1"
  allow_stopping_for_update = true

  resources {
    cores  = var.vm_cores
    memory = var.vm_mem
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_os_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.pub_key_location)}"
  }
}

resource "yandex_vpc_network" "network-1" {
  folder_id = "b1gpoeve0qjq1amh801g"
  name      = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  folder_id      = "b1gpoeve0qjq1amh801g"
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}