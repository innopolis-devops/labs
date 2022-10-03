terraform {
  required_providers {
    yandex = {
      source  = "local/providers/yandex"
      version = "1.0.0"
    }
  }
}

provider "yandex" {}

resource "yandex_vpc_network" "box_net" {
  name = var.box_net
}

resource "yandex_vpc_subnet" "box_subnet" {
  network_id     = yandex_vpc_network.box_net.id
  v4_cidr_blocks = ["10.10.10.0/24"]
  name           = var.box_subnet
}

resource "yandex_compute_instance" "box" {
  name        = var.box_name
  platform_id = "standard-v3"
  hostname    = var.hostname

  resources {
    core_fraction = var.vm_system_config.core_fraction
    cores         = var.vm_system_config.cores
    memory        = var.vm_system_config.memory
  }

  boot_disk {
    initialize_params {
      type     = "network-ssd"
      size     = var.vm_system_config.ssd_size
      image_id = var.vm_system_config.image_id
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.box_subnet.id
    ip_address = var.box_ip
    nat        = true
  }

  metadata = {
    user-data = "${file("box.yml")}"
  }

  provisioner "remote-exec" {
    inline = ["# VM is ready!"]
    connection {
      type        = "ssh"
      host        = self.network_interface.0.nat_ip_address
      user        = var.vm_user
      private_key = file("~/.ssh/yandex_key")
    }
  }
  provisioner "local-exec" {
    working_dir = "../../ansible"
    environment = {
        ANSIBLE_HOST_KEY_CHECKING = "False"
    }
    command = "ansible-playbook -u '${var.vm_user}' -i '${self.network_interface.0.nat_ip_address},' --private-key=~/.ssh/yandex_key playbooks/dev/main.yml"
  }
}
