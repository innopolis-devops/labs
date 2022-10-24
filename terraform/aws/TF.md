# AWS terraform

Initial confiiguratoin `terraform show`:

```bash
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-026b57f3c383c2eec"
    arn                                  = "arn:aws:ec2:us-east-1:626102460181:instance/i-0db53e9cb570aba00"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1b"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-0db53e9cb570aba00"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-0d73238d55e554523"
    private_dns                          = "ip-172-31-84-180.ec2.internal"
    private_ip                           = "172.31.84.180"
    public_dns                           = "ec2-54-175-177-183.compute-1.amazonaws.com"
    public_ip                            = "54.175.177.183"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0fb2af8bd4852a11a"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-0c5a4328c682e3ba1",
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
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-0c255cf0dc8ba7252"
        volume_size           = 8
        volume_type           = "gp2"
    }
}


Outputs:

instance_id = "i-0db53e9cb570aba00"
instance_public_ip = "54.175.177.183"
```

``terraform state list``:

```bash
aws_instance.app_server
```

After changing AWS instance name inside `main.tf` and applying chages following console
output was shown:

```bash
Terraform will perform the following actions:

  # aws_instance.app_server will be updated in-place
  ~ resource "aws_instance" "app_server" {
        id                                   = "i-0db53e9cb570aba00"
      ~ tags                                 = {
          ~ "Name" = "ExampleAppServerInstance" -> "ServerInstance"
        }
      ~ tags_all                             = {
          ~ "Name" = "ExampleAppServerInstance" -> "ServerInstance"
        }
        # (29 unchanged attributes hidden)

        # (7 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

`terraform output`:

```bash
instance_id = "i-0db53e9cb570aba00"
instance_public_ip = "54.175.177.183"
```
