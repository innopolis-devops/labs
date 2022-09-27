# Terraform

## Best practices

- Use built-in formatter (`terraform fmt`) and validator (`terraform validate`)
- Use `terraform plan` to see what changes will be made
- Prefer remotely managed state. Use `terraform remote config` to configure remote state.
- Use variables for any sensitive information.
- Pin the Terraform provider to a specific version. Use `terraform providers` to list available providers.
- Give meaningful names to the resources you create.
- Do not add the state file to VCS if it contains any sensitive information (prefer a remote in that case).
- Separate the configuration over multiple files based on the natural grouping of these resources.
- For large infrastructures, use [Terraform modules](https://www.terraform.io/docs/language/modules/syntax.html).
- A possible folder structure for small projects would use `main.tf` (to configure the infrastructure resources), `variables.tf` (to define the variables), and `outputs.tf` (to configure the outputs).

## Outputs

### `terraform show`

```JSON
# docker_container.devopslab:
resource "docker_container" "devopslab" {
    attach                                      = false
    command                                     = [
        "gunicorn",
        "-b",
        "0.0.0.0:5000",
        "--access-logfile",
        "-",
        "app:app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "0ee323dae6ed"
    id                                          = "0ee323dae6ede5e1cd49234509bda96d91c9d8b20c6a2c609c1e869c091b0d5e"
    image                                       = "sha256:2dcef50a04f7c699755bf0b7c788e5b3ad8c9e5761d219fecdf32c80fe0ec8e3"
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
    name                                        = "devopslab"
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
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "app"
    working_dir                                 = "/home/app"

    ports {
        external = 8000
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.devopslab:
resource "docker_image" "devopslab" {
    id           = "sha256:2dcef50a04f7c699755bf0b7c788e5b3ad8c9e5761d219fecdf32c80fe0ec8e3sh1co/devopslab:latest"
    image_id     = "sha256:2dcef50a04f7c699755bf0b7c788e5b3ad8c9e5761d219fecdf32c80fe0ec8e3"
    keep_locally = false
    latest       = "sha256:2dcef50a04f7c699755bf0b7c788e5b3ad8c9e5761d219fecdf32c80fe0ec8e3"
    name         = "sh1co/devopslab:latest"
    repo_digest  = "sh1co/devopslab@sha256:907770ec1dd7a0b74e168910e07eed40f6ec385e3d9fdca9c3b7d576c5fd94d0"
}
```

### `terraform state list`

```
docker_container.devopslab
docker_image.devopslab
```

### Changes log

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.devopslab must be replaced
-/+ resource "docker_container" "devopslab" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "gunicorn",
          - "-b",
          - "0.0.0.0:5000",
          - "--access-logfile",
          - "-",
          - "app:app",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      ~ gateway                                     = "172.17.0.1" -> (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "977702d24af9" -> (known after apply)
      ~ id                                          = "977702d24af9f4baf3b6a32a6ea6c251485b4c41f76ebff31933b59ecd81d0ec" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "devopslab"
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
      - user                                        = "app" -> null
      - working_dir                                 = "/home/app" -> null
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
          ~ external = 8000 -> 5000 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
```

### `terraform output`

```bash
container_id = "88985b2b7c7db7031e96a1f7eb4110ab47d85f105e6565239f1aa8d7720fa6a3"
image_id = "sha256:2dcef50a04f7c699755bf0b7c788e5b3ad8c9e5761d219fecdf32c80fe0ec8e3sh1co/devopslab:latest"
```

## Bonus task

### `terraform plan` output after updating github/main.tf

```bash
github_repository.repo: Refreshing state... [id=DevOps-Labs]
github_branch_default.master: Refreshing state... [id=DevOps-Labs]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOH8TzDc4Bv-wr]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # github_repository.repo will be updated in-place
  ~ resource "github_repository" "repo" {
      ~ allow_rebase_merge          = true -> false
      ~ allow_squash_merge          = true -> false
        id                          = "DevOps-Labs"
        name                        = "DevOps-Labs"
        # (30 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```
