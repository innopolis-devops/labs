# Terraform

## Docker Container

The output of `terraform show` command is the following:

```plain
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
    hostname          = "0a8401f86d32"
    id                = "0a8401f86d32b43d1526aa684daa14a5181e94af988a1921def5d343a9022a1b"
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

And the output of `terraform state list` is:

```plain
docker_container.nginx
docker_image.nginx
```

In the main configuration file I've changed **the port number of the service**, and after running `terraform apply` it has showed me the following changelog:

```plain
~ ports {
    ~ external = 8000 -> 1337 # forces replacement
      # (3 unchanged attributes hidden)
  }
```

Then I've added a container name variable, and replaced the hard-coded string with it in the configuration file:

```plain
~ name = "tutorial" -> "ExampleNginxContainer" # forces replacement
```

And after adding the output file, I've got the corresponding result by calling the `terraform output` command after applying the changes:

```plain
container_id = "bdb7b79c2f2e7e127869fddae8a695ae7f5969e183f4deeb0d06a2bc7555f633"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```

## Amazon Web Services (AWS)

The output of `terraform show` command is the following:

```plain
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:562643328163:instance/i-00c6f76eb9fadb547"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-00c6f76eb9fadb547"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-06845190fef6115b9"
    private_dns                          = "ip-172-31-5-154.us-west-2.compute.internal"
    private_ip                           = "172.31.5.154"
    public_dns                           = "ec2-18-237-124-191.us-west-2.compute.amazonaws.com"
    public_ip                            = "18.237.124.191"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-02a4981f6666ede89"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-0034be923a084da6f",
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
        volume_id             = "vol-0ac6294b95604bec3"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```

And the output of `terraform state list` is:

```plain
aws_instance.app_server
```

In the main configuration file I've changed the **image of the service**, and after running `terraform apply` it has showed me the following changelog:

```plain
~ ami = "ami-830c94e3" -> "ami-08d70e59c07c61a3a" # forces replacement
```

Then I've added a container name variable, and replaced the hard-coded string with it in the configuration file. But for this time, I've also specified custom variable name instead of using its default value:

```bash
terraform apply -var "instance_name=AmazingName"
```

```plain
 ~ "Name" = "ExampleAppServerInstance" -> "AmazingName"
```

And after adding the output file, I've got the corresponding result by calling the `terraform output` command after applying the changes:

```plain
instance_id = "i-0316682cf958c069e"
instance_public_ip = "18.236.222.38"
```
