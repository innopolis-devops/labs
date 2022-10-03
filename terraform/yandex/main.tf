terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.79.0"
    }
  }
  required_version = ">= 0.12"
}

provider "yandex" {
  service_account_key_file = "./key.json"
  cloud_id                 = "b1gfmt8o8elfvje6bj11"
  folder_id                = "b1gt3sretmu231pp6srq"
  zone                     = "ru-central1-a"
}

resource "yandex_compute_instance" "vm" {

  name        = var.vm_name
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd8c00efhiopj3rlnlbn"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork.id
    nat       = true
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

}

resource "yandex_vpc_network" "newtwork" {

}

resource "yandex_vpc_subnet" "subnetwork" {
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["192.168.0.0/16"]
  network_id     = yandex_vpc_network.newtwork.id
}
