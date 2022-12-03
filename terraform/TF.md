# Terraform

# Docker

## Build infrastructure steps

`terraform show`

```bash
# docker_container.nginx:
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
    hostname          = "92a458881d09"
    id                = "92a458881d099437630fda7289e3ca9ec78d14418c085dc14c374621b093a2f6"
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
    id           = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
    keep_locally = false
    latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

`terraform state list`

```bash
docker_container.nginx
docker_image.nginx
```

## Changing infrastructure

```bash
@MacBook-Pro-3 docker % terraform apply
docker_image.nginx: Refreshing state... [id=sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest]
docker_container.nginx: Refreshing state... [id=92a458881d099437630fda7289e3ca9ec78d14418c085dc14c374621b093a2f6]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
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
      ~ hostname          = "92a458881d09" -> (known after apply)
      ~ id                = "92a458881d099437630fda7289e3ca9ec78d14418c085dc14c374621b093a2f6" -> (known after apply)
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
│ The attribute "latest" is deprecated. Refer to the provider documentation for
│ details.
│ 
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

Entering yes
```bash
docker_container.nginx: Destroying... [id=92a458881d099437630fda7289e3ca9ec78d14418c085dc14c374621b093a2f6]
docker_container.nginx: Destruction complete after 1s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=dda81dd219a9ffab15762463554b8f00e6f4bd78b364c80b758e20b53ee48642]
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for
│ details.
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```


Then use `terraform show` and see the expected result

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
    hostname          = "dda81dd219a9"
    id                = "dda81dd219a9ffab15762463554b8f00e6f4bd78b364c80b758e20b53ee48642"
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
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```
## Outputs
```bash
@MacBook-Pro-3 docker % terraform output
container_id = "97f97f97c8024f2e16aa9b9d6daa1ddf846134e01f39725c5ef467631127a42b"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```
#  AWS
## Build infrastructure
`terraform show`
```bash
@MacBook-Pro-3 aws % terraform show 
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:768381771387:instance/i-095dc72b3cfffd7bd"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-095dc72b3cfffd7bd"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-00f77970b0eaabca4"
    private_dns                          = "ip-172-31-12-207.us-west-2.compute.internal"
    private_ip                           = "172.31.12.207"
    public_dns                           = "ec2-18-237-55-236.us-west-2.compute.amazonaws.com"
    public_ip                            = "18.237.55.236"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0ee0af80f0dd13d96"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-0725293c9ecc8bf09",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-09316b16c1729edc7"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```
state list
```bash
@MacBook-Pro-3 aws % terraform state list
aws_instance.app_server
```
## Changing infrastructure

```bash
@MacBook-Pro-3 aws % terraform apply     
aws_instance.app_server: Refreshing state... [id=i-095dc72b3cfffd7bd]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.app_server must be replaced
-/+ resource "aws_instance" "app_server" {
      ~ ami                                  = "ami-830c94e3" -> "ami-08d70e59c07c61a3a"
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.app_server: Destroying... [id=i-095dc72b3cfffd7bd]
aws_instance.app_server: Still destroying... [id=i-095dc72b3cfffd7bd, 10s elapsed]
aws_instance.app_server: Destruction complete after 31s
aws_instance.app_server: Creating...
aws_instance.app_server: Still creating... [10s elapsed]
aws_instance.app_server: Creation complete after 56s [id=i-08fbc2fb2fc0870e0]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
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
```bash
Outputs:

instance_id = "i-08fbc2fb2fc0870e0"
instance_public_ip = "54.244.172.228"
```
## terraform practices
* .gitignore usage in terraform folders
* Make tokens as env variables, e.g. `export <variable_name>=`
* Make main.tf file in each terraform directory and locate resource
* Use `variables.tf` for variables declarations
* Use `outputs.tf` for outpus declarations