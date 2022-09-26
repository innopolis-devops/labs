output "internal_ip_address_vm_1" {
  description = "Internal IP address of virtual machine"
  value       = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  description = "External IP address of virtual machine"
  value       = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}