Terraform show command after creating main.tf and variables.tf file and apply them:

```shell
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/terraform-docker-container$ terraform show
```
Output:
```
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach            = false
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "3a38e7c418fe"
    id                = "3a38e7c418fed10a0614d58926b19cb750f259840de1ac8622d16ba83fa67e9a"
    image             = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    init              = false
    ip_address        = "172.17.0.2"
    ip_prefix_length  = 16
    ipc_mode          = "private"
    log_driver        = "json-file"
    logs              = false
    max_retry_count   = 0
    memory            = 0
    memory_swap       = 0
    must_run          = true
    name              = "ExampleNginxContainer"
    network_data      = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            network_name              = "bridge"
        },
    ]
    network_mode      = "default"
    privileged        = false
    publish_all_ports = false
    read_only         = false
    remove_volumes    = true
    restart           = "no"
    rm                = false
    runtime           = "runc"
    security_opts     = []
    shm_size          = 64
    start             = true
    stdin_open        = false
    stop_signal       = "SIGQUIT"
    stop_timeout      = 0
    tty               = false

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}


Outputs:

container_id = "3a38e7c418fed10a0614d58926b19cb750f259840de1ac8622d16ba83fa67e9a"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"

```

Terraform state list:
```shell
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/terraform-docker-container$ terraform state list
```
Output:
```
docker_container.container_id
docker_image.nginx
```

Showing output once terraform apply is finished after creating outputs.tf file 
```
(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/terraform/terraform-docker-container$ terraform output
```

Output:
```
container_id = "3a38e7c418fed10a0614d58926b19cb750f259840de1ac8622d16ba83fa67e9a"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```