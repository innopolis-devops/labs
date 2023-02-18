# Terraform

## terraform show

```
PS E:\terraform\yandex_cloud> yandex_cloud % terraform show
# yandex_compute_instance.default:
resource "yandex_compute_instance" "default" {
    allow_stopping_for_update = true
    created_at                = "2023-02-18T20:16:41Z"
    folder_id                 = "b1gvt2gqnaa14cpibnrp"
    fqdn                      = "fhmbvl7b8nasrue0nca0.auto.internal"
    id                        = "fhmbvl7b8nasrue0nca0"
    metadata                  = {
        "foo"      = "bar"
        "ssh-keys" = <<-EOT
            debian:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6iPBC7qykufrgSh02rFPJkWcBaHCfy/tR/VDtpzoQel1+cQBb5M36+l/cePtg/3kCqYfjM/3OLQ3RH2pGM6udm6ngY1ZK6neilX2UBONwFsWHLfGw0aoOZ+Rp3OrcKb9xBTyuXmUhjXX5BBjPjdikKImBfPtwMPns1THeeZ+ZJz9f6F5rakWnlnwHfp9nCV84IWGP46zDOqIaNsM2DURyKjYdAbskNdS2JY+gLT4rXDocBzskkm/O442Lt40TBoybJkcGOXIn/8pF7AtB++8CXxLSrUffhciNNXAw632LoQ/gT7i2OU0MYE1x/Eow/2RYU5PgUFcshGjhqFN/k2g7 erik@debian
        EOT
    }
    name                      = "terraform"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "default-ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "fhmgui9dn3h7l1nv0fjo"
        disk_id     = "fhmgui9dn3h7l1nv0fjo"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8le2jsge1bop4m18ts"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.0.29"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:bf:d4:eb:45"
        nat                = true
        nat_ip_address     = "51.250.24.245"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bt6kvieq3lk1uor9ka"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.foo:
resource "yandex_vpc_network" "foo" {
    created_at = "2023-02-18T20:16:36Z"
    folder_id  = "b1gvt2gqnaa14cpibnrp"
    id         = "enp77ilo1s6hh6pkeq09"
    labels     = {}
    subnet_ids = []
}

# yandex_vpc_subnet.foo:
resource "yandex_vpc_subnet" "foo" {
    created_at     = "2023-02-18T20:16:38Z"
    folder_id      = "b1gvt2gqnaa14cpibnrp"
    id             = "e9bt6kvieq3lk1uor9ka"
    labels         = {}
    network_id     = "enp77ilo1s6hh6pkeq09"
    v4_cidr_blocks = [
        "192.168.0.0/16",
    ]
    v6_cidr_blocks = []
    zone           = "default-ru-central1-b"
}
```

## terraform state list

```
PS E:\terraform\yandex_cloud> yandex_cloud % terraform state list
yandex_compute_instance.default
yandex_vpc_network.foo
yandex_vpc_subnet.foo
```

## Change Infrastructure

```
PS E:\terraform\yandex_cloud> yandex_cloud % terraform apply
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.default will be updated in-place
  ~ resource "yandex_compute_instance" "default" {
        id                        = "fhmbvl7b8nasrue0nca0"
        name                      = "terraform"
        # (10 unchanged attributes hidden)

      ~ resources {
          ~ memory        = 2 -> 4
            # (3 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

## terraform output

```
cores_number = 2
external_ip_address = "51.250.24.245"
memory_amount = 4
```