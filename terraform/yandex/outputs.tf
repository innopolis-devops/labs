output "yandex_external_ip" {
  value = yandex_compute_instance.vm.network_interface["0"].nat_ip_address
}
