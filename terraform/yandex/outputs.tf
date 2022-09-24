output "ip_address" {
  description = "Private IP address of the VM instance"
  value       = yandex_compute_instance.default.network_interface.0.ip_address
}

