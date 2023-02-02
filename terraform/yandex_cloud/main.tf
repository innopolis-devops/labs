terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAAAPYoS_AATuwQAAAADP5ZUpSN8ng6maSNW_s6fwjXyhMXGom_0"
  cloud_id  = "b1gpgqa24hrr046couim"
  folder_id = "b1gq3c0k1g76vg1in04r"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "default" {
  name                      = var.vm_name
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8emvfmfoaordspe1jr"
    }
  }

network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
}

  metadata = {
    foo      = "bar"
    ssh-keys = "~/.ssh/id_tw.pub"
  }
}

resource "yandex_vpc_network" "network-1" {
name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
name           = "subnet1"
zone           = "ru-central1-a"
network_id     = yandex_vpc_network.network-1.id
v4_cidr_blocks = ["192.168.10.0/24"]
}