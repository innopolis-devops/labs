# Terraform

## Docker
Command outputs:
- [`terraform show`](https://pastebin.com/y12r0PDA) (click to see at pastebin.com)
- ```
  $terraform state list
  docker_container.python_app
  docker_image.devops-pythonapp
  ```
- [`terraform plan`](https://pastebin.com/4rSRTgbw) (click) after the following changes:
  - change the image tag from `latest` to `1.0`
  - change external port from 80 to 8000
  - change container name
- ```
  $terraform output
  container_id = "2404111f9ca4593d45918e186910b3ec54b0ef61fa667afeda5884a44176d648"
  image_id = "sha256:df6be276cf046b32ae4f9942457bca68d2beb0ad49e0ba849844bfa7e57eb01fe2xen/devops-pythonapp:1.0"
  ```
  
## Yandex Cloud
The configuration was taken from Yandex Cloud official [Terraform guide](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart).
Command outputs:
- [`terraform show`](https://pastebin.com/t81aSnXh) (click to see at pastebin.com)
- ```
  $terraform state list
  yandex_compute_instance.vm-1
  yandex_compute_instance.vm-2
  yandex_vpc_network.network-1
  yandex_vpc_subnet.subnet-1
  ```
- [`terraform plan`](https://pastebin.com/hfTCamhL) (click) after the following changes:
  - change OS of the second VM from Ubuntu to Debian
- ```
  $terraform output
  external_ip_address_vm_1 = "51.250.29.173"
  external_ip_address_vm_2 = "51.250.18.166"
  internal_ip_address_vm_1 = "192.168.10.29"
  internal_ip_address_vm_2 = "192.168.10.23"
  ```
  
## Best practices
1. Variables and outputs are declared is separate files (`variables.tf` and `outputs.tf` respectively
2. `.tfstate` files are uploaded to VCS so that anyone authorized can manage the infrastructure from the right state
3. Secrets are injected through env or input variables
4. `terraform fmt` is applied to each configuration
