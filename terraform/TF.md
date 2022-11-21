# Terraform

## Docker

### Docker `terraform show`

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
    hostname                                    = "c24edb23db69"
    id                                          = "c24edb23db69629a54e8281bb6c4025bf1be98a1e1a715864dbef99911ad7e0d"
    image                                       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"     
    init                                        = false
    ip_address                                  = "172.17.0.2"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
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

### Docker `terraform state list`

```
docker_container.nginx
docker_image.nginx
```

### Docker Change infrastructure

```
~ ports {
    ~ external = 8000 -> 8080 # forces replacement
    # (3 unchanged attributes hidden)
}
```

### Docker After renaming

```
    ~ name = "tutorial" -> "ExampleNginxContainer" # forces replacement
```

### Docker `terraform output`

```
container_id = "d300cd3ea5ba1e2db3bf506ceb746a45eec36db3cb0ed173628716a4c7b70bb3"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

## AWS Terraform

### AWS `terraform show`

```
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:632657072413:instance/i-0a78dc41812d00fe8"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2b"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-0a78dc41812d00fe8"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-06acbc63c46e99826"
    private_dns                          = "ip-172-31-22-231.us-west-2.compute.internal"
    private_ip                           = "172.31.22.231"
    public_dns                           = "ec2-52-12-73-74.us-west-2.compute.amazonaws.com"
    public_ip                            = "52.12.73.74"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-081b5e47d1aee6233"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-0422143bffb5f3926",
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
        volume_id             = "vol-0672488401a78d4c7"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```

### AWS `terraform state list`

```
aws_instance.app_server
```

### AWS Change infrastructure

```
resource "aws_instance" "app_server" {
    id                                   = "i-0ba77123686d1c1fb"
    ~ instance_type                        = "t2.micro" -> "t3.micro"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    # (29 unchanged attributes hidden)

    # (7 unchanged blocks hidden)
}
```

### AWS After renaming

```
resource "aws_instance" "app_server" {
    id                                   = "i-0ba77123686d1c1fb"
    ~ tags                                 = {
        ~ "Name" = "ExampleAppServerInstance" -> "ExampleAWSContainer"
    }
    ~ tags_all                             = {
        ~ "Name" = "ExampleAppServerInstance" -> "ExampleAWSContainer"
    }
    # (27 unchanged attributes hidden)

    # (7 unchanged blocks hidden)
}
```

### AWS `terraform output`

```
aws_server_id = "i-0ba77123686d1c1fb"
```

### Best Practices

- Rewrite Terraform configuration files to a canonical format and style `terraform fmt`
- Validate the configuration: `terraform validate`
