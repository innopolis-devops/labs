output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.app-server.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.app-server.network_interface.0.nat_ip_address
}
