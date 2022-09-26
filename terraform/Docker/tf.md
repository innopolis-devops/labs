# Docker provider


## Excution 

* First, I created ```main.tf``` file, and run the following commands:
- ```terraform init ```
- ```terrform init ```
- ```terraform validate```
- ```terraform fmt```


* Then after making sure everything is right, I run the following command ```terraform show```, the output was:

```
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach                                      = false
    command                                     = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "60ad47761492"
    id                                          = "60ad477614924b3ec6f49eb0689994e484ead25671f46d89af817045ce78c3b5"
    image                                       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    init                                        = false
    ip_address                                  = "172.17.0.3"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "tutorial"
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
    stop_signal                                 = "SIGQUIT"
    stop_timeout                                = 0
    tty                                         = false

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}

```

* Then, after running ```terraform state list``` we got:

```
docker_container.nginx
docker_image.nginx

```

* here we are supposed to change the infrastructure (internal became 8000):

```
Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # docker_container.nginx has changed
  ~ resource "docker_container" "nginx" {
      + dns                                         = []
      + dns_opts                                    = []
      + dns_search                                  = []
      + group_add                                   = []
        id                                          = "60ad477614924b3ec6f49eb0689994e484ead25671f46d89af817045ce78c3b5"
      + links                                       = []
      + log_opts                                    = {}
        name                                        = "tutorial"
      + storage_opts                                = {}
      + sysctls                                     = {}
      + tmpfs                                       = {}
        # (35 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may
include actions to undo or respond to these changes.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      ~ gateway                                     = "172.17.0.1" -> (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "60ad47761492" -> (known after apply)
      ~ id                                          = "60ad477614924b3ec6f49eb0689994e484ead25671f46d89af817045ce78c3b5" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.3" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "tutorial"
      ~ network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.3"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> (known after apply)
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
        # (12 unchanged attributes hidden)

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

      ~ ports {
          ~ internal = 80 -> 8000 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.nginx: Destroying... [id=60ad477614924b3ec6f49eb0689994e484ead25671f46d89af817045ce78c3b5]
docker_container.nginx: Destruction complete after 3s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 3s [id=9b6a96a0ffe8070911ce5107a0f42abd527859558abc67971c6de8ef2c74f3f9]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

```

* check output:

```
Outputs:

container_id = "02cb785e569eab45c9acdafe495aaf82eb0a0b4da405ebb70ea969e4e083099f"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"

```

