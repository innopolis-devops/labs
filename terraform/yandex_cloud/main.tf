terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.80.0"
    }
  }
}

// All the config done with environment variables, as suggested in
// https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs
provider "yandex" {}

// First VM
resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
  zone = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80jdh4pvsj48qftb3d"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./users/vm1.yml")}"
  }
}

// Second VM
resource "yandex_compute_instance" "vm-2" {
  name                      = "terraform2"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80jdh4pvsj48qftb3d"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./users/vm2.yml")}"
  }
}

// Network
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

// Subnet of the network
resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
