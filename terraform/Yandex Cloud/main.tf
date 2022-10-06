terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  # Don't forget to set YC_TOKEN var for authentication
  zone = "ru-central1-a"
}

resource "yandex_vpc_network" "default" {
  name = "msc_time-network"
}

resource "yandex_vpc_subnet" "default" {
  network_id = yandex_vpc_network.default.id
  name = "msc_tim-subnetwork"
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "msc_time-vm" {
  resources {
    cores = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8kdq6d0p8sij7h5qe3" # Default Ubuntu 20.04 Free image
      size = 10
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat = true
  }

  metadata = {
    #ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    ssh-keys = "ubuntu:${file("//wsl$/Ubuntu-20.04/home/andrew/.ssh/id_rsa.pub")}"
  }
}