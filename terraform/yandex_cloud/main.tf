terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token       = "t1.9euelZrKlpibmMnJmYnMi5yOlMeMl-3rnpWalJqdjZXNyYvLyJCPmo7Pm5fl8_cibkJm-e8CFXN4_t3z92IcQGb57wIVc3j-.SypgbXjVwx4lem_D6DD87n9Obf7rKw2rPAjbajIVusSklGNKfd-FGv8Lj55jdY3YKYqFCvPgeekbyLf5atLfCQ"
  cloud_id    = "b1gmkusdq3ib3nhlvm81"
  folder_id   = "b1gvt2gqnaa14cpibnrp"
}

resource "yandex_compute_instance" "default" {
  name                      = var.vm_name
  platform_id               = "standard-v1"
  zone                      = "default-ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8le2jsge1bop4m18ts"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.foo.id
    nat         = true
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone              = "default-ru-central1-b"
  network_id        = yandex_vpc_network.foo.id
  v4_cidr_blocks    = ["192.168.0.0/16"]
}