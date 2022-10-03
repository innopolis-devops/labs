# Ansible

## Deployment output

```commandline
changed: [yacloud]

TASK [docker : Install Docker packages.] ********************************************************
skipping: [yacloud]

TASK [docker : Install Docker packages (with downgrade option).] ********************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [yacloud]

TASK [docker : Install docker-compose plugin.] **************************************************
skipping: [yacloud]

TASK [docker : Install docker-compose-plugin (with downgrade option).] **************************
skipping: [yacloud]

TASK [docker : Ensure /etc/docker/ directory exists.] *******************************************
skipping: [yacloud]

TASK [docker : Configure Docker daemon options.] ************************************************
skipping: [yacloud]

TASK [docker : Ensure Docker is started and enabled at boot.] ***********************************
ok: [yacloud]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] *******************

RUNNING HANDLER [docker : restart docker] *******************************************************
changed: [yacloud]

TASK [docker : include_tasks] *******************************************************************
included: /Users/whutao/code/course-devops/ansible/roles/docker/tasks/docker-compose.yml for yacloud

TASK [docker : Check current docker-compose version.] *******************************************
ok: [yacloud]

TASK [docker : set_fact] ************************************************************************
ok: [yacloud]

TASK [docker : Delete existing docker-compose version if it's different.] ***********************
ok: [yacloud]

TASK [docker : Install Docker Compose (if configured).] *****************************************
changed: [yacloud]

TASK [docker : Get docker group info using getent.] *********************************************
skipping: [yacloud]

TASK [docker : Check if there are any users to add to the docker group.] ************************

TASK [docker : include_tasks] *******************************************************************
skipping: [yacloud]

PLAY RECAP **************************************************************************************
yacloud                    : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

## List inventory

The command `ansible-inventory -i inventory/yacloud_compute.yml --list` will produce

```commandline
{
    "VM": {
        "hosts": [
            "yacloud"
        ]
    },
    "_meta": {
        "hostvars": {
            "yacloud": {
                "ansible_become": true,
                "ansible_host": "51.250.71.60",
                "ansible_ssh_private_key_file": "~/.ssh/id_rsa",
                "ansible_user": "whutao"
            }
        }
    },
    "all": {
        "children": [
            "VM",
            "ungrouped"
        ]
    }
}
```
