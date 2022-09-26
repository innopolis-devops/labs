#Terraform Lab

* [Docker](#docker)
* [GitHub](#github)
* [YandexCloud](#yandexcloud)

#Docker

## 1 Build Infrastructure Step
* Added main.tf file
* Executed `terraform init`
* Executed `terraform apply`

```bash
>$ terraform show

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
    hostname          = "8a65912df007"
    id                = "8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d"
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
    name              = "nginx-container-tutorial"
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

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

```bash
>$ terraform state list

docker_container.nginx
docker_image.nginx
```

## 2 Changed Infrastructure Step
* Port changed from 8000 to 8880
* Executed `terraform apply`

```bash
>$ terraform apply

docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {
      + bridge            = (known after apply)
      ~ command           = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs    = (known after apply)
      - cpu_shares        = 0 -> null
      - dns               = [] -> null
      - dns_opts          = [] -> null
      - dns_search        = [] -> null
      ~ entrypoint        = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env               = [] -> (known after apply)
      + exit_code         = (known after apply)
      ~ gateway           = "172.17.0.1" -> (known after apply)
      - group_add         = [] -> null
      ~ hostname          = "8a65912df007" -> (known after apply)
      ~ id                = "8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
        name              = "nginx-container-tutorial"
      ~ network_data      = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> (known after apply)
      - network_mode      = "default" -> null
      - privileged        = false -> null
      - publish_all_ports = false -> null
      ~ security_opts     = [] -> (known after apply)
      ~ shm_size          = 64 -> (known after apply)
      - sysctls           = {} -> null
      - tmpfs             = {} -> null
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
          ~ external = 8000 -> 8888 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

docker_container.nginx: Destroying... [id=8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d]
docker_container.nginx: Destruction complete after 4s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 5s [id=7fa517c6948eea7d625bb73ae5e2cdcc7651048e07f4da308ae96e9a5ee6ca00]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

## 3 Output Step

```bash
>$ terraform output


```

#GitHub


#YandexCloud