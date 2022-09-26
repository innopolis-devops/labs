```bash
terraform show
# module.py_app.docker_container.app:
resource "docker_container" "app" {
    attach                                      = false
    command                                     = [
        "python",
        "-m",
        "app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "72960d41bfc4"
    id                                          = "72960d41bfc4a5b6859cda601264de771440704571bfca9d002b5d3b5e2db8c3"
    image                                       = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    init                                        = false
    ip_address                                  = "172.17.0.2"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "web_py"
    network_data                                = [
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
    network_mode                                = "default"
    privileged                                  = false
    publish_all_ports                           = false
    read_only                                   = false
    remove_volumes                              = true
    restart                                     = "no"
    rm                                          = true
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "user"
    working_dir                                 = "/app"

    ports {
        external = 5000
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# module.py_app.docker_image.test:
resource "docker_image" "test" {
    id           = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0wat4er/inno_devops:python"
    image_id     = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    keep_locally = false
    latest       = "sha256:161a6b8f5c2e13aa3170fc4b535a2910810db40e0a5d0868836a84ac900d9bd0"
    name         = "wat4er/inno_devops:python"
}
```

```bash
terraform state list
module.py_app.docker_container.app
module.py_app.docker_image.test
```