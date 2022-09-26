# Docker


1. output for `terraform show`

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
    hostname          = "5851e2aa9452"
    id                = "5851e2aa945275292f3b819315fd56ef6833d48cff50bfe8d4a981b3748293ff"
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
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

2. output for `terraform state list`

docker_container.nginx
docker_image.nginx


3. I changed external port from `8000` to `8888`

`terraform show` after change:

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
    hostname          = "ec095bad6597"
    id                = "ec095bad6597e93978ce5a79d16e492202f344622508cbbf9634e7c10d66eca7"
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
        external = 8888
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

4. I used input variable to change name `terraform apply -var "container_name=NewNameByDariya"`


5. output of `terraform output`:

`container_id = "b6165fa0602f5739a36b22a4944f3d7b6b8f4c116ee8b1b2841a7de10d69d56a"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"`


# AWS

1. output for `terraform show`
```
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:438267366861:instance/i-00edccbaee1b17363"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-00edccbaee1b17363"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    primary_network_interface_id         = "eni-084e7bc85f42315eb"
    private_dns                          = "ip-172-31-6-168.us-west-2.compute.internal"
    private_ip                           = "172.31.6.168"
    public_dns                           = "ec2-35-166-218-118.us-west-2.compute.amazonaws.com"
    public_ip                            = "35.166.218.118"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0e80969c883b9b428"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-032790130b1ad8781",
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
        volume_id             = "vol-0978cadeca46462be"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```

2. output for `terraform state list`

aws_instance.app_server


3. I changed ami version from "ami-830c94e3"  to "ami-08d70e59c07c61a3a"

4. I used input variable to change name `terraform apply -var "container_name=NewNameByDariya"`

5. output from ` terraform output` 

instance_id = "i-0c3f03821e078ef8a"
instance_public_ip = "35.88.96.100"

# GitHub 

1. `terraform show` output

```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "master"
    id         = "labs"
    repository = "labs"
}

# github_branch_protection.main:
resource "github_branch_protection" "main" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = false
    id                              = "BPR_kwDOH7pjJs4BvxpJ"
    pattern                         = "master"
    repository_id                   = "R_kgDOH7pjJg"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false
}

# github_repository.main:
resource "github_repository" "main" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = false
    branches                    = [
        {
            name      = "lab1"
            protected = false
        },
        {
            name      = "lab2"
            protected = false
        },
        {
            name      = "lab3"
            protected = false
        },
        {
            name      = "master"
            protected = false
        },
    ]
    default_branch              = "master"
    delete_branch_on_merge      = false
    description                 = "DevOps repository"
    etag                        = "W/\"e420f05ffcc0c0ed4ee2a70d5b44be5c0126edf7dcbdff26a1412061411fcc68\""
    full_name                   = "yadariya/labs"
    git_clone_url               = "git://github.com/yadariya/labs.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/yadariya/labs"
    http_clone_url              = "https://github.com/yadariya/labs.git"
    id                          = "labs"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "labs"
    node_id                     = "R_kgDOH7pjJg"
    private                     = false
    repo_id                     = 532308774
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:yadariya/labs.git"
    svn_url                     = "https://github.com/yadariya/labs"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}

```

teraform ouput 

```git_branches = tolist([
  {
    "name" = "lab1"
    "protected" = false
  },
  {
    "name" = "lab2"
    "protected" = false
  },
  {
    "name" = "lab3"
    "protected" = false
  },
  {
    "name" = "master"
    "protected" = false
  },
])
repository_url = "https://github.com/yadariya/labs"
```


## Best practices

- I use `terraform validate` to validate my code
- I use environment variable `GITHUB_TOKEN` for authentication to GitHub
- I use `terraform fmt` for formatting code
- I use `terraform plan` to see the future changes
- I use variables.tf to store variables
- I use outputs.tf to declare outputs
- I destroy unused resources `terraform destroy`