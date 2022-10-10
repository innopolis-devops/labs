terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone      = var.zone
}

resource "yandex_compute_instance" "vm" {
   name = var.instance_name
   allow_stopping_for_update = true

   resources {
     cores  = var.cores
     memory = var.memory
   }

   boot_disk {
     initialize_params {
       image_id = var.instance_image_id
       size = 10
     }
   }

   network_interface {
     subnet_id = yandex_vpc_subnet.subnet.id
     nat       = true
   }

   metadata = {
     ssh-keys = "ubuntu:${file("~/.ssh/id_rsa_yc.pub")}"
   }
 }

 resource "yandex_vpc_network" "network" {
   name = "network1"
 }

 resource "yandex_vpc_subnet" "subnet" {
   name           = "subnet"
   zone           = "ru-central1-a"
   network_id     = yandex_vpc_network.network.id
   v4_cidr_blocks = ["192.168.10.0/24"]
 }
