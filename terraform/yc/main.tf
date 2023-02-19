terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  service_account_key_file = "../../authorized_key.json"
  cloud_id = "b1gt2chrehuc9i3e7pi9"
  folder_id = "b1gtcfr2s8rhpphfmpc4"
  zone = "ru-central1-a"
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name = "subnet1"
  network_id = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

resource "yandex_compute_instance" "instance-1" {
  name = "instance1"
  zone = "ru-central1-a"
  resources {
    cores = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd8id3ghkbp201h40o60"
      size = 50
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }
}