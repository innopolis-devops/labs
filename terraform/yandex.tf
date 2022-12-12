variable "name" {
  type = string
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  cloud_id  = "b1g59mfb3sltd80s63ql"
  folder_id = "b1gqb6lmjq2k4erbuovs"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "net" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet1"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "vm-1" {
  name                      = var.name
  platform_id               = "standard-v3"
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = "network-ssd"
      size     = 32
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "user:ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhBKV2kaLiZavXXPyqbz2lTePDibtgkXHwR550/mJXCsNyDt+n5L8FXhlTskYxcWrmYPjg3vzw+EZg076O51m86nijMuNY6fhoSeRK/K1P+CMXXtoV8SLxBQpdvC2yh3305nQ1RaKAaolzBWMqPSrnJvnu1nmg7kTwiKOoRajzutBhv0N/04TuoQ/bAehiFT4rRB6CTq/kkBWrUJr4CoOCYBloFBrUAVITrm5CyVTAPzvlA2B4HVTlfi6UIKfLLldN83jz6gYjcSGgMcyI1iUDpsl8vb9tq7yvx331iPzU7yl/fDE87b0lyl+u6wh+xaUDeUnqY2BP3iHhqVmLJ457Q== rsa-key-20181104"
  }
}

output "external_ip" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}