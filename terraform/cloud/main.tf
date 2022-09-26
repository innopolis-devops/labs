terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.zone
  token = "y0_AgAAAAAkGtfwAATuwQAAAADP4AF6xLnZsWUhRg2CAC1f_lu4vnwJyjA"
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
  folder_id = "b1g1rkhclgip74ttms9j"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "AAAAB3NzaC1yc2EAAAADAQABAAABAQDZr6wEDvl6A6xFcU6Nq8ITSBBW+cQW8igm360YaPALrzShyp35DeKNDqCD8J7SMKvEYXgbsTy7K11uVBSLb0r3KZHze1LM9NRqGy5iY+O1yaWCsXe2f3r/Vne4SsqAEKdWURuknAn6uRqEOtLWSfZdLKXgg1D8+W+XApUI6HlcCKKPRhQgH1hTNKwZI5gIBqW2XeLFby3KbBgMd/6fLRgB2VTg0iHUD6dAHkfOj3EKpfCOi58OFr+5hZJ+E4WHFmQb71VpBKihzy34C/sBJct3uhpeKS4ATh5VbDS3OkL0hJSdTv+QgrWAlo6jVROvfdryH2kIxbML+90Naa5J0FCT alex@DESKTOP-PQBNF98"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "terraform2"
  folder_id = "b1g1rkhclgip74ttms9j"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "AAAAB3NzaC1yc2EAAAADAQABAAABAQDZr6wEDvl6A6xFcU6Nq8ITSBBW+cQW8igm360YaPALrzShyp35DeKNDqCD8J7SMKvEYXgbsTy7K11uVBSLb0r3KZHze1LM9NRqGy5iY+O1yaWCsXe2f3r/Vne4SsqAEKdWURuknAn6uRqEOtLWSfZdLKXgg1D8+W+XApUI6HlcCKKPRhQgH1hTNKwZI5gIBqW2XeLFby3KbBgMd/6fLRgB2VTg0iHUD6dAHkfOj3EKpfCOi58OFr+5hZJ+E4WHFmQb71VpBKihzy34C/sBJct3uhpeKS4ATh5VbDS3OkL0hJSdTv+QgrWAlo6jVROvfdryH2kIxbML+90Naa5J0FCT alex@DESKTOP-PQBNF98"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
  folder_id = "b1g1rkhclgip74ttms9j"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  folder_id = "b1g1rkhclgip74ttms9j"
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}


output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}