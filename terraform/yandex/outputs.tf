output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.default-vm.network_interface.0.ip_address
}
