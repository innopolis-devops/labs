# Terraform Best Practices

- Create one workspace per environment and per Terraform configuration
- Use Version Control
- Put Terraform code in VCS repositories
- Manage secrets by integrating Terraform with secret management tools
- Do not commit `.tfstate` files
- Use variables
- Keep you backends small
- Manipulate state only through the commands

## References

- <https://www.terraform.io/docs/cloud/guides/recommended-practices/part1.html>
- <https://www.terraform.io/docs/cloud/guides/recommended-practices/part3.2.html>
- <https://openupthecloud.com/terraform-best-practices/>

# Outputs

### Output after `terraform state show` and `terraform state list` commands:

```
root@LAPTOP-KJ6SQVBF:/home/homa/labs/terraform/docker# terraform show
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
    hostname          = "75d4fe2c0d74"
    id                = "75d4fe2c0d7489b131207bea161dee308f66fb92478462f7b1d81b99f11093b0"
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

```
root@LAPTOP-KJ6SQVBF:/home/homa/labs/terraform/docker# terraform state list
docker_container.nginx
docker_image.nginx
```

### Output after changing configuration:
```
root@LAPTOP-KJ6SQVBF:/home/homa/labs/terraform/docker# terraform apply
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=75d4fe2c0d7489b131207bea161dee308f66fb92478462f7b1d81b99f11093b0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
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
      ~ hostname          = "75d4fe2c0d74" -> (known after apply)
      ~ id                = "75d4fe2c0d7489b131207bea161dee308f66fb92478462f7b1d81b99f11093b0" -> (known after apply)
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
          ~ internal = 80 -> 81 # forces replacement
            # (2 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes 

docker_container.nginx: Destroying... [id=75d4fe2c0d7489b131207bea161dee308f66fb92478462f7b1d81b99f11093b0]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=2339715ff44a1995ad4321132ff92b32c75dbf6e29ce539985508af8cd8adaa4]
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

### Output after finishing tutorial:

```
root@LAPTOP-KJ6SQVBF:/home/homa/labs/terraform/docker# terraform apply -var "container_name=Homa3030"
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=6a46a0c7b7f57f9ae064e4baf7c24ed1469cc1f16e703d8f31ca5a2efdadbb39]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
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
      ~ hostname          = "6a46a0c7b7f5" -> (known after apply)
      ~ id                = "6a46a0c7b7f57f9ae064e4baf7c24ed1469cc1f16e703d8f31ca5a2efdadbb39" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
      ~ name              = "ExampleNginxContainer" -> "Homa3030" # forces replacement
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

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ container_id = "6a46a0c7b7f57f9ae064e4baf7c24ed1469cc1f16e703d8f31ca5a2efdadbb39" -> (known after apply)
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.nginx: Destroying... [id=6a46a0c7b7f57f9ae064e4baf7c24ed1469cc1f16e703d8f31ca5a2efdadbb39]
docker_container.nginx: Destruction complete after 1s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=eb63873d6502ff063a37489f733dbace18451e737d64238f8ea52fe199e1e349]
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

container_id = "eb63873d6502ff063a37489f733dbace18451e737d64238f8ea52fe199e1e349"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```


## Terraform apply after importing repository
```
root@LAPTOP-KJ6SQVBF:/home/homa/labs/terraform/github# terraform apply
var.github_token
  Github token

  Enter a value: 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

github_repository.labs: Refreshing state... [id=lab4]
github_branch_default.master: Refreshing state... [id=lab4]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOH77Uqs4Bv_MT]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # github_branch_default.master must be replaced
-/+ resource "github_branch_default" "master" {
      ~ id         = "lab4" -> (known after apply)
      ~ repository = "lab4" -> "labs" # forces replacement
        # (1 unchanged attribute hidden)
    }

  # github_branch_protection.default is tainted, so must be replaced
-/+ resource "github_branch_protection" "default" {
      ~ id                              = "BPR_kwDOH77Uqs4Bv_MT" -> (known after apply)
      - push_restrictions               = [] -> null
        # (9 unchanged attributes hidden)

      ~ required_status_checks {
          - contexts = [] -> null
            # (1 unchanged attribute hidden)
        }
    }

  # github_repository.labs will be updated in-place
  ~ resource "github_repository" "labs" {
        id                          = "lab4"
      ~ name                        = "lab4" -> "labs"
        # (32 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 2 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_branch_default.master: Destroying... [id=lab4]
github_branch_protection.default: Destroying... [id=BPR_kwDOH77Uqs4Bv_MT]
github_branch_default.master: Destruction complete after 1s
github_branch_protection.default: Destruction complete after 2s
github_repository.labs: Modifying... [id=lab4]
github_repository.labs: Modifications complete after 4s [id=labs]
github_branch_default.master: Creating...
github_branch_protection.default: Creating...
github_branch_default.master: Creation complete after 3s [id=labs]
github_branch_protection.default: Creation complete after 5s [id=BPR_kwDOH77Uqs4Bv_Nh]

Apply complete! Resources: 2 added, 1 changed, 2 destroyed.```