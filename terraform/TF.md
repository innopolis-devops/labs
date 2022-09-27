# terraform
## docker
### some outputs
1. for `terraform show`

![image](https://user-images.githubusercontent.com/63815121/192403397-1ec662b8-2130-4dd3-8ff0-7bc069ace92a.png)

2. for `terraform state list`

![image](https://user-images.githubusercontent.com/63815121/192400216-5aa94b86-e834-4d67-88db-50f18809e62b.png)


### change infrastucture
i changed external port to 1337 cuz im a true hazker, so this is the part which has been changed

![image](https://user-images.githubusercontent.com/63815121/192401109-2ec0fe60-b82e-4d28-8038-801dc8c55d5f.png)

### rename container using variables
variable `container_name` was added into .tf file beforehead

![image](https://user-images.githubusercontent.com/63815121/192401598-8945dfa7-142a-414c-a9e0-f0f01851c735.png)


### terraform output
yes i destroyed and build again so what

![image](https://user-images.githubusercontent.com/63815121/192402402-6d75d784-dd9d-4c77-8116-1b2b0fed9fb4.png)


## yandex
### some outputs
1. for `terraform show`

```bash
terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-27T09:01:55Z"
    folder_id                 = "b1gqfupjv95f1jvij1im"
    fqdn                      = "fhmvu1lp2s69qkhr9aoq.auto.internal"
    id                        = "fhmvu1lp2s69qkhr9aoq"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4YBm3hC9yrSXc5uiUgYVhnjJdlHu7FJ6ijf+HtCbboQtuPu+KIAjepkF5RZtu+i6fCn7aZXAndF8ZToFQqXgazpv0yZ2zLtMj8P3pSlvv+2YOBc3HNpVZN5xf+JoH+
Zc05/cpJx7rp2bAaLJO2LF6tnTH9B1hrY7M/vLYBdlsPnNWDNV3nfVhyuE5zCCNznEdkrgv8ml9MZXjnxAb/Nw+4gRlGV10fWA9tqgvOlF1AAKGT36xz4b6jkS9PcuWLLl0l3WlpJhMD2TpJWstuqiBLMUZu07kCURG5wMRIO3L1OPeiPGdKrdfr
jiLFF1RD+azRl5Lv2AQu6HdFuCLf2FX kseniya@DESKTOP-3TRGV59
        EOT
    }
    name                      = "test1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm7t7g9ko60edmi5p64"
        disk_id     = "fhm7t7g9ko60edmi5p64"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8lbi4hr72am1eb2kmf"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.28"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1f:f0:6b:91"
        nat                = true
        nat_ip_address     = "178.154.207.49"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bprvoki29oikuf49c1"
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

# yandex_compute_instance.vm-2:
resource "yandex_compute_instance" "vm-2" {
    created_at                = "2022-09-27T09:01:55Z"
    folder_id                 = "b1gqfupjv95f1jvij1im"
    fqdn                      = "fhmkpoh5l69a2gu212lh.auto.internal"
    id                        = "fhmkpoh5l69a2gu212lh"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4YBm3hC9yrSXc5uiUgYVhnjJdlHu7FJ6ijf+HtCbboQtuPu+KIAjepkF5RZtu+i6fCn7aZXAndF8ZToFQqXgazpv0yZ2zLtMj8P3pSlvv+2YOBc3HNpVZN5xf+JoH+
Zc05/cpJx7rp2bAaLJO2LF6tnTH9B1hrY7M/vLYBdlsPnNWDNV3nfVhyuE5zCCNznEdkrgv8ml9MZXjnxAb/Nw+4gRlGV10fWA9tqgvOlF1AAKGT36xz4b6jkS9PcuWLLl0l3WlpJhMD2TpJWstuqiBLMUZu07kCURG5wMRIO3L1OPeiPGdKrdfr
jiLFF1RD+azRl5Lv2AQu6HdFuCLf2FX kseniya@DESKTOP-3TRGV59
        EOT
    }
    name                      = "test2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmdmpq00fsj6inpmdh6"
        disk_id     = "fhmdmpq00fsj6inpmdh6"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8lbi4hr72am1eb2kmf"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.5"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:14:ce:22:5a"
        nat                = true
        nat_ip_address     = "178.154.200.185"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bprvoki29oikuf49c1"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 4
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-27T09:01:51Z"
    folder_id  = "b1gqfupjv95f1jvij1im"
    id         = "enpfof2p44pgkd2akl89"
    labels     = {}
    name       = "network1"
    subnet_ids = []
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-27T09:01:53Z"
    folder_id      = "b1gqfupjv95f1jvij1im"
    id             = "e9bprvoki29oikuf49c1"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpfof2p44pgkd2akl89"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "178.154.207.49"
external_ip_address_vm_2 = "178.154.200.185"
internal_ip_address_vm_1 = "192.168.10.28"
internal_ip_address_vm_2 = "192.168.10.5"

```


2. for `terraform state list`

![image](https://user-images.githubusercontent.com/63815121/192484645-e82377eb-ab64-4324-831c-8fd4d1b15f0c.png)



## github
check out the repo [here](https://github.com/molberte/devops-generated-repo)

1. `terraform state list` and `terraform output` in a single pic

![image](https://user-images.githubusercontent.com/63815121/192494707-aa9048e5-08a9-403e-b665-5de0b86b7ddc.png)

2. `terraform import "github_repository.repo" "devops_labs"`

![image](https://user-images.githubusercontent.com/63815121/192501763-55fca8f2-db0e-4cf7-a28f-8708b26b7087.png)


### best practices
1. separate variable and output (didn't know that for the docker part so i left it as it is)
2. store secrets as environment variables
3. keep modules and environment implementation code separate
