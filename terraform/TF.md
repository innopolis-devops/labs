# Terraform

- Install terraform CLI (https://www.terraform.io/downloads)

- Create `docker` module following [the tutorial](https://learn.hashicorp.com/tutorials/terraform/docker-build?in=terraform/docker-get-started#prerequisites).

- Run

  ```bash
  terrform init
  terraform validate
  terraform fmt
  terraform apply # write yes
  ```

  ```bash
  $ terraform state
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
      hostname          = "d723cbbe7863"
      id                = "d723cbbe78634c34163605a6b3e8eb218674a2519da48eef96b2e36fd7de0f75"
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
  $ terraform state list
  docker_container.nginx
  docker_image.nginx
  ```

- Change infrastructure (change external port to 8080 instead of 8000)

  ```bash
  $ terraform apply
  docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]docker_container.nginx: Refreshing state... [id=d723cbbe78634c34163605a6b3e8eb218674a2519da48eef96b2e36fd7de0f75]
  
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
        ~ hostname          = "d723cbbe7863" -> (known after apply)
        ~ id                = "d723cbbe78634c34163605a6b3e8eb218674a2519da48eef96b2e36fd7de0f75" -> (known after apply)
        ~ init              = false -> (known after apply)
        ~ ip_address        = "172.17.0.2" -> (known after apply)
        ~ ip_prefix_length  = 16 -> (known after apply)
        ~ ipc_mode          = "private" -> (known after apply)
        - links             = [] -> null
        - log_opts          = {} -> null
        - max_retry_count   = 0 -> null
        - memory            = 0 -> null
        - memory_swap       = 0 -> null
          name              = "tutorial"
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
            ~ external = 8000 -> 8080 # forces replacement
              # (3 unchanged attributes hidden)
          }
      }
  
  Plan: 1 to add, 0 to change, 1 to destroy
  ```

- Create `variables.tf` and `outputs.tf` as below and change `docker_container` resource to use `var.container_name` instead of `tutorial`

  ```bash
  # variables.tf
  variable "container_name" {
    description = "Value of the name for the Docker container"
    type        = string
    default     = "ExampleNginxContainer"
  }
  
  # outputs.tf
  output "container_id" {
    description = "ID of the Docker container"
    value       = docker_container.nginx.id
  }
  
  output "image_id" {
    description = "ID of the Docker image"
    value       = docker_image.nginx.id
  }
  
  ```

- Apply config and check output

  ```bash
  $ terraform apply
  ...
  ~ name              = "tutorial" -> "ExampleNginxContainer" # forces replacement
  ...
  Changes to Outputs:
    + container_id = (known after apply)
    + image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
  
  $ terraform output
  container_id = "5472b7185b9174221ac227794dbec79adcc14814da14dd22419a1267e0d20274"
  image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
  ```

  