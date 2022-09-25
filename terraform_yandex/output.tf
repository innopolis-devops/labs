output "instance_id" {
  description = "ID of the instance"
  value       =  yandex_compute_instance.vm-1.id
}

output "network_id" {
  description = "ID of the network"
  value       = yandex_vpc_network.anetwork.id
}