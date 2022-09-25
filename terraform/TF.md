# Terraform lab

## Docker

### Initial build

#### output of `tf show`

```sh
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
    hostname          = "f635e774141f"
    id                = "f635e774141fc37f30e3455e7764ade805d5472bbb113db11803560473ffd716"
    image             = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
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
    name              = "innopolos-devops-docker"
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
    id           = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
    keep_locally = false
    latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

### output of `tf state list`

```sh
docker_container.nginx
docker_image.nginx
```

### Change infrastructure

#### output of `tf apply` after changing port 8000 -> 8001

```sh
docker_image.nginx: Refreshing state... [id=sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest]
docker_container.nginx: Refreshing state... [id=f635e774141fc37f30e3455e7764ade805d5472bbb113db11803560473ffd716]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and 2 more similar warnings elsewhere)
╵

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
~/innopolis/devops/terraform/docker on lab4 >32 !1 ?1                                                                                        at 14:21:23
> tf apply
docker_image.nginx: Refreshing state... [id=sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest]
docker_container.nginx: Refreshing state... [id=f635e774141fc37f30e3455e7764ade805d5472bbb113db11803560473ffd716]

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
      ~ hostname          = "f635e774141f" -> (known after apply)
      ~ id                = "f635e774141fc37f30e3455e7764ade805d5472bbb113db11803560473ffd716" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
        name              = "innopolos-devops-docker"
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
          ~ external = 8000 -> 8001 # forces replacement
            # (3 unchanged attributes hidden)
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

docker_container.nginx: Destroying... [id=f635e774141fc37f30e3455e7764ade805d5472bbb113db11803560473ffd716]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=e256186d95ab3f8b39783609bb3d29316da60f1d0ff79db8097394db72046227]
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

#### outpit of `tf output`

```sh
container_id = "e256186d95ab3f8b39783609bb3d29316da60f1d0ff79db8097394db72046227"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest
```

## Cloud

I decided to use Yandex Cloud.

So, I will follow [this](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-terraform) guide.

### Initial

I created 1 resource `vm` - ubuntu machine, exposed ip of it from output.tf and connected to it using ssh.

#### output of `tf apply`

```sh
yandex_vpc_network.network-1: Refreshing state... [id=enpdk7gdchvlpj23nnjj]
yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9b04013qpgg7ee1aip5]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.vm will be created
  + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPwyRS2lmwXsbPnhYP5RTA+r/8FAApbRVIPA4EAu3aPxstfy16cR62yf/0wc9k3CumXX1a1Acr0+MCs9Jlvl0AL+9hVJUsKjw4tP0v+SJY4nYenCeis2QI+qaXFCyC79OUCkfEO1d1aPKluSIkdMcD2YEZhBhBqjKk6q4p9txEBUN0xD4pOBPjtfxkA9eSAmnW9UyzSvdSpB8RwkN5BxALfWn/O2xJy6TOcFN6zrZ42VTswKEaLyCfe1qpIuH6Qr+QN73MMkkqPqzSHtAf8dFaV0SaVPHlK5AHtItQOkTV/06dVpWv5MJDtbX9sS0DimeU4UhUBbl1ftbYhLkwlHsb
            EOT
        }
      + name                      = "terraform1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8ingbofbh3j5h7i8ll"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e9b04013qpgg7ee1aip5"
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_vm = (known after apply)
  + internal_ip_address_vm = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.vm: Creating...
yandex_compute_instance.vm: Still creating... [10s elapsed]
yandex_compute_instance.vm: Still creating... [20s elapsed]
yandex_compute_instance.vm: Still creating... [30s elapsed]
yandex_compute_instance.vm: Creation complete after 40s [id=fhm4pg08lcslco7er3j6]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_vm = "178.154.207.98"
internal_ip_address_vm = "192.168.10.23"
```

after that I can connect to vm using ssh:

![ssh-connect](https://i.imgur.com/FupRLj2.png)

### Change numer of cores 2 -> 4, memory 2 -> 4

```sh
tf destroy
tf apply
...
      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }
...
```

### Change instance name using input vars

#### output of `terraform apply -var "name=supercoolvm"`

```sh
yandex_vpc_network.network-1: Refreshing state... [id=enprardkl5f1bv6jhjbg]
yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9bqukuu3n2i8f7g78u5]
yandex_compute_instance.vm: Refreshing state... [id=fhm98uruod5il74jfjr0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.vm will be updated in-place
  ~ resource "yandex_compute_instance" "vm" {
        id                        = "fhm98uruod5il74jfjr0"
      ~ name                      = "terraform1" -> "supercoolvm"
        # (9 unchanged attributes hidden)

        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.vm: Modifying... [id=fhm98uruod5il74jfjr0
```

## Github

### Updating my devops repo

#### Output of `tf apply`

```sh
github_repository.main: Refreshing state... [id=devops]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "master"
      + id         = (known after apply)
      + repository = "devops"
    }

  # github_branch_protection.main will be created
  + resource "github_branch_protection" "main" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = false
      + id                              = (known after apply)
      + pattern                         = "master"
      + repository_id                   = "R_kgDOH6KJkA"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false
    }

  # github_repository.main will be updated in-place
  ~ resource "github_repository" "main" {
      ~ allow_rebase_merge          = true -> false
      ~ allow_squash_merge          = true -> false
      + description                 = "Devops labs solutions in my university"
        id                          = "devops"
        name                        = "devops"
        # (29 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.main: Modifying... [id=devops]
github_repository.main: Modifications complete after 3s [id=devops]
github_branch_default.main: Creating...
github_branch_protection.main: Creating...
github_branch_default.main: Creation complete after 3s [id=devops]
github_branch_protection.main: Creation complete after 4s [id=BPR_kwDOH6KJkM4Bv0H_]

Apply complete! Resources: 2 added, 1 changed, 0 destroyed.
```

## Best practices

+ use [gitignore](https://github.com/github/gitignore/blob/main/Terraform.gitignore) file
+ add token to gitignore!
+ split into folders and files. move output and var into separate files.
+ use `tf fmt` to format your files
+ Use `vars.tf` for such vars like instance names, zone name, etc
+ `tf destroy` at the end. no wasting resources.
+ upload lock files to git repo to support same dependencies
