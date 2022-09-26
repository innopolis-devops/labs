# Best practices

- Set a version constraint for each provider defined in the required_providers
  block to constrain the provider version so that Terraform does not install
  a version of the provider that does not work with your configuration.
- Use consistent formatting in all of your configuration files: `terraform fmt`
- Make sure your configuration is syntactically valid: `terraform validate`
- Manipulate `.tfstate` state only through TF commands.
- Set up a shared remote storage for a State file for team members.
- Use state locking in a team.
- Back up a State file.
- Use one state per environment.
- Host TF code in Git repository.
- Delegate ownership of infrastructure across these teams.

# Logs

**Action:** `terraform show`

**Output:**
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
    hostname          = "1ffd81f53325"
    id                = "1ffd81f53325267b19de2c135628c05e00272a4f6af186c14e87bd3713c811dc"
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

**Action:** `terraform state list`

**Output:**
```
docker_container.nginx
docker_image.nginx
```

**Action:** change external port 8000 -> 8080

**Output:**
```
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=1ffd81f53325267b19de2c135628c05e00272a4f6af186c14e87bd3713c811dc]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced

```
...
```
 ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
```
...
```
docker_container.nginx: Destroying... [id=1ffd81f53325267b19de2c135628c05e00272a4f6af186c14e87bd3713c811dc]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=3ff7a5050cc0ac7a55f4980a9a6d59b2e4ee8773de7781293e82beaef2a5dd7e]
```

**Action:** Set the container name with a variable and apply changes

**Output:**
```
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=4272674e14222773e1314bc7f9b158e1141dec44526afec2724c07cbeecbdbad]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
```
...
```
 ~ name              = "tutorial" -> "ExampleNginxContainer" # forces replacement
```
...
```
docker_container.nginx: Destroying... [id=4272674e14222773e1314bc7f9b158e1141dec44526afec2724c07cbeecbdbad]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 0s [id=371dbae1674a1cb6270c335c559d6afe6bc3104d689c009eae22be2c99ad30d8]
```

**Action:** Set variable `terraform apply -var "container_name=DockerNginx"`

**Output:**
```
docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=371dbae1674a1cb6270c335c559d6afe6bc3104d689c009eae22be2c99ad30d8]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
```
...
``` 
~ name              = "ExampleNginxContainer" -> "DockerNginx" # forces replacement
```
...
```
docker_container.nginx: Destroying... [id=371dbae1674a1cb6270c335c559d6afe6bc3104d689c009eae22be2c99ad30d8]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=124d92f92305ab73843a6e311a610c498484997728fb232b9bd103de98b1f642]
```

**Action:** Add outputs.tf

**Output:**
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced

```
...
```
~ name              = "DockerNginx" -> "ExampleNginxContainer" # forces replacement
```
...
```
Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  + container_id = (known after apply)
  + image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"

```
...
```
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

container_id = "febb80b5b6031d3d5e5d0859634e6924cc3f035761bece4e220f0ff99e209b25"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

**Action:** Print output `terraform output`

**Output:**

```
container_id = "febb80b5b6031d3d5e5d0859634e6924cc3f035761bece4e220f0ff99e209b25"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```
