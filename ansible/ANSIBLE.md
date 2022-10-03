# Ansible tasks

## Docker task

Output of `ansible-playbook playbooks/dev/main.yml --diff`

I hardcoded VM's IP into `hosts.yaml` since in the bonus task and further I am not going to use it, although I know that this secret 
should be not be published :)

```
TASK [docker : Install Docker packages (with downgrade option).] ***********************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [62.84.120.181]

TASK [docker : Install docker-compose plugin.] *****************************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Ensure /etc/docker/ directory exists.] **********************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************
ok: [62.84.120.181]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

RUNNING HANDLER [docker : restart docker] **********************************************************************************************************************************
changed: [62.84.120.181]

TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/ilya/PycharmProjects/DevOps/ansible/roles/docker/tasks/docker-compose.yml for 62.84.120.181

TASK [docker : Check current docker-compose version.] **********************************************************************************************************************
ok: [62.84.120.181]

TASK [docker : set_fact] ***************************************************************************************************************************************************
ok: [62.84.120.181]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************
ok: [62.84.120.181]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************
changed: [62.84.120.181]

TASK [docker : Get docker group info using getent.] ************************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [62.84.120.181]

PLAY RECAP *****************************************************************************************************************************************************************
62.84.120.181              : ok=15   changed=6    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0   
```

Inventory

```
{ 
    "_meta": {
        "hostvars": {
            "62.84.120.181": {
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "docker",
            "ungrouped"
        ]
    },
    "docker": {
        "hosts": [
            "62.84.120.181"
        ]
    }
}
```

## Bonus task (yandex cloud)

```
TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

RUNNING HANDLER [docker : restart docker] **********************************************************************************************************************************
changed: [ilya-vm]

TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/ilya/PycharmProjects/DevOps/ansible/roles/docker/tasks/docker-compose.yml for ilya-vm

TASK [docker : Check current docker-compose version.] **********************************************************************************************************************
ok: [ilya-vm]

TASK [docker : set_fact] ***************************************************************************************************************************************************
ok: [ilya-vm]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************
ok: [ilya-vm]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************
changed: [ilya-vm]

TASK [docker : Get docker group info using getent.] ************************************************************************************************************************
skipping: [ilya-vm]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [ilya-vm]

PLAY RECAP *****************************************************************************************************************************************************************
ilya-vm                    : ok=15   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored
```

```
{ 
    "_meta": {
        "hostvars": {
            "ilya-vm": {
                "ansible_host": "62.84.115.182"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yacloud"
        ]
    },
    "yacloud": {
        "hosts": [
            "ilya-vm"
        ]
    }
}

```
