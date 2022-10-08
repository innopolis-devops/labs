# Terraform

## 0. Terraform Good Practices
- Split configuration into several files
- Organize files by workspaces in first-level directories and by projects in the second-level directories
- Use `variables.tf` for tokens' security
- Using `teraform fmt` to check if the files are correctly formated
- Using `terraform validate` to check the validity of the terraform code

<br>

## 1. Docker steps and output

### 1.1 Installing Terraform and building infrastructure

<br>

From the directory where the `main.tf` is located, I used the command:

```
terraform apply
```

To view the built infrastructure, I used the commands below:

```
terraform show
```
Output: 

```
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
    hostname          = "75448bde3c27"
    id                = "75448bde3c27315d77cf77e2323efe5519868659a7ae76edefbf3dab42b7fc9c"
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
    runtime           = "runc"
    security_opts     = []
    shm_size          = 64
    start             = true
    stdin_open        = false
    stop_signal       = "SIGQUIT"
    stop_timeout      = 0
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
    image_id     = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    keep_locally = false
    latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

```
 terraform state list
```
Output: 

```
docker_container.nginx
docker_image.nginx
```

### 1.2 Changing infrastructure

<br>

Change log is displayed below:

```
terraform show
```
Output: 

```
docker_image.nginx: Refreshing state... [id=sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest]
docker_container.nginx: Refreshing state... [id=75448bde3c27315d77cf77e2323efe5519868659a7ae76edefbf3dab42b7fc9c]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
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
      ~ hostname          = "75448bde3c27" -> (known after apply)
      ~ id                = "75448bde3c27315d77cf77e2323efe5519868659a7ae76edefbf3dab42b7fc9c" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      ~ log_driver        = "json-file" -> (known after apply)
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
      ~ runtime           = "runc" -> (known after apply)
      ~ security_opts     = [] -> (known after apply)
      ~ shm_size          = 64 -> (known after apply)
      ~ stop_signal       = "SIGQUIT" -> (known after apply)
      ~ stop_timeout      = 0 -> (known after apply)
      - storage_opts      = {} -> null
      - sysctls           = {} -> null
      - tmpfs             = {} -> null
        # (11 unchanged attributes hidden)

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

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.nginx: Destroying... [id=75448bde3c27315d77cf77e2323efe5519868659a7ae76edefbf3dab42b7fc9c]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 0s [id=267a5664aab8ce9a38ac6c25656fbaece59f644115d49835b1e54b991f653518]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

### 1.3 Terraform output.

<br>

Command:
```
terraform output
```

output:
```
container_id = "c7c1571be6d03e36015f934b995436b17180ff67953b4bbc7801fd5f105d46d5"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```

<br>

## 2. Yandex Cloud

```
terraform show
```

```
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    allow_stopping_for_update = true
    created_at                = "2022-10-04T06:30:27Z"
    folder_id                 = "b1gua67r1utsreuh35jj"
    fqdn                      = "fhm6pp15qfl25ch1c3rh.auto.internal"
    id                        = "fhm6pp15qfl25ch1c3rh"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjZEREUs6lEznAuF3h7a380tExW+xmgUtmhkVd96nFeos1IRexQTDiWTcJFKDAYRDiewZfzm0xUyB2r7PqBa1mdBq+x72JTs0BYdIt0ICiqGzJ2cmb4fu1PsIORTDG9+DDNUnleooPo0Omo33BlKuU4j+go+LWJb8U8v6rKVtS2k4WrE7nyBKnopmo1w8U1+8O+hFzgDJMgfksh5wOH9HYmZb5VFgc0MvraQ2rqm1og0psUtt07Cwmbur2+U4evP21Uu0/aGBAChkDzYQkJynA/QSlqlNKskaMHwNVyr/Bj7+Va4ULQe6YiirrDsn/OO0z7VzySbmXyonDglVU4BxX desmigor@MIs-Mac.local
        EOT
    }
    name                      = "terraform-app"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmg4c04tk384npvgc5u"
        disk_id     = "fhmg4c04tk384npvgc5u"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8ip4qsne4vvmq4rnm5"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.18"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:6c:e4:25:d3"
        nat                = true
        nat_ip_address     = "130.193.37.79"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b3co2i1310lmeokff9"
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

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-10-04T06:25:49Z"
    folder_id  = "b1gua67r1utsreuh35jj"
    id         = "enpb667kklk2bor0tjiv"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9b3co2i1310lmeokff9",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-10-04T06:25:50Z"
    folder_id      = "b1gua67r1utsreuh35jj"
    id             = "e9b3co2i1310lmeokff9"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpb667kklk2bor0tjiv"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
```

```
terraform output
```

```
external_ip_address_vm_1 = "130.193.37.79"
internal_ip_address_vm_1 = "192.168.10.18"
```

## 3. Github steps and output

### 3.1 Creating a Github repository and checking the state

To view the built infrastructure after applying, I used the commands below:

```
terraform show
```

output:
```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "new-terraform-repository"
    repository = "new-terraform-repository"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOIEtNqM4Bv8kg"
    pattern                         = "main"
    repository_id                   = "new-terraform-repository"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false
}

# github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "The magic that terraform does"
    etag                        = "W/\"064252cdc44379105ab4d6dd3b3533199a6e0e0428b640bf34c3524960359b1a\""
    full_name                   = "desmigor/new-terraform-repository"
    git_clone_url               = "git://github.com/desmigor/new-terraform-repository.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/desmigor/new-terraform-repository"
    http_clone_url              = "https://github.com/desmigor/new-terraform-repository.git"
    id                          = "new-terraform-repository"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "new-terraform-repository"
    node_id                     = "R_kgDOIEtNqA"
    private                     = false
    repo_id                     = 541805992
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:desmigor/new-terraform-repository.git"
    svn_url                     = "https://github.com/desmigor/new-terraform-repository"
    visibility                  = "public"
    vulnerability_alerts        = false
}
```

Command:
```
 terraform state list
```

output:
```
github_branch_default.main
github_branch_protection.default
github_repository.repo
```

Created Repository link: [View here](https://github.com/desmigor/new-terraform-repository)

### 2.2 Importing existing repository.

I imported the labs repository using:

```
terraform import "github_repository.devops-labs-terraform" "devops-labs" 
````

Checking the new state:
```
 terraform state list
```

output:
```
github_branch_default.main
github_branch_protection.default
github_repository.devops-labs-terraform
github_repository.repo
```



