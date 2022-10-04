# Ansible

Results of implementation tasks with the use of Ansible.

## Result of the 1-st running command 
Command: ```ansible-playbook ./playbooks/yacloud_compute/main.yml --diff```:

```shell
TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ***************************************************************************************************
skipping: [vm1]

TASK [docker : Add Docker repository.] ********************************************************************************************************************************************
ok: [vm1]

TASK [docker : Install Docker packages.] ******************************************************************************************************************************************
skipping: [vm1]

TASK [docker : Install Docker packages (with downgrade option).] ******************************************************************************************************************
ok: [vm1]

TASK [docker : Install docker-compose plugin.] ************************************************************************************************************************************
skipping: [vm1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ************************************************************************************************************
skipping: [vm1]

TASK [docker : Ensure /etc/docker/ directory exists.] *****************************************************************************************************************************
skipping: [vm1]

TASK [docker : Configure Docker daemon options.] **********************************************************************************************************************************
skipping: [vm1]

TASK [docker : Ensure Docker is started and enabled at boot.] *********************************************************************************************************************
ok: [vm1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] *****************************************************************************************************

TASK [docker : include_tasks] *****************************************************************************************************************************************************
included: /home/vladislav/PycharmProjects/iu-devops-labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

TASK [docker : Check current docker-compose version.] *****************************************************************************************************************************
ok: [vm1]

TASK [docker : set_fact] **********************************************************************************************************************************************************
ok: [vm1]

TASK [docker : Delete existing docker-compose version if it's different.] *********************************************************************************************************
ok: [vm1]

TASK [docker : Install Docker Compose (if configured).] ***************************************************************************************************************************
changed: [vm1]

TASK [docker : Get docker group info using getent.] *******************************************************************************************************************************
skipping: [vm1]

TASK [docker : Check if there are any users to add to the docker group.] **********************************************************************************************************

TASK [docker : include_tasks] *****************************************************************************************************************************************************
skipping: [vm1]

PLAY RECAP ************************************************************************************************************************************************************************
vm1                        : ok=15   changed=1    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

## Result of the 2-nd running command 
Command: ```ansible-inventory -i ./inventory/inventory.yml --list```:

```shell
{
    "_meta": {
        "hostvars": {
            "vm1": {
                "ansible_become": true,
                "ansible_host": "51.250.94.200",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "vm"
        ]
    },
    "vm": {
        "hosts": [
            "vm1"
        ]
    }
}
```