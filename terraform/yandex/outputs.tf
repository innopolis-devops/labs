output "box_ip" {
  description = "VM ip"
  value       = yandex_compute_instance.box.network_interface[0].nat_ip_address
}
