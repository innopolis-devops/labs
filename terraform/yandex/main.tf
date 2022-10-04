terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

#credentials are in env variables
provider "yandex" {
  zone = var.zone
}
#two VMs + network just ate all my limits on yandex cloud, we are poor now and paying real money. so only one vm now
resource "yandex_compute_instance" "vm-1" {
  name = "test"

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
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_vpc_network" "network-new" {
  name = "networknew"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-new.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
