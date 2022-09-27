
# Terraform
## Terraform tutorial part
 ### `terraform show` output:
 ```
 # docker_container.nginx:

resource "docker_container" "nginx" {

attach  = false

command = [

"nginx",

"-g",

"daemon off;",

]

cpu_shares  = 0

entrypoint  = [

"/docker-entrypoint.sh",

]

env = []

gateway = "172.17.0.1"

hostname  = "894f006cc3db"

id  = "894f006cc3db62c72aec335993e88a6aa8acdf89c4f5814c8a993d6e18555f8e"

image = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"

init  = false

ip_address  = "172.17.0.4"

ip_prefix_length  = 16

ipc_mode  = "private"

log_driver  = "json-file"

logs  = false

max_retry_count = 0

memory  = 0

memory_swap = 0

must_run  = true

name  = "NginxContainer"

network_data  = [

{

gateway = "172.17.0.1"

global_ipv6_address = ""

global_ipv6_prefix_length = 0

ip_address  = "172.17.0.4"

ip_prefix_length  = 16

ipv6_gateway  = ""

network_name  = "bridge"

},

]

network_mode  = "default"

privileged  = false

publish_all_ports = false

read_only = false

remove_volumes  = true

restart = "no"

rm  = false

security_opts = []

shm_size  = 64

start = true

stdin_open  = false

tty = false

  

ports {

external = 8000

internal = 80

ip = "0.0.0.0"

protocol = "tcp"

}

}

  

# docker_image.nginx:

resource "docker_image" "nginx" {

id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"

keep_locally = false

latest = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"

name = "nginx:latest"

repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"

}

  

  

Outputs:

  

container_id = "894f006cc3db62c72aec335993e88a6aa8acdf89c4f5814c8a993d6e18555f8e"

image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
 ```

 ###  `terraform state list` output:
```
docker_container.nginx

docker_image.nginx
```


## Terraform docker part
Changes:
- change container name
- change port to 8080

 ### `terraform show` output:
 
  ```
  # docker_container.py_app:

resource "docker_container" "py_app" {

attach  = false

command = [

"python",

"./app.py",

]

container_read_refresh_timeout_milliseconds = 15000

cpu_shares  = 0

entrypoint  = []

env = []

gateway = "172.17.0.1"

hostname  = "4205ac21ebe2"

id  = "4205ac21ebe2fe55bd33b6ed9975252339508e83fbc3f1dffbb4cb31d87bc75e"

image = "sha256:4db8d33e8d2f5ebcca8e360e5022cb3216c3804a366d5671510c4464893aadb3"

init  = false

ip_address  = "172.17.0.3"

ip_prefix_length  = 16

ipc_mode  = "private"

log_driver  = "json-file"

logs  = false

max_retry_count = 0

memory  = 0

memory_swap = 0

must_run  = true

name  = "py_app"

network_data  = [

{

gateway = "172.17.0.1"

global_ipv6_address = ""

global_ipv6_prefix_length = 0

ip_address  = "172.17.0.3"

ip_prefix_length  = 16

ipv6_gateway  = ""

network_name  = "bridge"

},

]

network_mode  = "default"

privileged  = false

publish_all_ports = false

read_only = false

remove_volumes  = true

restart = "no"

rm  = false

runtime = "runc"

security_opts = []

shm_size  = 64

start = true

stdin_open  = false

stop_timeout  = 0

tty = false

working_dir = "/usr/src/app"

  

ports {

external = 8080

internal = 8000

ip = "0.0.0.0"

protocol = "tcp"

}

}

  

# docker_image.py_app:

resource "docker_image" "py_app" {

id = "sha256:4db8d33e8d2f5ebcca8e360e5022cb3216c3804a366d5671510c4464893aadb3mikadonia/py_app:latest"

image_id = "sha256:4db8d33e8d2f5ebcca8e360e5022cb3216c3804a366d5671510c4464893aadb3"

keep_locally = false

latest = "sha256:4db8d33e8d2f5ebcca8e360e5022cb3216c3804a366d5671510c4464893aadb3"

name = "mikadonia/py_app:latest"

repo_digest  = "mikadonia/py_app@sha256:a72bd2768607a5a56e667f8a997f0c65880c10ca2cf8b2d8d87ea6953f95e65d"

}

  

  

Outputs:

  

container_id = "4205ac21ebe2fe55bd33b6ed9975252339508e83fbc3f1dffbb4cb31d87bc75e"

image_name = "mikadonia/py_app:latest"

ports = [

"8080 -> 8000",

]
  ```
 
 ###  `terraform state list` output:
```
docker_container.py_app

docker_image.py_app
```

 ###  `terraform output` output:
container_id = "4205ac21ebe2fe55bd33b6ed9975252339508e83fbc3f1dffbb4cb31d87bc75e"

image_name = "mikadonia/py_app:latest"

ports = [

"8080 -> 8000",

]

## Yandex Cloud part

 ###  `terraform show` output:

```
# yandex_compute_instance.vm:

resource "yandex_compute_instance" "vm" {

created_at  = "2022-09-27T13:58:11Z"

folder_id = "b1gcnt3oqc7k7s496ps7"

fqdn  = "epd0ss9ifd7ffsh8id8i.auto.internal"

id  = "epd0ss9ifd7ffsh8id8i"

metadata  = {

"ssh-keys" = <<-EOT

ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHEjtdmjqG/zOn6rBNENY4Ujm//QC4CMgSIBUrKf7Rfi/m38jEoyFGB2Z314DIXfOJVbpy5FaYZVU3wqpBNA81ZQyHCiOq084ibxyD8vcKjnOdx2hreR4SUcyDlG+tPEljWwTbQmIDNEg6Pl+wqeYzZoG/Z+JLhvk3rwGspYtcTsKklOpBWHde4H/yQrtOkaM9Hk1++sg6yMPlDL5LdWnBqjEwYHEmIK3i3Qu+KUOoh8IPcRSOdSm5mi8BKuTOpi5MNxDuyWAWI/+C00KXLgOXFnutwSghNiuE23P+Uo7y3UjVKVR4UL9TmiIqeHjeuoUdSgvLG7EI4ouZWvD0W4/x5RYoXyERkkHm5K+ux+nqX1GyFpxZlZtlDRvQpt2s17P7qDAsKYIwC2y0jzL6NzBXAJ8Mohvzi8XKESqBYJnHitA/JBrx1YuMSZ2PDCWbePdZPNYrnwY5LRyMgjKkVmoPk1lJHvUfZ54RJz2pPwM6YChBSHvjsNEb6S0S2zU0Klc= mikado@Alyssas-MacBook-Pro.local

EOT

}

name  = "vm1"

network_acceleration_type = "standard"

platform_id = "standard-v1"

status  = "running"

zone  = "ru-central1-b"

  

boot_disk {

auto_delete = true

device_name = "epdpv5g0b0der6g3cljv"

disk_id = "epdpv5g0b0der6g3cljv"

mode  = "READ_WRITE"

  

initialize_params {

block_size = 4096

image_id = "fd80jdh4pvsj48qftb3d"

size = 3

type = "network-hdd"

}

}

  

network_interface {

index  = 0

ip_address = "192.168.10.6"

ipv4 = true

ipv6 = false

mac_address  = "d0:0d:e7:13:27:b4"

nat  = true

nat_ip_address = "158.160.11.99"

nat_ip_version = "IPV4"

security_group_ids = []

subnet_id  = "e2lh3bh7tst3l7da6vu2"

}

  

placement_policy {

host_affinity_rules = []

}

  

resources {

core_fraction = 100

cores = 2

gpus  = 0

memory  = 2

}

  

scheduling_policy {

preemptible = false

}

}

  

# yandex_vpc_network.network-1:

resource "yandex_vpc_network" "network-1" {

created_at = "2022-09-27T13:58:07Z"

folder_id  = "b1gcnt3oqc7k7s496ps7"

id = "enpiflh904sfdnpi2s68"

labels = {}

subnet_ids = []

}

  

# yandex_vpc_subnet.subnet-1:

resource "yandex_vpc_subnet" "subnet-1" {

created_at = "2022-09-27T13:58:09Z"

folder_id  = "b1gcnt3oqc7k7s496ps7"

id = "e2lh3bh7tst3l7da6vu2"

labels = {}

name = "subnet-1"

network_id = "enpiflh904sfdnpi2s68"

v4_cidr_blocks = [

"192.168.10.0/24",

]

v6_cidr_blocks = []

zone = "ru-central1-b"

}
```

 ###  `terraform state list` output:
```
yandex_compute_instance.vm

yandex_vpc_network.network-1

yandex_vpc_subnet.subnet-1
```
 ###  `terraform output` output:
```
external_ip_address_vm = "158.160.11.99"

internal_ip_address_vm = "192.168.10.6"
```



