# Terraform tasks

## Docker

### After "Build infrastructure step"

`terraform show`

```bash
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
    hostname          = "e3186ee1fbd2"
    id                = "e3186ee1fbd25ebc353e2b37b2c70a96ae605afa66fc906b6aea729e7e995043"
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

`terraform state list`

```bash
docker_container.nginx
docker_image.nginx

```

### "Change infrastructure"

Changes to be applied

```bash
$ terraform apply
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=abca2a5c08e80ecbbdadcbeb7bfb5298c6d123207951de630acdf3eaaf488cfa]

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
      ~ hostname          = "abca2a5c08e8" -> (known after apply)
      ~ id                = "abca2a5c08e80ecbbdadcbeb7bfb5298c6d123207951de630acdf3eaaf488cfa" -> (known after apply)
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

docker_container.nginx: Destroying... [id=abca2a5c08e80ecbbdadcbeb7bfb5298c6d123207951de630acdf3eaaf488cfa]
docker_container.nginx: Destruction complete after 1s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 0s [id=47480c3f641eb3e9630a16e6ac1ab317405fad35323d5aa5fa064c2e0f8c89b7]
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

```

After this `terraform show` shows port 8080 as expected and opening `localhost:8080` in browser also does the job.

```bash
...
    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
...
```

### Outputs

```bash
$ terraform output
container_id = "e1d382129523f1556a53e0bee61611af9f99458cafc562f4bd3f754214b391fa"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

## Yandex cloud

Since AWS/Google is not available and I couldn't get GitHub student pack :( (so no Azure either).

Also, since there is no simple tutorial for Yandex Cloud, I've done approximately similar steps to the other ones.

### Build infrastructure

To start I've created terraform manifest that creates VM instance in Yandex Cloud (authenticating via service account created beforehand). Also it outputs external IP of the VM so that I can connect and check if it's working.

`terraform show`

```bash
# yandex_compute_instance.some_resource_1:
resource "yandex_compute_instance" "some_resource_1" {
    created_at                = "2022-09-22T16:32:53Z"
    folder_id                 = "b1g3qa4odm76kbnv2t4p"
    fqdn                      = "fhmqb13hp4kdagr4cq47.auto.internal"
    id                        = "fhmqb13hp4kdagr4cq47"
    labels                    = {}
    metadata                  = {
        "foo"      = "bar"
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/F2wn57/DksC7thxUtY5g4o0Qvg/JdtDlNgONySI+xiZcIvfRGAP4zXRXm3e5py658nxbhlrLz2/xwJZVzNl+lM0VVsMm0euMuirzf/dJcl5e7oJAdGpPmoyQwXB133LnFZNui2phNLOyChHEcd4wu0dy0/ZvAk7kp+dI2Cp+GA8l65X0jWIO8GIliq95D0XqqaG5FWfTNOgLoEHh94kIBl40DOB8KaKCQjTqBDEYFvmCnapnYu+SjmZLGcZxu5anyLRYiGZk/Op589MgkUX2YLuU4VlPH2evCdN7wRTrnY3Tv/sZEeoCBwHv1QxdA6WAr0lBuJLtsW8CGW28XujHfju+baBUkeYEI/PYBRYAULsKMJ6k/cEh4ZfvU8SQzPSD5E+0zhBlBZHATciA4HMCxF5QNc3tSGGvgo5UkSRMKA5s/SJTKMr5I4/bOYWEC2thk3xPrCzjcJ78xAl07ZyIy0/agVjCrfI88fOMJexdOoopmigTPMQ0izFU3tBWXS0= bragov4ik@bragov4ik-Lenovo-IdeaPad-L340-15API
        EOT
    }
    name                      = "test"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmrfoocsl8nk9pdrtk6"
        disk_id     = "fhmrfoocsl8nk9pdrtk6"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8c00efhiopj3rlnlbn"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.0.19"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1a:58:47:1c"
        nat                = true
        nat_ip_address     = "84.201.135.76"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9besfa1ij06o6ei2k4m"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 5
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.foo:
resource "yandex_vpc_network" "foo" {
    created_at = "2022-09-22T16:32:48Z"
    folder_id  = "b1g3qa4odm76kbnv2t4p"
    id         = "enpnk8409dj4hdo58buo"
    labels     = {}
    subnet_ids = [
        "e9besfa1ij06o6ei2k4m",
    ]
}

# yandex_vpc_subnet.foo:
resource "yandex_vpc_subnet" "foo" {
    created_at     = "2022-09-22T16:32:50Z"
    folder_id      = "b1g3qa4odm76kbnv2t4p"
    id             = "e9besfa1ij06o6ei2k4m"
    labels         = {}
    network_id     = "enpnk8409dj4hdo58buo"
    v4_cidr_blocks = [
        "192.168.0.0/16",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip = "84.201.135.76"
```

`terraform state list`

```bash
yandex_compute_instance.some_resource_1
yandex_vpc_network.foo
yandex_vpc_subnet.foo
```

Also I'm able to connect to the VM via SSH:

```bash
$ ssh ubuntu@84.201.135.76
Welcome to Ubuntu 22.04.1 LTS (GNU/Linux 5.15.0-47-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Sep 22 05:04:59 PM UTC 2022

  System load:  0.0               Processes:             126
  Usage of /:   83.1% of 4.84GB   Users logged in:       0
  Memory usage: 19%               IPv4 address for eth0: 192.168.0.19
  Swap usage:   0%


0 updates can be applied immediately.


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Thu Sep 22 16:51:26 2022 from 188.130.155.151
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@fhmqb13hp4kdagr4cq47:~$ ls /
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  lost+found  media  mnt  opt  proc  root  run  sbin  snap  srv  sys  tmp  usr  var
ubuntu@fhmqb13hp4kdagr4cq47:~$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether d0:0d:1a:58:47:1c brd ff:ff:ff:ff:ff:ff
    altname enp138s0
    altname ens8
    inet 192.168.0.19/16 metric 100 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::d20d:1aff:fe58:471c/64 scope link 
       valid_lft forever preferred_lft forever
```

### Change infrastructure

I was applying updates when trying to enable public IPs.

Here is the output of this process:

```bash
$ terraform apply
yandex_vpc_network.foo: Refreshing state... [id=enpnk8409dj4hdo58buo]
yandex_vpc_subnet.foo: Refreshing state... [id=e9besfa1ij06o6ei2k4m]
yandex_compute_instance.some_resource_1: Refreshing state... [id=fhmqb13hp4kdagr4cq47]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.some_resource_1 will be updated in-place
  ~ resource "yandex_compute_instance" "some_resource_1" {
        id                        = "fhmqb13hp4kdagr4cq47"
        name                      = "test"
        # (9 unchanged attributes hidden)

      ~ network_interface {
          ~ nat                = false -> true
            # (7 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.some_resource_1: Modifying... [id=fhmqb13hp4kdagr4cq47]
yandex_compute_instance.some_resource_1: Still modifying... [id=fhmqb13hp4kdagr4cq47, 10s elapsed]
yandex_compute_instance.some_resource_1: Modifications complete after 16s [id=fhmqb13hp4kdagr4cq47]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

### Input variables

I used variables to specify instance name. It works successfully

```bash
$ terraform apply -var "instance_name=yet-another-name"
yandex_vpc_network.foo: Refreshing state... [id=enpnk8409dj4hdo58buo]
yandex_vpc_subnet.foo: Refreshing state... [id=e9besfa1ij06o6ei2k4m]
yandex_compute_instance.some_resource_1: Refreshing state... [id=fhmqb13hp4kdagr4cq47]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.some_resource_1 will be updated in-place
  ~ resource "yandex_compute_instance" "some_resource_1" {
        id                        = "fhmqb13hp4kdagr4cq47"
      ~ name                      = "ttest" -> "yet-another-name"
        # (9 unchanged attributes hidden)

        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.some_resource_1: Modifying... [id=fhmqb13hp4kdagr4cq47]
yandex_compute_instance.some_resource_1: Modifications complete after 6s [id=fhmqb13hp4kdagr4cq47]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

Outputs:

external_ip = "84.201.135.76"
```

### Outputs

As I mentioned before, I used outputs to show public IP of the instance

```bash
$ terraform output
external_ip = "84.201.135.76"
```

## Best terraform practices

* Use .gitignore for terraform
* Keep token as environmental variable (instead of Terraform variable/file/hardcode into config)
* Organize terraform files into folders
* Destroying running instances after finishing the tasks
* Used TFLint with default rules for terraform files
* Not repeating resource type in names
* Start every module with a main.tf file, where resources are located by default.
* In every module, include a `README.md` file in Markdown format. In the `README.md` file, include basic documentation about the module.
* Using naming conventions for configuration objects
* Declare all variables in `variables.tf`
* Organize all outputs in an `outputs.tf` file
* Use builtin `terraform fmt`
