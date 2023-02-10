The result of `terraform show`

```ps
Δ .\terraform.exe -chdir=terraform show
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "python3",
        "-m",
        "flask",
        "--app",
        "app_python/main",
        "run",
        "--host=0.0.0.0",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "5deee228ced7"
    id                                          = "5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88"
    image                                       = "sha256:3582bd5dc92a1f1bc0e161b81420e3f4f36cd588bc4eb909cbeca88d865b251b"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python"
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
    restart                                     = "always"
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
    working_dir                                 = "/"

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```
The result of `terraform state list`:
```ps
Δ .\terraform.exe -chdir=terraform state list
docker_container.app_python
```
Changing architecture:
```ps

Δ .\terraform.exe -chdir=terraform apply
docker_container.app_python: Refreshing state... [id=5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.app_python must be replaced
-/+ resource "docker_container" "app_python" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python3",
          - "-m",
          - "flask",
          - "--app",
          - "app_python/main",
          - "run",
          - "--host=0.0.0.0",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "5deee228ced7" -> (known after apply)
      ~ id                                          = "5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88" -> (known after apply)
      ~ image                                       = "sha256:3582bd5dc92a1f1bc0e161b81420e3f4f36cd588bc4eb909cbeca88d865b251b" -> "lab-4:latest" # forces replacement
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "app_python"
      ~ network_data                                = [
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
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      + stop_signal                                 = (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - working_dir                                 = "/" -> null
        # (13 unchanged attributes hidden)

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
          ~ external = 8080 -> 5000 # forces replacement
          ~ internal = 80 -> 5000 # forces replacement
            # (2 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.app_python: Destroying... [id=5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88]
docker_container.app_python: Destruction complete after 0s
docker_container.app_python: Creating...
docker_container.app_python: Creation complete after 2s [id=4dcbb280e5615bba62864545d59ce5ba2736f5212e0eb96b77884dcf01f935b1]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
Output variables:
```ps
Δ .\terraform.exe -chdir=terraform output
container_id = "ace8aa13fb38a081451fb0c66b29bd977357906d66a55a147cfcec5167ec1968"
```