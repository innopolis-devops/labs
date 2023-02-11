(i have already made config for the app, skipped tutorial part BUT followed it)

geralizz@DESKTOP-QGAMLUK:~/labs_devops/app_python/terraform/docker$ terraform show
. # docker_container.moscow_time:
resource "docker_container" "moscow_time" {
    attach                                      = false
    command                                     = [
        "app.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "python",
    ]
    env                                         = []
    hostname                                    = "b58df0c7ef77"
    id                                          = "b58df0c7ef77356eb5d243d97e0b02cd2c8dd4abe9276a043849fed4aae43a0a"
    image                                       = "sha256:151792d5a0bf38893e4b86583b433c9ff50a1a45f50ee12ea79e607f8d7815d5"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "moscow_time"
    network_data                                = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.3"
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
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app_python"

    ports {
        external = 8080
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

. # docker_image.moscow_time:
resource "docker_image" "moscow_time" {
    id           = "sha256:151792d5a0bf38893e4b86583b433c9ff50a1a45f50ee12ea79e607f8d7815d5geralizz/moscow_time:latest"
    image_id     = "sha256:151792d5a0bf38893e4b86583b433c9ff50a1a45f50ee12ea79e607f8d7815d5"
    keep_locally = false
    name         = "geralizz/moscow_time:latest"
    repo_digest  = "geralizz/moscow_time@sha256:8a058054eb18977a9a9e986a78da8d1fffed283a180453c0d3a48bdd06d4d55d"
}


geralizz@DESKTOP-QGAMLUK:~/labs_devops/app_python/terraform/docker$ terraform state list
docker_container.moscow_time
docker_image.moscow_time


### ...changing configs and following the guide...

geralizz@DESKTOP-QGAMLUK:~/labs_devops/app_python/terraform/docker$ terraform output
container_id = "2bf07de30a7b1af486b5fb2f153c9a0ce9eac32e326a7e51c85a4f192b2de4b9"
image_id = "sha256:151792d5a0bf38893e4b86583b433c9ff50a1a45f50ee12ea79e607f8d7815d5geralizz/moscow_time:latest"