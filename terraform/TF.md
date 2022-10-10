# Terraform
## Terraform Good Practices
* Split configuration into several files
* Organize files by workspaces in first-level directories and by projects in the second-level directories
* Use variables.tf for tokens' security
* Using terraform fmt to check if the files are correctly formated
* Using terraform validate to check the validity of the terraform code

## Docker steps and output
#### Installing Terraform and building infrastructure
From the directory where the main.tf is located, I used the command
`terraform apply`
then to view the built infrastructure
`terraform show`

I received next output:
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
    hostname          = "fb4be98db716"
    id                = "fb4be98db716ba09f6ca86685138a4fbddda418cdf30a816207250159be8acc6"
    image             = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
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
    name              = "ExampleNginxContainer"
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
        external = 8080
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


Outputs:

container_id = "fb4be98db716ba09f6ca86685138a4fbddda418cdf30a816207250159be8acc6"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"

```

Output from `terraform state list`:
```
docker_container.nginx
docker_image.nginx
```

#### Changing infrastructure and viewing logs
I changed the name of the container, and applied the changes
(`terraform apply`)
output:
```
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297
444nginx:latest]
docker_container.nginx: Refreshing state... [id=fb4be98db716ba09f6ca86685138a4fbddda418cdf30a816207250159be8acc6
]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated  
with the following symbols:
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
      ~ hostname          = "fb4be98db716" -> (known after apply)
      ~ id                = "fb4be98db716ba09f6ca86685138a4fbddda418cdf30a816207250159be8acc6" -> (known after a
pply)
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
      ~ name              = "ExampleNginxContainer" -> "AnotherOneContainer" # forces replacement
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

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ container_id = "fb4be98db716ba09f6ca86685138a4fbddda418cdf30a816207250159be8acc6" -> (known after apply)    
╷
│ Warning: Deprecated attribute
│
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.nginx: Destroying... [id=fb4be98db716ba09f6ca86685138a4fbddda418cdf30a816207250159be8acc6]
docker_container.nginx: Destruction complete after 1s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 0s [id=2e6d5169ab49bfe4dbf9d7623101b8cddf4606c8dbc9ea7d0d3b62b85
5c579ba]
╷
│ Warning: Deprecated attribute
│
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

container_id = "2e6d5169ab49bfe4dbf9d7623101b8cddf4606c8dbc9ea7d0d3b62b855c579ba"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

## AWS
#### Creating instance
Output:
```
...
aws_instance.app_server: Creating...
aws_instance.app_server: Still creating... [10s elapsed]
aws_instance.app_server: Still creating... [20s elapsed]
aws_instance.app_server: Still creating... [30s elapsed]
aws_instance.app_server: Still creating... [40s elapsed]
aws_instance.app_server: Still creating... [50s elapsed]
aws_instance.app_server: Creation complete after 56s [id=i-01a240d9c9ed3934d]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
Output of `terraform state list` - `aws_instance.app_server`

## Github steps and output
#### Creating a Github repository and checking the state
To view the built infrastructure after applying, I typed
`terraform state list`
and get:
```
github_branch_default.main
github_branch_protection.default
github_repository.repo
```
[Created repo](https://github.com/Amirka-Kh/develop-with-terraform)

#### Importing existing repository.
I imported the labs repository
`terraform import "github_repository.devops-labs-terraform" "devops-labs"` 
and get next output:
```
github_repository.devops-with-terraform: Importing from ID "devops-labs"...
github_repository.devops-with-terraform: Import prepared!
  Prepared github_repository for import
github_repository.devops-with-terraform: Refreshing state... [id=devops-labs]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

Output of `terraform state list` command:
```
github_branch_default.main
github_branch_protection.default
github_repository.devops-labs-terraform
github_repository.repo
```