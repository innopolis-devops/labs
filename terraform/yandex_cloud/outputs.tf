output "cores_number" {
  description = "Number of cores in Virtual machine"
  value       = yandex_compute_instance.default.resources[0].cores
}

output "memory_amount" {
  description = "Amount of memory in Virtual machine"
  value       = yandex_compute_instance.default.resources[0].memory
}

output "external_ip_address" {
  description = "External IP address of Virtual machine"
  value       = yandex_compute_instance.default.network_interface["0"].nat_ip_address
}