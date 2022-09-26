# AWS provider

## Excution 

* First, I created ```main.tf``` file, and run the following commands:

- ```terraform init ```
- ```terrform init ```
- ```terraform validate```
- ```terraform fmt```


* Then after making sure everything is right, I run the following command ```terraform show```, the output was:

```
khalil@khalil-X556URK:~/Desktop/spam/Devops-labs/terraform/AWS$ terraform show
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-0f924dc71d44d23e2"
    arn                                  = "arn:aws:ec2:us-east-2:812955754403:instance/i-0fe0872e44ae0273c"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-2c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-0fe0872e44ae0273c"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-0df04a3f954a04a8b"
    private_dns                          = "ip-172-31-35-69.us-east-2.compute.internal"
    private_ip                           = "172.31.35.69"
    public_dns                           = "ec2-18-118-130-128.us-east-2.compute.amazonaws.com"
    public_ip                            = "18.118.130.128"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-dcd2ef90"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-e8c21ba4",
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
        volume_id             = "vol-0ed122fa7d2b9391d"
        volume_size           = 8
        volume_type           = "gp2"
    }
}

```

* and after running ```terraform state list``` we got:

```
aws_instance.app_server

```

* After changing the infrastructure (update the ami from Amazon Linux to Ubuntu 22.04):
```
aws_instance.app_server: Refreshing state... [id=i-0fe0872e44ae0273c]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.app_server must be replaced
-/+ resource "aws_instance" "app_server" {
      ~ ami                                  = "ami-0f924dc71d44d23e2" -> "ami-097a2df4ac947655f" # forces replacement
      ~ arn                                  = "arn:aws:ec2:us-east-2:812955754403:instance/i-0fe0872e44ae0273c" -> (known after apply)
      ~ associate_public_ip_address          = true -> (known after apply)
      ~ availability_zone                    = "us-east-2c" -> (known after apply)
      ~ cpu_core_count                       = 1 -> (known after apply)
      ~ cpu_threads_per_core                 = 1 -> (known after apply)
      ~ disable_api_stop                     = false -> (known after apply)
      ~ disable_api_termination              = false -> (known after apply)
      ~ ebs_optimized                        = false -> (known after apply)
      - hibernation                          = false -> null
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      ~ id                                   = "i-0fe0872e44ae0273c" -> (known after apply)
      ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
      ~ instance_state                       = "running" -> (known after apply)
      ~ ipv6_address_count                   = 0 -> (known after apply)
      ~ ipv6_addresses                       = [] -> (known after apply)
      + key_name                             = (known after apply)
      ~ monitoring                           = false -> (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      ~ primary_network_interface_id         = "eni-0df04a3f954a04a8b" -> (known after apply)
      ~ private_dns                          = "ip-172-31-35-69.us-east-2.compute.internal" -> (known after apply)
      ~ private_ip                           = "172.31.35.69" -> (known after apply)
      ~ public_dns                           = "ec2-18-118-130-128.us-east-2.compute.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "18.118.130.128" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [
          - "default",
        ] -> (known after apply)
      ~ subnet_id                            = "subnet-dcd2ef90" -> (known after apply)
        tags                                 = {
            "Name" = "ExampleAppServerInstance"
        }
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-e8c21ba4",
        ] -> (known after apply)
        # (5 unchanged attributes hidden)

      ~ capacity_reservation_specification {
          ~ capacity_reservation_preference = "open" -> (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id                 = (known after apply)
              + capacity_reservation_resource_group_arn = (known after apply)
            }
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      ~ enclave_options {
          ~ enabled = false -> (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      ~ maintenance_options {
          ~ auto_recovery = "default" -> (known after apply)
        }

      ~ metadata_options {
          ~ http_endpoint               = "enabled" -> (known after apply)
          ~ http_put_response_hop_limit = 1 -> (known after apply)
          ~ http_tokens                 = "optional" -> (known after apply)
          ~ instance_metadata_tags      = "disabled" -> (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_card_index    = (known after apply)
          + network_interface_id  = (known after apply)
        }

      ~ private_dns_name_options {
          ~ enable_resource_name_dns_a_record    = false -> (known after apply)
          ~ enable_resource_name_dns_aaaa_record = false -> (known after apply)
          ~ hostname_type                        = "ip-name" -> (known after apply)
        }

      ~ root_block_device {
          ~ delete_on_termination = true -> (known after apply)
          ~ device_name           = "/dev/xvda" -> (known after apply)
          ~ encrypted             = false -> (known after apply)
          ~ iops                  = 100 -> (known after apply)
          + kms_key_id            = (known after apply)
          ~ tags                  = {} -> (known after apply)
          ~ throughput            = 0 -> (known after apply)
          ~ volume_id             = "vol-0ed122fa7d2b9391d" -> (known after apply)
          ~ volume_size           = 8 -> (known after apply)
          ~ volume_type           = "gp2" -> (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.app_server: Destroying... [id=i-0fe0872e44ae0273c]
aws_instance.app_server: Still destroying... [id=i-0fe0872e44ae0273c, 10s elapsed]
aws_instance.app_server: Still destroying... [id=i-0fe0872e44ae0273c, 20s elapsed]
aws_instance.app_server: Still destroying... [id=i-0fe0872e44ae0273c, 30s elapsed]
aws_instance.app_server: Destruction complete after 31s
aws_instance.app_server: Creating...
aws_instance.app_server: Still creating... [10s elapsed]
aws_instance.app_server: Still creating... [20s elapsed]
aws_instance.app_server: Still creating... [30s elapsed]
aws_instance.app_server: Creation complete after 35s [id=i-0b882fa39b1113c16]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

```
* used variables 
* check the output:

```
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

instance_id = "i-0b882fa39b1113c16"
instance_public_ip = "3.144.74.246"

```

