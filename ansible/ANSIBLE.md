# Ansible

## Playbook execution

Last 50 lines of command `ansible-playbook playbooks/dev/main.yml --diff`:

```text
changed: [terraform1]

TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 47 not upgraded.
changed: [terraform1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************************
skipping: [terraform1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************************************************************
skipping: [terraform1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************************
ok: [terraform1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************************

RUNNING HANDLER [docker : restart docker] ********************************************************************************************************************************************
changed: [terraform1]

TASK [docker : Check current docker-compose version.] ********************************************************************************************************************************
ok: [terraform1]

TASK [docker : set_fact] *************************************************************************************************************************************************************
ok: [terraform1]

TASK [docker : Delete existing docker-compose version if it's different.] ************************************************************************************************************
ok: [terraform1]

TASK [docker : Ensure installation directory exists.] ********************************************************************************************************************************
skipping: [terraform1]

TASK [docker : Install Docker Compose (if configured).] ******************************************************************************************************************************
changed: [terraform1]

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************************
skipping: [terraform1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************************
skipping: [terraform1]

PLAY RECAP ***************************************************************************************************************************************************************************
terraform1                 : ok=13   changed=6    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0   
```

## Inventory

`ansible-inventory -i inventory/yacloud_compute.yml --list`

```json
{
    "_meta": {
        "hostvars": {
            "terraform1": {
                "ansible_host": "84.201.132.85"
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
            "terraform1"
        ]
    }
}
```
