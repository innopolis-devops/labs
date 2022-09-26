# Best practices applied

- Tokens in env var
- Outputs in outputs.tf
- Vars in variables.tf
- main.tf for each terraform directory
- Don't commit state files to VCS

# Terraform with Docker

`terraform show`

```terraform
# docker_container.nginx:
resource "docker_container" "nginx" {
  attach  = false
  command = [
    "nginx",
    "-g",
    "daemon off;",
  ]
  cpu_shares = 0
  entrypoint = [
    "/docker-entrypoint.sh",
  ]
  env              = []
  gateway          = "172.17.0.1"
  hostname         = "6a9191ccac1b"
  id               = "6a9191ccac1b74b333103f479185330d78046d24dc21ac430903e59e18295b99"
  image            = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
  init             = false
  ip_address       = "172.17.0.2"
  ip_prefix_length = 16
  ipc_mode         = "private"
  log_driver       = "json-file"
  logs             = false
  max_retry_count  = 0
  memory           = 0
  memory_swap      = 0
  must_run         = true
  name             = "tutorial"
  network_data     = [
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


Outputs :

container_id = "6a9191ccac1b74b333103f479185330d78046d24dc21ac430903e59e18295b99"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

`terraform state list`

```
docker_container.nginx
docker_image.nginx
```

## change infrastructure

`terraform apply`

```terraform
 terraform apply
docker_image.nginx : Refreshing state... [id = sha256 :2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx : latest
]
docker_container.nginx : Refreshing state... [id = 6a9191ccac1b74b333103f479185330d78046d24dc21ac430903e59e18295b99]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols :
-/+ destroy and then create replacement

Terraform will perform the following actions :

# docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {
+ bridge = (known after apply)
~ command           = [
- "nginx",
- "-g",
- "daemon off;",
] -> (known after apply)
+ container_logs = (known after apply)
- cpu_shares = 0 -> null
- dns = [] -> null
- dns_opts = [
] -> null
- dns_search = [] -> null
~ entrypoint        = [
- "/docker-entrypoint.sh",
] -> (known after apply)
~ env = [] -> (known after apply)
+ exit_code = (known after apply)
~ gateway = "172.17.0.1" -> (known after apply)
- group_add = [
] -> null
~ hostname = "6a9191ccac1b" -> (known after apply)
~ id = "6a9191ccac1b74b333103f479185330d78046d24dc21ac430903e59e18295b99" -> (known after apply)
~ init = false -> (known after apply)
~ ip_address = "172.17.0.2" -> (known after apply)
~ ip_prefix_length = 16 -> (known after apply)
~ ipc_mode = "private" -> (known after apply)
- links             = [] -> null
- log_opts = {} -> null
- max_retry_count = 0 -> null
- memory = 0 -> null
- memory_swap = 0 -> null
~ name = "tutorial" -> "docker-main.tf-container" # forces replacement
~ network_data = [
- {
- gateway = "172.17.0.1"
- global_ipv6_address = ""
- global_ipv6_prefix_length = 0
- ip_address = "172.17.0.2"
- ip_prefix_length = 16
- ipv6_gateway = ""
- network_name = "bridge"
},
] -> (known after apply)
- network_mode = "default" -> null
- privileged = false -> null
- publish_all_ports = false -> null
~ security_opts = [] -> (known after apply)
~ shm_size = 64 -> (known after apply)
- sysctls = {} -> null
- tmpfs = {} -> null
# (12 unchanged attributes hidden)

+ healthcheck {
+ interval = (known after apply)
+ retries      = (known after apply)
+ start_period = (known after apply)
+ test = (known after apply)
+ timeout = (known after apply)
}

+ labels {
+ label = (known after apply)
+ value = (known after apply)
}

~ ports {
~ external = 8000 -> 8081 # forces replacement
# (3 unchanged attributes hidden)
}
}

Plan : 1 to add, 0 to change, 1 to destroy.

Changes to Outputs :
~ container_id = "6a9191ccac1b74b333103f479185330d78046d24dc21ac430903e59e18295b99" -> (known after apply)
╷
│ Warning : Deprecated attribute
│
│   on main.tf line 18, in resource "docker_container" "nginx" :
│   18 : image = docker_image.nginx.latest
│
│ The attribute "latest" is deprecated.Refer to the provider documentation for details.
│
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value : yes

docker_container.nginx : Destroying... [
id = 6a9191ccac1b74b333103f479185330d78046d24dc21ac430903e59e18295b99
]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx : Creating...
docker_container.nginx : Creation complete after 0s [
id = 097455878ed90f6a80b755dd517c1d06d2beb62a3c2ca7b3cd2672692b002e91
]
╷
│ Warning: Deprecated attribute
│
│   on main.tf line 18, in resource "docker_container" "nginx" :
│   18 :   image = docker_image.nginx.latest
│
│ The attribute "latest" is deprecated.Refer to the provider documentation for details.
│
│ (and one more similar warning elsewhere)
╵

Apply complete!Resources : 1 added, 0 changed, 1 destroyed.

Outputs :

container_id = "097455878ed90f6a80b755dd517c1d06d2beb62a3c2ca7b3cd2672692b002e91"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

`terraform show`

```terraform

# docker_container.nginx:
resource "docker_container" "nginx" {
  attach  = false
  command = [
    "nginx",
    "-g",
    "daemon off;",
  ]
  cpu_shares = 0
  entrypoint = [
    "/docker-entrypoint.sh",
  ]
  env              = []
  gateway          = "172.17.0.1"
  hostname         = "097455878ed9"
  id               = "097455878ed90f6a80b755dd517c1d06d2beb62a3c2ca7b3cd2672692b002e91"
  image            = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
  init             = false
  ip_address       = "172.17.0.2"
  ip_prefix_length = 16
  ipc_mode         = "private"
  log_driver       = "json-file"
  logs             = false
  max_retry_count  = 0
  memory           = 0
  memory_swap      = 0
  must_run         = true
  name             = "docker-main.tf-container"
  network_data     = [
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
    external = 8081
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


Outputs :

container_id = "097455878ed90f6a80b755dd517c1d06d2beb62a3c2ca7b3cd2672692b002e91"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

## rename container thru var

`terraform apply`

## output

`terraform output`

```zsh
container_id = "191182293ecb752519df47c72169705e7d0c8898d8c30268a8e1b06e99a2c705"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

# Terraform with AWS

`terraform init`

```
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 4.16"...
- Installing hashicorp/aws v4.32.0...
- Installed hashicorp/aws v4.32.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

`terraform validate`
`Success! The configuration is valid.`

`terraform apply`

```terraform
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols :
+ create

Terraform will perform the following actions :

# aws_instance.app_server will be created
+ resource "aws_instance" "app_server" {
+ ami = "ami-830c94e3"
+ arn = (known after apply)
+ associate_public_ip_address = (known after apply)
+ availability_zone = (known after apply)
+ cpu_core_count                       = (known after apply)
+ cpu_threads_per_core = (known after apply)
+ disable_api_stop = (known after apply)
+ disable_api_termination = (known after apply)
+ ebs_optimized = (known after apply)
+ get_password_data                    = false
+ host_id = (known after apply)
+ host_resource_group_arn = (known after apply)
+ id                                   = (known after apply)
+ instance_initiated_shutdown_behavior = (known after apply)
+ instance_state = (known after apply)
+ instance_type = "t2.micro"
+ ipv6_address_count = (known after apply)
+ ipv6_addresses = (known after apply)
+ key_name = (known after apply)
+ monitoring = (known after apply)
+ outpost_arn                          = (known after apply)
+ password_data = (known after apply)
+ placement_group = (known after apply)
+ placement_partition_number = (known after apply)
+ primary_network_interface_id = (known after apply)
+ private_dns                          = (known after apply)
+ private_ip = (known after apply)
+ public_dns = (known after apply)
+ public_ip = (known after apply)
+ secondary_private_ips = (known after apply)
+ security_groups                      = (known after apply)
+ source_dest_check = true
+ subnet_id = (known after apply)
+ tags                                 = {
+ "Name" = "ExampleAppServerInstance"
}
+ tags_all = {
+ "Name" = "ExampleAppServerInstance"
}
+ tenancy = (known after apply)
+ user_data                            = (known after apply)
+ user_data_base64 = (known after apply)
+ user_data_replace_on_change = false
+ vpc_security_group_ids               = (known after apply)

+ capacity_reservation_specification {
+ capacity_reservation_preference = (known after apply)

+ capacity_reservation_target {
+ capacity_reservation_id = (known after apply)
+ capacity_reservation_resource_group_arn = (known after apply)
}
}

+ ebs_block_device {
+ delete_on_termination = (known after apply)
+ device_name           = (known after apply)
+ encrypted = (known after apply)
+ iops = (known after apply)
+ kms_key_id = (known after apply)
+ snapshot_id = (known after apply)
+ tags                  = (known after apply)
+ throughput = (known after apply)
+ volume_id = (known after apply)
+ volume_size = (known after apply)
+ volume_type = (known after apply)
}

+ enclave_options {
+ enabled = (known after apply)
}

+ ephemeral_block_device {
+ device_name = (known after apply)
+ no_device    = (known after apply)
+ virtual_name = (known after apply)
}

+ maintenance_options {
+ auto_recovery = (known after apply)
}

+ metadata_options {
+ http_endpoint = (known after apply)
+ http_put_response_hop_limit = (known after apply)
+ http_tokens = (known after apply)
+ instance_metadata_tags = (known after apply)
}

+ network_interface {
+ delete_on_termination = (known after apply)
+ device_index          = (known after apply)
+ network_card_index = (known after apply)
+ network_interface_id = (known after apply)
}

+ private_dns_name_options {
+ enable_resource_name_dns_a_record = (known after apply)
+ enable_resource_name_dns_aaaa_record = (known after apply)
+ hostname_type = (known after apply)
}

+ root_block_device {
+ delete_on_termination = (known after apply)
+ device_name           = (known after apply)
+ encrypted = (known after apply)
+ iops = (known after apply)
+ kms_key_id = (known after apply)
+ tags = (known after apply)
+ throughput            = (known after apply)
+ volume_id = (known after apply)
+ volume_size = (known after apply)
+ volume_type = (known after apply)
}
}

Plan : 1 to add, 0 to change, 0 to destroy.

Changes to Outputs :
+ instance = (known after apply)

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value : yes

aws_instance.app_server : Creating...
aws_instance.app_server : Still creating... [
10s elapsed
]
╷
│ Error : waiting for EC2 Instance (i-01578bef2f0c09697) create : RequestError : send request failed
│ caused by : Post "https://ec2.us-west-2.amazonaws.com/" : read tcp 10.8.0.6 : 54577->52.119.164.21: 443 : read : connection reset by peer
│
│   with aws_instance.app_server,
│   on main.tf line 16, in resource "aws_instance" "app_server" :
│   16 : resource "aws_instance" "app_server" {
│
╵
```

`terraform show`

```zsh
# aws_instance.app_server: (tainted)
resource "aws_instance" "app_server" {
ami                         = "ami-830c94e3"
get_password_data           = false
id                          = "i-01578bef2f0c09697"
instance_type               = "t2.micro"
secondary_private_ips       = []
security_groups             = []
source_dest_check           = true
tags                        = {
"Name" = "ExampleAppServerInstance"
}
tags_all                    = {
"Name" = "ExampleAppServerInstance"
}
user_data_replace_on_change = false
vpc_security_group_ids      = []
}
```

`terraform state list`

```
aws_instance.app_server
```

## rename container thru var & change infrastructure

i changed name to var.instance_name (so `-var "instance_name=yetAnotherName` to use)

`terraform apply`

```terraform

aws_instance.app_server : Refreshing state... [id = i-01578bef2f0c09697]

Terraform used the selected providers to generate the following execution plan.Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions :

# aws_instance.app_server is tainted, so must be replaced
-/+ resource "aws_instance" "app_server" {
~ arn = "arn:aws:ec2:us-west-2:632657072413:instance/i-01578bef2f0c09697" -> (known after apply)
~ associate_public_ip_address = true -> (known after apply)
~ availability_zone = "us-west-2b" -> (known after apply)
~ cpu_core_count = 1 -> (known after apply)
~ cpu_threads_per_core = 1 -> (known after apply)
~ disable_api_stop = false -> (known after apply)
~ disable_api_termination = false -> (known after apply)
~ ebs_optimized = false -> (known after apply)
- hibernation                          = false -> null
+ host_id = (known after apply)
+ host_resource_group_arn = (known after apply)
~ id = "i-01578bef2f0c09697" -> (known after apply)
~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
~ instance_state = "running" -> (known after apply)
~ ipv6_address_count = 0 -> (known after apply)
~ ipv6_addresses = [] -> (known after apply)
+ key_name = (known after apply)
~ monitoring = false -> (known after apply)
+ outpost_arn = (known after apply)
+ password_data = (known after apply)
+ placement_group = (known after apply)
+ placement_partition_number = (known after apply)
~ primary_network_interface_id         = "eni-0216720fe3aab4652" -> (known after apply)
~ private_dns = "ip-172-31-27-151.us-west-2.compute.internal" -> (known after apply)
~ private_ip = "172.31.27.151" -> (known after apply)
~ public_dns = "ec2-34-216-171-181.us-west-2.compute.amazonaws.com" -> (known after apply)
~ public_ip = "34.216.171.181" -> (known after apply)
~ secondary_private_ips = [] -> (known after apply)
~ security_groups = [
- "default",
] -> (known after apply)
~ subnet_id = "subnet-081b5e47d1aee6233" -> (known after apply)
~ tags = {
~ "Name" = "ExampleAppServerInstance" -> "ExampleAwsInstance"
}
~ tags_all = {
~ "Name" = "ExampleAppServerInstance" -> "ExampleAwsInstance"
}
~ tenancy = "default" -> (known after apply)
+ user_data = (known after apply)
+ user_data_base64 = (known after apply)
~ vpc_security_group_ids = [
- "sg-0422143bffb5f3926",
] -> (known after apply)
# (5 unchanged attributes hidden)

~ capacity_reservation_specification {
~ capacity_reservation_preference = "open" -> (known after apply)

+ capacity_reservation_target {
+ capacity_reservation_id = (known after apply)
+ capacity_reservation_resource_group_arn = (known after apply)
}
}

- credit_specification {
- cpu_credits = "standard" -> null
}

+ ebs_block_device {
+ delete_on_termination = (known after apply)
+ device_name           = (known after apply)
+ encrypted = (known after apply)
+ iops = (known after apply)
+ kms_key_id = (known after apply)
+ snapshot_id = (known after apply)
+ tags                  = (known after apply)
+ throughput = (known after apply)
+ volume_id = (known after apply)
+ volume_size = (known after apply)
+ volume_type = (known after apply)
}

~ enclave_options {
~ enabled = false -> (known after apply)
}

+ ephemeral_block_device {
+ device_name = (known after apply)
+ no_device    = (known after apply)
+ virtual_name = (known after apply)
}

~ maintenance_options {
~ auto_recovery = "default" -> (known after apply)
}

~ metadata_options {
~ http_endpoint = "enabled" -> (known after apply)
~ http_put_response_hop_limit = 1 -> (known after apply)
~ http_tokens = "optional" -> (known after apply)
~ instance_metadata_tags = "disabled" -> (known after apply)
}

+ network_interface {
+ delete_on_termination = (known after apply)
+ device_index          = (known after apply)
+ network_card_index = (known after apply)
+ network_interface_id = (known after apply)
}

~ private_dns_name_options {
~ enable_resource_name_dns_a_record = false -> (known after apply)
~ enable_resource_name_dns_aaaa_record = false -> (known after apply)
~ hostname_type = "ip-name" -> (known after apply)
}

~ root_block_device {
~ delete_on_termination = true -> (known after apply)
~ device_name = "/dev/sda1" -> (known after apply)
~ encrypted = false -> (known after apply)
~ iops = 0 -> (known after apply)
+ kms_key_id = (known after apply)
~ tags = {} -> (known after apply)
~ throughput = 0 -> (known after apply)
~ volume_id             = "vol-01d0738b6d46a77dc" -> (known after apply)
~ volume_size = 8 -> (known after apply)
~ volume_type = "standard" -> (known after apply)
}
}

Plan : 1 to add, 0 to change, 1 to destroy.

Changes to Outputs :
+ instance = (known after apply)

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value : yes

aws_instance.app_server : Destroying... [
id = i-01578bef2f0c09697
]
aws_instance.app_server : Still destroying... [id = i-01578bef2f0c09697, 10s elapsed]
aws_instance.app_server : Still destroying... [id = i-01578bef2f0c09697, 20s elapsed
]
aws_instance.app_server : Still destroying... [id = i-01578bef2f0c09697, 30s elapsed]
aws_instance.app_server : Destruction complete after 32s
aws_instance.app_server : Creating...
aws_instance.app_server : Still creating... [10s elapsed]
aws_instance.app_server : Still creating... [
20s elapsed
]
aws_instance.app_server : Still creating... [30s elapsed]
aws_instance.app_server : Still creating... [40s elapsed]
aws_instance.app_server: Still creating... [
50s elapsed
]
aws_instance.app_server : Still creating... [1m0s elapsed]
aws_instance.app_server : Still creating... [
1m10s elapsed
]
aws_instance.app_server : Creation complete after 1m16s [id = i-096d8450f6e310e85]

Apply complete! Resources : 1 added, 0 changed, 1 destroyed.

Outputs :

instance = "i-096d8450f6e310e85"

```

`terraform show`

```terraform
# aws_instance.app_server:
resource "aws_instance" "app_server" {
  ami                                  = "ami-830c94e3"
  arn                                  = "arn:aws:ec2:us-west-2:632657072413:instance/i-096d8450f6e310e85"
  associate_public_ip_address          = true
  availability_zone                    = "us-west-2b"
  cpu_core_count                       = 1
  cpu_threads_per_core                 = 1
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  id                                   = "i-096d8450f6e310e85"
  instance_initiated_shutdown_behavior = "stop"
  instance_state                       = "running"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  monitoring                           = false
  primary_network_interface_id         = "eni-05f2348bbcb0f5852"
  private_dns                          = "ip-172-31-17-146.us-west-2.compute.internal"
  private_ip                           = "172.31.17.146"
  public_dns                           = "ec2-54-191-126-105.us-west-2.compute.amazonaws.com"
  public_ip                            = "54.191.126.105"
  secondary_private_ips                = []
  security_groups                      = [
    "default",
  ]
  source_dest_check = true
  subnet_id         = "subnet-081b5e47d1aee6233"
  tags              = {
    "Name" = "ExampleAwsInstance"
  }
  tags_all = {
    "Name" = "ExampleAwsInstance"
  }
  tenancy                     = "default"
  user_data_replace_on_change = false
  vpc_security_group_ids      = [
    "sg-0422143bffb5f3926",
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
    volume_id             = "vol-0d85933535dc0d2d0"
    volume_size           = 8
    volume_type           = "standard"
  }
}


Outputs :

instance = "i-096d8450f6e310e85"
```

`terraform output`

```
instance = "i-096d8450f6e310e85"
```

# Terraform with GitHub

You can see the test repo created using Terraform [here](https://github.com/al1ych/devops-terraform-test)

`terraform init`

Disable squash and rebase:

```terraform
  allow_squash_merge = false
  allow_rebase_merge = false
```

`terraform apply -var "token=..."`

```zsh

Terraform will perform the following actions:

  # github_branch_default.master will be created
  + resource "github_branch_default" "master" {
      + branch     = "master"
      + id         = (known after apply)
      + repository = "devops-terraform-test"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "master"
      + repository_id                   = (known after apply)
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false

      + required_pull_request_reviews {
          + required_approving_review_count = 1
        }
    }

  # github_repository.repo will be created
  + resource "github_repository" "repo" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = false
      + allow_squash_merge          = false
      + archived                    = false
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "Devops course: terraform test"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + license_template            = "mit"
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "devops-terraform-test"
      + node_id                     = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + visibility                  = "public"
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.repo: Creating...
github_repository.repo: Creation complete after 6s [id=devops-terraform-test]
github_branch_default.master: Creating...
github_branch_default.master: Creation complete after 2s [id=devops-terraform-test]
github_branch_protection.default: Creating...
github_branch_protection.default: Creation complete after 4s [id=BPR_kwDOIEsr2s4Bv8eK]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

`terraform show`

```zsh

# github_branch_default.master:
resource "github_branch_default" "master" {
    branch     = "master"
    id         = "devops-terraform-test"
    repository = "devops-terraform-test"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOIEsr2s4Bv8eK"
    pattern                         = "master"
    repository_id                   = "devops-terraform-test"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        require_code_owner_reviews      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    archived                    = false
    default_branch              = "master"
    delete_branch_on_merge      = false
    description                 = "Devops course: terraform test"
    etag                        = "W/\"6a16fb050e837ce22bfa83c76ed4fa4f9f86e443d7de2ff16493fe1d3732eca6\""
    full_name                   = "al1ych/devops-terraform-test"
    git_clone_url               = "git://github.com/al1ych/devops-terraform-test.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/al1ych/devops-terraform-test"
    http_clone_url              = "https://github.com/al1ych/devops-terraform-test.git"
    id                          = "devops-terraform-test"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops-terraform-test"
    node_id                     = "R_kgDOIEsr2g"
    private                     = false
    repo_id                     = 541797338
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:al1ych/devops-terraform-test.git"
    svn_url                     = "https://github.com/al1ych/devops-terraform-test"
    visibility                  = "public"
    vulnerability_alerts        = false
}
```

## import

1. `terraform init`
2. `terraform import "github_repository.repo" "devops-terraform-test"`
3. `terraform plan -out plan.tfplan`
4. `terraform apply "plan.tfplan"`