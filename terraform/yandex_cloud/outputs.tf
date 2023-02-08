output "cores_number" {
  description = "Number of cores in VM"
  value       = yandex_compute_instance.default.resources[0].cores
}

output "vm_mem" {
  description = "VM memory"
  value       = yandex_compute_instance.default.resources[0].memory
}