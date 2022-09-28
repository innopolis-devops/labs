terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.79.0"
    }
  }
  required_version = ">= 0.12"
}

// Configure the Yandex.Cloud provider
provider "yandex" {
  service_account_key_file = "./key.json"
  cloud_id                 = "b1gbfghau8dammrpi7jb"
  folder_id                = "b1g3qa4odm76kbnv2t4p"
  zone                     = "ru-central1-a"
}

// Create a new instance
resource "yandex_compute_instance" "vm" {
  name        = var.instance_name
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      # Ubuntu 22.04 LTS
      image_id = "fd8c00efhiopj3rlnlbn"
      size = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.foo.id
    nat       = true
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["192.168.0.0/16"]
  network_id     = yandex_vpc_network.foo.id
}

