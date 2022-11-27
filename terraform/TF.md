# Terraform logs and practices

## Docker part

### My changes

```bash
~ ports {
          ~ external = 8000 -> 8001 # forces replacement
            # (3 unchanged attributes hidden)
        }
```

### `terraform show`

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
    hostname          = "d5a01b1a31d3"
    id                = "d5a01b1a31d3490cce47d0d835040a1020abc9b42cb45c876c5cfb1a67cf1f6f"
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
    name              = "my_custom_docker_container_name"
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
        external = 8001
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


Outputs:

container_id = "d5a01b1a31d3490cce47d0d835040a1020abc9b42cb45c876c5cfb1a67cf1f6f"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```

### `terraform state list`

```bash
docker_container.nginx
docker_image.nginx
```

### `terraform output`

```bash
container_id = "d5a01b1a31d3490cce47d0d835040a1020abc9b42cb45c876c5cfb1a67cf1f6f"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```

## AWS part

### `terraform show`

```bash
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:438267366861:instance/i-039fe91c2a43d2cac"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-039fe91c2a43d2cac"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-0e2c5123351ee8f81"
    private_dns                          = "ip-172-31-14-222.us-west-2.compute.internal"
    private_ip                           = "172.31.14.222"
    public_dns                           = "ec2-54-213-153-40.us-west-2.compute.amazonaws.com"
    public_ip                            = "54.213.153.40"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0e80969c883b9b428"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-032790130b1ad8781",
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
        volume_id             = "vol-0a9ea5cf68ebdd74b"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```

### `terraform state list`

```bash
aws_instance.app_server
```

### Changes 

- Changed ami to `ami-08d70e59c07c61a3a`

### Output

```bash
instance_id = "i-0fb6b331cd2a925f5"
instance_public_ip = "34.221.67.90"
```

## Github Part

### `terraform apply`

```bash
github_repository.main: Refreshing state... [id=inno-devops-labs]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "master"
      + id         = (known after apply)
      + repository = "inno-devops-labs"
    }

  # github_branch_protection.main will be created
  + resource "github_branch_protection" "main" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = false
      + id                              = (known after apply)
      + pattern                         = "master"
      + repository_id                   = "R_kgDOH72wAA"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false
    }

  # github_repository.main will be updated in-place
  ~ resource "github_repository" "main" {
      + description                 = "DevOps repository"
      - has_downloads               = true -> null
      - has_projects                = true -> null
      - has_wiki                    = true -> null
        id                          = "inno-devops-labs"
        name                        = "inno-devops-labs"
        # (28 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 0 to destroy.
```

## Best practices

- Use `terraform fmt` to format your code
- Use `terraform validate` to validate your code
- Use `terraform plan` to see what changes will be made
- Use env variable `GITHUB_TOKEN` to authenticate
- Use variables.tf to store/declare variables
- Destroying unused resources is a good practice
- Declaring outputs in a separate file is a good practice (outputs.tf)
