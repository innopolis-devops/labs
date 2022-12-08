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
  token = "y0_AgAAAAAbUVAxAATuwQAAAADWM78MDUnYqGyrTcK_sT_3TR0LZPU30Po"
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
  folder_id = "b1gs6083oeefifj5f1gi"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "AAAAC3NzaC1lZDI1NTE5AAAAIHRdSFvRdINDTMkNSEpbs+EInCXiUaQ8BgAJxr7bwBoi user@DESKTOP-L4BD1JV"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
  folder_id = "b1gs6083oeefifj5f1gi"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  folder_id = "b1gs6083oeefifj5f1gi"
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}