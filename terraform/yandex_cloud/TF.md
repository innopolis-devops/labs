## terraform show

```
PS E:\Projects\Temp\terraform\yandex_cloud> terraform show
# yandex_compute_instance.default:
resource "yandex_compute_instance" "default" {
    allow_stopping_for_update = true
    created_at                = "2023-02-02T10:53:52Z"
    folder_id                 = "b1gq3c0k1g76vg1in04r"
    fqdn                      = "fhmlnrig0578ah96l74c.auto.internal"
    id                        = "fhmlnrig0578ah96l74c"
    metadata                  = {
        "foo"      = "bar"
        "ssh-keys" = "~/.ssh/id_tw.pub"
    }
    name                      = "default"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm70lk7dp5364sljipe"
        disk_id     = "fhm70lk7dp5364sljipe"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8emvfmfoaordspe1jr"
            size       = 5
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 1
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.6"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:15:be:e5:00"
        nat                = true
        nat_ip_address     = "51.250.7.8"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bhrb7ku4fqnfjgfm2a"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2023-02-02T10:50:01Z"
    folder_id  = "b1gq3c0k1g76vg1in04r"
    id         = "enp5jkbv8k3jmhu14gfo"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bhrb7ku4fqnfjgfm2a",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-02-02T10:50:02Z"
    folder_id      = "b1gq3c0k1g76vg1in04r"
    id             = "e9bhrb7ku4fqnfjgfm2a"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp5jkbv8k3jmhu14gfo"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
`

## terraform state list

`
PS E:\Projects\Temp\terraform\yandex_cloud> terraform state list
yandex_compute_instance.default
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

# Change Infrastructure

```
PS E:\Projects\Temp\terraform\yandex_cloud> terraform apply
yandex_vpc_network.network-1: Refreshing state... [id=enp5jkbv8k3jmhu14gfo]
yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9bhrb7ku4fqnfjgfm2a]
yandex_compute_instance.default: Refreshing state... [id=fhmlnrig0578ah96l74c]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.default will be updated in-place
  ~ resource "yandex_compute_instance" "default" {
        id                        = "fhmlnrig0578ah96l74c"
      ~ name                      = "default" -> "terraform"
        # (10 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

## terraform output

```
PS E:\Projects\Temp\terraform\yandex_cloud> terraform output
cores_number = 2
vm_mem = 4
```
