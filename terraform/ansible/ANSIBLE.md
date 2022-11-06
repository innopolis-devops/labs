# Playbook

igor@debian:~/labs/ansible$ ansible-playbook playbooks/dev/main.yml --diff

...

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********************************************
skipping: [VM1]
skipping: [ansible]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************************************************
skipping: [VM1]
skipping: [ansible]

TASK [docker : Configure Docker daemon options.] *******************************************************************
skipping: [VM1]
skipping: [ansible]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************************************************
ok: [ansible]
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **************************************

TASK [docker : include_tasks] **************************************************************************************
included: /home/igor/labs/ansible/roles/docker/tasks/docker-compose.yml for VM1, ansible

TASK [docker : Check current docker-compose version.] **************************************************************
ok: [VM1]
ok: [ansible]

TASK [docker : set_fact] *******************************************************************************************
ok: [VM1]
ok: [ansible]

TASK [docker : Delete existing docker-compose version if it's different.] ******************************************
skipping: [VM1]
skipping: [ansible]

TASK [docker : Install Docker Compose (if configured).] ************************************************************
skipping: [VM1]
skipping: [ansible]

TASK [docker : Get docker group info using getent.] ****************************************************************
skipping: [VM1]
skipping: [ansible]

TASK [docker : Check if there are any users to add to the docker group.] *******************************************

TASK [docker : include_tasks] **************************************************************************************
skipping: [VM1]
skipping: [ansible]

PLAY RECAP *********************************************************************************************************
VM1                        : ok=13   changed=0    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0   
ansible                    : ok=13   changed=0    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0

# Inventory

## inventory.yml

igor@debian:~/labs/ansible$ ansible-inventory -i inventory/inventory.yml --list
{
    "VM": {
        "hosts": [
            "VM1"
        ]
    },
    "_meta": {
        "hostvars": {
            "VM1": {
                "ansible_host": "51.250.105.74",
                "ansible_user": "debian"
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

# yacloud_compute.yml

igor@debian:~/labs/ansible$ ansible-inventory -i inventory/yacloud_compute.yml --list
{
    "_meta": {
        "hostvars": {
            "ansible": {
                "ansible_host": "51.250.105.74",
                "ansible_user": "debian"
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
            "ansible"
        ]
    }
}
