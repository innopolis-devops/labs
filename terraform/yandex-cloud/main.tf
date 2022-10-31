terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  zone                     = "ru-central1-a"
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name       = "subnet1"
  network_id = yandex_vpc_network.network-1.id
  v4_cidr_blocks = [
    "192.168.10.0/24"
  ]
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  boot_disk {
    initialize_params {
      image_id = "fd8ingbofbh3j5h7i8ll"
    }
  }
  folder_id = "b1gts78appf1ipshtfmb"
  metadata = {
    user-data = file("./meta")
  }
  name = "${var.new-vm-name}-1"
  network_interface {
    nat       = true
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }
  resources {
    cores  = 2
    memory = 2
  }
}

resource "yandex_compute_instance" "vm-2" {
  boot_disk {
    initialize_params {
      image_id = "fd8ingbofbh3j5h7i8ll"
    }
  }
  folder_id = "b1gts78appf1ipshtfmb"
  metadata = {
    user-data = file("./meta")
  }
  name = "${var.new-vm-name}-2"
  network_interface {
    nat       = true
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }
  resources {
    cores  = 4
    memory = 4
  }
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}