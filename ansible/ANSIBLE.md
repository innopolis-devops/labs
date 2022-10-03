# Inventory
I use a dynamic AWS inventory (from Bonus task). To be able to use it you need to install `aws_ec2` plugin, `boto3` library and 
`geerlingguy.docker` collections.
```shell
pip install boto3
ansible-galaxy install geerlingguy.docker
ansible-galaxy collection install amazon.aws
```

In the yaml file `inventory/aws_ec2.yml` you can add filters or grouping. The `hostname` section is added to avoid
hosts duplicating (my ec2 has public and private IPs, so it's kinda two hosts).
```yaml
plugin: aws_ec2

regions:
  - eu-north-1

hostnames:
  - name: dns-name
    prefix: ''
```

Also, you can set inventory as default in `ansible.cfg`
```
[defaults]
host_key_checking = False
inventory = ./inventory/aws_ec2.yml

[inventory]
enable_plugins = aws_ec2
```

# Playbook
Playbook is simple, only two tasks - update apt-get cache and install docker.
```yaml
- name: Update repositories cache
  hosts: all
  remote_user: ubuntu
  become: yes
  tasks:
    - name: Update repositories cache
      ansible.builtin.apt:
        update_cache: yes

- name: Install Docker
  hosts: all
  remote_user: ubuntu
  roles:
    - role: geerlingguy.docker
      become: yes
      vars:
        docker_service_enabled: yes
        docker_users:
          - ubuntu
```

# Output
Running:

<details>
<summary>Click to show...</summary>

```shell
(iu-devops-labs) f3line@kitty-2 ansible % ansible-playbook playbooks/prod/main.yml --diff

PLAY [Update repositories cache] *************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [Update repositories cache] *************************************************************************************************************************************************************************
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

PLAY [Install Docker] ************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Load OS-specific vars.] *******************************************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] ****************************************************************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] ****************************************************************************************************************************************************************
included: /Users/f3line/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for ec2-16-171-56-77.eu-north-1.compute.amazonaws.com

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *****************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *******************************************************************************************************************************************
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 22 not upgraded.
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] **************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***********************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key.] **********************************************************************************************************************************************************
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***********************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] **************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker repository.] *******************************************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages.] *****************************************************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *****************************************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin pigz slirp4netns
0 upgraded, 7 newly installed, 0 to remove and 22 not upgraded.
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose plugin.] ***********************************************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***********************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ****************************************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Configure Docker daemon options.] *********************************************************************************************************************************************
skipping: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ********************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ****************************************************************************************************************

RUNNING HANDLER [geerlingguy.docker : restart docker] ****************************************************************************************************************************************************
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] ****************************************************************************************************************************************************************
included: /Users/f3line/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for ec2-16-171-56-77.eu-north-1.compute.amazonaws.com

TASK [geerlingguy.docker : Check current docker-compose version.] ****************************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : set_fact] *********************************************************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ********************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] **************************************************************************************************************************************
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Get docker group info using getent.] ******************************************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] *********************************************************************************************************************
ok: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com] => (item=ubuntu)

TASK [geerlingguy.docker : include_tasks] ****************************************************************************************************************************************************************
included: /Users/f3line/.ansible/roles/geerlingguy.docker/tasks/docker-users.yml for ec2-16-171-56-77.eu-north-1.compute.amazonaws.com

TASK [geerlingguy.docker : Ensure docker users are added to the docker group.] ***************************************************************************************************************************
changed: [ec2-16-171-56-77.eu-north-1.compute.amazonaws.com] => (item=ubuntu)

TASK [geerlingguy.docker : Reset ssh connection to apply user changes.] **********************************************************************************************************************************

PLAY RECAP ***********************************************************************************************************************************************************************************************
ec2-16-171-56-77.eu-north-1.compute.amazonaws.com : ok=22   changed=8    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0   
```

</details>

Status:

<details>
<summary>Click to show...</summary>

```shell
(iu-devops-labs) f3line@kitty-2 ansible % ansible-inventory -i inventory/aws_ec2.yml --list        
{
    "_meta": {
        "hostvars": {
            "ec2-16-171-56-77.eu-north-1.compute.amazonaws.com": {
                "ami_launch_index": 0,
                "architecture": "x86_64",
                "block_device_mappings": [
                    {
                        "device_name": "/dev/sda1",
                        "ebs": {
                            "attach_time": "2022-10-03T18:51:23+00:00",
                            "delete_on_termination": true,
                            "status": "attached",
                            "volume_id": "vol-0392f6f559d5bf450"
                        }
                    }
                ],
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": "open"
                },
                "client_token": "043ED114-C080-419F-A9A7-05616B022018",
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 2
                },
                "ebs_optimized": false,
                "ena_support": true,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": "xen",
                "image_id": "ami-00b696228b0185ffe",
                "instance_id": "i-06bfb3d3f3d0f699f",
                "instance_type": "t3.nano",
                "key_name": "deploy_key",
                "launch_time": "2022-10-03T18:51:22+00:00",
                "maintenance_options": {
                    "auto_recovery": "default"
                },
                "metadata_options": {
                    "http_endpoint": "enabled",
                    "http_protocol_ipv6": "disabled",
                    "http_put_response_hop_limit": 1,
                    "http_tokens": "optional",
                    "instance_metadata_tags": "disabled",
                    "state": "applied"
                },
                "monitoring": {
                    "state": "disabled"
                },
                "network_interfaces": [
                    {
                        "association": {
                            "ip_owner_id": "amazon",
                            "public_dns_name": "ec2-16-171-56-77.eu-north-1.compute.amazonaws.com",
                            "public_ip": "16.171.56.77"
                        },
                        "attachment": {
                            "attach_time": "2022-10-03T18:51:22+00:00",
                            "attachment_id": "eni-attach-0b6a2d1651a7adef9",
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": "attached"
                        },
                        "description": "",
                        "groups": [
                            {
                                "group_id": "sg-09e1062bf51115dbb",
                                "group_name": "app_sg"
                            }
                        ],
                        "interface_type": "interface",
                        "ipv6_addresses": [],
                        "mac_address": "0e:f0:51:9d:86:5e",
                        "network_interface_id": "eni-062ae296fcb2a9b7e",
                        "owner_id": "553667903818",
                        "private_dns_name": "ip-172-31-4-26.eu-north-1.compute.internal",
                        "private_ip_address": "172.31.4.26",
                        "private_ip_addresses": [
                            {
                                "association": {
                                    "ip_owner_id": "amazon",
                                    "public_dns_name": "ec2-16-171-56-77.eu-north-1.compute.amazonaws.com",
                                    "public_ip": "16.171.56.77"
                                },
                                "primary": true,
                                "private_dns_name": "ip-172-31-4-26.eu-north-1.compute.internal",
                                "private_ip_address": "172.31.4.26"
                            }
                        ],
                        "source_dest_check": true,
                        "status": "in-use",
                        "subnet_id": "subnet-d8974995",
                        "vpc_id": "vpc-8277ebeb"
                    }
                ],
                "owner_id": "553667903818",
                "placement": {
                    "availability_zone": "eu-north-1c",
                    "group_name": "",
                    "region": "eu-north-1",
                    "tenancy": "default"
                },
                "platform_details": "Linux/UNIX",
                "private_dns_name": "ip-172-31-4-26.eu-north-1.compute.internal",
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": false,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": "ip-name"
                },
                "private_ip_address": "172.31.4.26",
                "product_codes": [],
                "public_dns_name": "ec2-16-171-56-77.eu-north-1.compute.amazonaws.com",
                "public_ip_address": "16.171.56.77",
                "requester_id": "",
                "reservation_id": "r-00637437f97543781",
                "root_device_name": "/dev/sda1",
                "root_device_type": "ebs",
                "security_groups": [
                    {
                        "group_id": "sg-09e1062bf51115dbb",
                        "group_name": "app_sg"
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": "running"
                },
                "state_transition_reason": "",
                "subnet_id": "subnet-d8974995",
                "tags": {
                    "Name": "ExampleAppServerInstance"
                },
                "usage_operation": "RunInstances",
                "usage_operation_update_time": "2022-10-03T18:51:22+00:00",
                "virtualization_type": "hvm",
                "vpc_id": "vpc-8277ebeb"
            }
        }
    },
    "all": {
        "children": [
            "aws_ec2",
            "ungrouped"
        ]
    },
    "aws_ec2": {
        "hosts": [
            "ec2-16-171-56-77.eu-north-1.compute.amazonaws.com"
        ]
    }
}
```

</details>

# Other
To be able to connect to the instance, I have to add security group and ssh key setup into terraform script.
