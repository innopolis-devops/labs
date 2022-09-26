# Best practices
- Described in [docker/TF.md](../docker/TF.md) file.

# Results
After running terraform, AWS instances were created:
<img width="800" alt="1" src="https://user-images.githubusercontent.com/49106163/192392428-d6ccd010-6fe4-4093-a0b5-65c42bc06d49.png">

# Logs

**Action:** `terraform apply`

**Output:**
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.app_server will be created
```

**Action:** `terraform show`

**Output:**
```
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:902390781417:instance/i-05a89287805a67fc1"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2a"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-05a89287805a67fc1"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-0ed9970c2e9de8e31"
    private_dns                          = "ip-172-31-20-108.us-west-2.compute.internal"
    private_ip                           = "172.31.20.108"
    public_dns                           = "ec2-35-89-28-75.us-west-2.compute.amazonaws.com"
    public_ip                            = "35.89.28.75"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-01b8569f02b79044b"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-001921ee3f5ba2ff4",
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
        volume_id             = "vol-0680865431bc9feac"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```

**Action:** `terraform state list`

**Output:**
```
aws_instance.app_server
```

**Action:** change ami ami-830c94e3 -> ami-08d70e59c07c61a3a

**Output:**
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.app_server must be replaced
-/+ resource "aws_instance" "app_server" {
      ~ ami                                  = "ami-830c94e3" -> "ami-08d70e59c07c61a3a" # forces replacement
```
...
```
aws_instance.app_server: Destroying... [id=i-05a89287805a67fc1]
aws_instance.app_server: Still destroying... [id=i-05a89287805a67fc1, 10s elapsed]
aws_instance.app_server: Still destroying... [id=i-05a89287805a67fc1, 20s elapsed]
aws_instance.app_server: Still destroying... [id=i-05a89287805a67fc1, 30s elapsed]
aws_instance.app_server: Destruction complete after 31s
aws_instance.app_server: Creating...
aws_instance.app_server: Still creating... [10s elapsed]
aws_instance.app_server: Still creating... [20s elapsed]
aws_instance.app_server: Still creating... [30s elapsed]
aws_instance.app_server: Still creating... [40s elapsed]
aws_instance.app_server: Still creating... [50s elapsed]
aws_instance.app_server: Creation complete after 57s [id=i-0d6144e6c89f1b912]
```

**Action:** Set the instance name with a variable and apply changes

**Output:**
```
aws_instance.app_server: Refreshing state... [id=i-0d6144e6c89f1b912]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.app_server will be updated in-place
  ~ resource "aws_instance" "app_server" {
        id                                   = "i-0d6144e6c89f1b912"
      ~ tags                                 = {
          ~ "Name" = "ExampleAppServerInstance" -> "AwsServerInstance"
        }
      ~ tags_all                             = {
          ~ "Name" = "ExampleAppServerInstance" -> "AwsServerInstance"
        }
```
...
```
aws_instance.app_server: Modifying... [id=i-0d6144e6c89f1b912]
aws_instance.app_server: Modifications complete after 3s [id=i-0d6144e6c89f1b912]
Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

**Action:** Set variable: `terraform apply -var "instance_name=AwsAnotherName"`

```
aws_instance.app_server: Refreshing state... [id=i-0d6144e6c89f1b912]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.app_server will be updated in-place
  ~ resource "aws_instance" "app_server" {
        id                                   = "i-0d6144e6c89f1b912"
      ~ tags                                 = {
          ~ "Name" = "AwsServerInstance" -> "AwsAnotherName"
        }
      ~ tags_all                             = {
          ~ "Name" = "AwsServerInstance" -> "AwsAnotherName"
        }
```
...
```
aws_instance.app_server: Modifying... [id=i-0d6144e6c89f1b912]
aws_instance.app_server: Modifications complete after 3s [id=i-0d6144e6c89f1b912]
```

**Action:** Add outputs.tf

**Output:**
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.app_server will be updated in-place
  ~ resource "aws_instance" "app_server" {
        id                                   = "i-0d6144e6c89f1b912"
      ~ tags                                 = {
          ~ "Name" = "AwsAnotherName" -> "AwsServerInstance"
        }
      ~ tags_all                             = {
          ~ "Name" = "AwsAnotherName" -> "AwsServerInstance"
        }
        # (29 unchanged attributes hidden)

        # (7 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  + instance_id        = "i-0d6144e6c89f1b912"
  + instance_public_ip = "18.237.102.104"
```
...
```
aws_instance.app_server: Modifying... [id=i-0d6144e6c89f1b912]
aws_instance.app_server: Modifications complete after 3s [id=i-0d6144e6c89f1b912]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

Outputs:

instance_id = "i-0d6144e6c89f1b912"
instance_public_ip = "18.237.102.104"
```

**Action:** Print output `terraform output`

**Output:**

```
instance_id = "i-0d6144e6c89f1b912"
instance_public_ip = "18.237.102.104"
```
