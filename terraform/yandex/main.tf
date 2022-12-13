terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "t1.9euelZqRy46Kls2ZipiLx5jNlMiRlO3rnpWazJfOzJzJkciRzZuTz4-XnIvl8_cKaz1j-e9MUQ0m_t3z90oZO2P570xRDSb-.Iu7RKuGie-6Vav8G7-ZSPy6Sb4RDm5Ol9TCvkyi7pjMPrA75vETllS-3cSkxro9mT2yKNWLxE-6esqlx1uTpAQ"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "vm-1" {
  name = var.vm_name

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}

resource "yandex_vpc_network" "network-1" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

