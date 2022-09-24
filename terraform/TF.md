# Terraform

## Docker tutorial

### `terraform show` first time

    # docker_container.nginx:
    resource "docker_container" "nginx" {
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
        hostname          = "dbb7b15772ae"
        id                = "dbb7b15772ae6d8f0b61b7a8e0f756256d9ea19f871318d672cf2b0278321588"
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
        name              = "tutorial"
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
        security_opts     = []
        shm_size          = 64
        start             = true
        stdin_open        = false
        tty               = false

        ports {
            external = 8000
            internal = 80
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }

    # docker_image.nginx

    resource "docker_image" "nginx" {
        id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
        keep_locally = false
        latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
        name         = "nginx:latest"
        repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
    }

### `terraform state list`

    docker_container.nginx
    docker_image.nginx

### `terraform apply`

    ...
          ~ ports {
              ~ external = 8000 -> 8080 # forces replacement
                # (3 unchanged attributes hidden)
            }
    ...
    Plan: 1 to add, 0 to change, 1 to destroy.
    ...

### `terraform show` after changing port

    # docker_container.nginx

    resource "docker_container" "nginx" {
        ...
        ports {
            external = 8080
            internal = 80
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }
    ...

### `terraform output`

    container_id = "ec6eccdcac1b6b79f0627552d7090764d266d6f8d090a4c3d4f42ad7c3979e54"
    image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
