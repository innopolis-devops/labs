output "external_ip" {
  description = "External IP of the VM"
  value       = yandex_compute_instance.vm.network_interface["0"].nat_ip_address
}
