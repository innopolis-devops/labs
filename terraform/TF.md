# Terraform

- Install terraform CLI (<https://www.terraform.io/downloads>)

## Docker Provider

- Create `docker` module following [the tutorial](https://learn.hashicorp.com/tutorials/terraform/docker-build?in=terraform/docker-get-started#prerequisites).

- Run

  ```bash
  terrform init
  terraform validate
  terraform fmt
  terraform apply # write yes
  ```

  ```bash
  $ terraform state
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
      hostname          = "d723cbbe7863"
      id                = "d723cbbe78634c34163605a6b3e8eb218674a2519da48eef96b2e36fd7de0f75"
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

  ```bash
  $ terraform state list
  docker_container.nginx
  docker_image.nginx
  ```

- Change infrastructure (change external port to 8080 instead of 8000)

  ```bash
  $ terraform apply
  docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]docker_container.nginx: Refreshing state... [id=d723cbbe78634c34163605a6b3e8eb218674a2519da48eef96b2e36fd7de0f75]
  
  Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
  following symbols:
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
        ~ hostname          = "d723cbbe7863" -> (known after apply)
        ~ id                = "d723cbbe78634c34163605a6b3e8eb218674a2519da48eef96b2e36fd7de0f75" -> (known after apply)
        ~ init              = false -> (known after apply)
        ~ ip_address        = "172.17.0.2" -> (known after apply)
        ~ ip_prefix_length  = 16 -> (known after apply)
        ~ ipc_mode          = "private" -> (known after apply)
        - links             = [] -> null
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
        ~ security_opts     = [] -> (known after apply)
        ~ shm_size          = 64 -> (known after apply)
        - sysctls           = {} -> null
        - tmpfs             = {} -> null
          # (12 unchanged attributes hidden)
  
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
  
  Plan: 1 to add, 0 to change, 1 to destroy
  ```

- Create `variables.tf` and `outputs.tf` as below and change `docker_container` resource to use `var.container_name` instead of `tutorial`

  ```bash
  # variables.tf
  variable "container_name" {
    description = "Value of the name for the Docker container"
    type        = string
    default     = "ExampleNginxContainer"
  }
  
  # outputs.tf
  output "container_id" {
    description = "ID of the Docker container"
    value       = docker_container.nginx.id
  }
  
  output "image_id" {
    description = "ID of the Docker image"
    value       = docker_image.nginx.id
  }
  
  ```

- Apply config and check output

  ```bash
  $ terraform apply
  ...
  ~ name              = "tutorial" -> "ExampleNginxContainer" # forces replacement
  ...
  Changes to Outputs:
    + container_id = (known after apply)
    + image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
  
  $ terraform output
  container_id = "5472b7185b9174221ac227794dbec79adcc14814da14dd22419a1267e0d20274"
  image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
  ```

## AWS Provider

- Create `aws` module following [the tutorial](https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started#prerequisites).

- Run

  ```bash
  export AWS_ACCESS_KEY_ID=#REDACTED
  export AWS_SECRET_ACCESS_KEY=#REDACTED
  terrform init
  terraform validate
  terraform fmt
  terraform apply # write yes
  ```

  ```bash
  $ terraform state list
  aws_instance.test
  
  $ terraform state show aws_instance.test
  resource "aws_instance" "test" {
      ami                                  = "ami-09042b2f6d07d164a"
      arn                                  = "arn:aws:ec2:eu-central-1:237179952815:instance/i-0672f2238530a7446"
      associate_public_ip_address          = true
      availability_zone                    = "eu-central-1a"
      cpu_core_count                       = 1
      cpu_threads_per_core                 = 1
      disable_api_stop                     = false
      disable_api_termination              = false
      ebs_optimized                        = false
      get_password_data                    = false
      hibernation                          = false
      id                                   = "i-0672f2238530a7446"
      instance_initiated_shutdown_behavior = "stop"
      instance_state                       = "running"
      instance_type                        = "t2.micro"
      ipv6_address_count                   = 0
      ipv6_addresses                       = []
      monitoring                           = false
      primary_network_interface_id         = "eni-035834c18d5f1d500"
      private_dns                          = "ip-172-31-23-102.eu-central-1.compute.internal"
      private_ip                           = "172.31.23.102"
      public_dns                           = "ec2-35-159-20-2.eu-central-1.compute.amazonaws.com"
      public_ip                            = "35.159.20.2"
      secondary_private_ips                = []
      security_groups                      = [
          "default",
      ]
      source_dest_check                    = true
      subnet_id                            = "subnet-07237d76a9b71c77e"
      tags                                 = {
          "Name" = "test"
      }
      tags_all                             = {
          "Name" = "test"
      }
      tenancy                              = "default"
      user_data_replace_on_change          = false
      vpc_security_group_ids               = [
          "sg-03dd4a6530ac7a98f",
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
          iops                  = 100
          tags                  = {}
          throughput            = 0
          volume_id             = "vol-0c00d709f5e60cee4"
          volume_size           = 8
          volume_type           = "gp2"
      }
  }
  
  $ terraform state list
  aws_instance.app_server
  
  $ terraform destroy
  ```

## Github Provider

- Create `github` module following [the tutorial](https://dev.to/pwd9000/manage-and-maintain-github-with-terraform-2k86).

- Run

  ```bash
  terrform init
  terraform validate
  terraform fmt
  ```

- Import labs repo

  ```bash
  $ terraform import github_repository.labs UI-devops-labs
  var.github_token
    Enter a value: <REDACTED>
  
  github_repository.labs: Importing from ID "UI-devops-labs"...
  github_repository.labs: Import prepared!
    Prepared github_repository for import
  github_repository.labs: Refreshing state... [id=UI-devops-labs]
  
  Import successful!
  
  The resources that were imported are shown above. These resources are now in
  your Terraform state and will henceforth be managed by Terraform.
  ```

- Update repo description and branch protection from code

  ```bash
  terraform apply # write yes
  ```

- Show state

  ```bash
  $ terraform state list
  github_repository.labs
  $ terraform state show github_repository.labs
  # github_repository.labs:
  resource "github_repository" "labs" {
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
              name      = "lab4"
              protected = false
          },
          {
              name      = "master"
              protected = true
          },
      ]
      default_branch              = "master"
      delete_branch_on_merge      = false
      description                 = "A description created from terraform"
      etag                        = "W/\"bd4e35132c52a25de0f2dc4c4b18b6a6a492a2033ad6a526cf599c6890c4df3a\""
      full_name                   = "afonyaa/UI-devops-labs"
      git_clone_url               = "git://github.com/afonyaa/UI-devops-labs.git"
      has_downloads               = false
      has_issues                  = false
      has_projects                = false
      has_wiki                    = false
      html_url                    = "https://github.com/afonyaa/UI-devops-labs"
      http_clone_url              = "https://github.com/afonyaa/UI-devops-labs.git"
      id                          = "UI-devops-labs"
      is_template                 = false
      merge_commit_message        = "PR_TITLE"
      merge_commit_title          = "MERGE_MESSAGE"
      name                        = "UI-devops-labs"
      node_id                     = "R_kgDOH71BEQ"
      private                     = false
      repo_id                     = 532496657
      squash_merge_commit_message = "COMMIT_MESSAGES"
      squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      ssh_clone_url               = "git@github.com:afonyaa/UI-devops-labs.git"
      svn_url                     = "https://github.com/afonyaa/UI-devops-labs"
      topics                      = []
      visibility                  = "public"
      vulnerability_alerts        = false
  }
  ```

## Best Practices

- Use `terraform fmt` and `terraform validate`
- Use `terraform plan` to see changes before apply.
- Pin the Terraform provider to specific version.
- Do not push state files to github.
- Use variables for sensitive information.
- Use recommended directory structure and file names (`main.tf`, `variables.tf`, `outputs.tf`)
