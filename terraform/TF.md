# Terrafrom

## Best practices

- Separate files for variables and outputs
- Environment variables for the secrets
- Use `terraform validate` and `terraform fmt` to validate and format terraform files

## Outputs

### terraform show

`
container_id = "4517e457a9176e2495db12e8a6dc440c80b43972f7a4af9ae2e05007c40be329"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
timurbl@timurbl-2osx docker % terraform show

# docker_container.app_python:

resource "docker_container" "app_python" {
attach = false
command = [
"nginx",
"-g",
"daemon off;",
]
cpu_shares = 0
entrypoint = [
"/docker-entrypoint.sh",
]
env = []
gateway = "172.17.0.1"
hostname = "4517e457a917"
id = "4517e457a9176e2495db12e8a6dc440c80b43972f7a4af9ae2e05007c40be329"
image = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
init = false
ip_address = "172.17.0.2"
ip_prefix_length = 16
ipc_mode = "private"
log_driver = "json-file"
logs = false
max_retry_count = 0
memory = 0
memory_swap = 0
must_run = true
name = "ExampleNginxContainer"
network_data = [
{
gateway = "172.17.0.1"
global_ipv6_address = ""
global_ipv6_prefix_length = 0
ip_address = "172.17.0.2"
ip_prefix_length = 16
ipv6_gateway = ""
network_name = "bridge"
},
]
network_mode = "default"
privileged = false
publish_all_ports = false
read_only = false
remove_volumes = true
restart = "no"
rm = false
security_opts = []
shm_size = 64
start = true
stdin_open = false
tty = false

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }

}

# docker_image.app_python:

resource "docker_image" "app_python" {
id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
keep_locally = false
latest = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
name = "nginx:latest"
repo_digest = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}

Outputs:

container_id = "4517e457a9176e2495db12e8a6dc440c80b43972f7a4af9ae2e05007c40be329"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
`

### terraform state list

`docker_container.app_python docker_image.app_python`

### terraform output

`container_id = "4517e457a9176e2495db12e8a6dc440c80b43972f7a4af9ae2e05007c40be329" image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"`
