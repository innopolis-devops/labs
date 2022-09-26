
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




