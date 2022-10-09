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

# Lab 6 Deployment

igor@debian:~/labs/ansible$ ansible-playbook playbooks/dev/app_python/main.yml -i inventory/yacloud_compute.yml --diff

...

skipping: [ansible]

TASK [docker : Configure Docker daemon options.] *******************************************************************************************************************************************************************************************
skipping: [ansible]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************************************************************************************************************************************************************************
ok: [ansible]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **************************************************************************************************************************************************************

TASK [docker : include_tasks] **************************************************************************************************************************************************************************************************************
included: /home/igor/labs/ansible/roles/docker/tasks/docker-compose.yml for ansible

TASK [docker : Check current docker-compose version.] **************************************************************************************************************************************************************************************
ok: [ansible]

TASK [docker : set_fact] *******************************************************************************************************************************************************************************************************************
ok: [ansible]

TASK [docker : Delete existing docker-compose version if it's different.] ******************************************************************************************************************************************************************
skipping: [ansible]

TASK [docker : Install Docker Compose (if configured).] ************************************************************************************************************************************************************************************
skipping: [ansible]

TASK [docker : Get docker group info using getent.] ****************************************************************************************************************************************************************************************
skipping: [ansible]

TASK [docker : Check if there are any users to add to the docker group.] *******************************************************************************************************************************************************************

TASK [docker : include_tasks] **************************************************************************************************************************************************************************************************************
skipping: [ansible]

TASK [web_app : Stop all services] *********************************************************************************************************************************************************************************************************
skipping: [ansible]

TASK [web_app : Remove app directory] ******************************************************************************************************************************************************************************************************
skipping: [ansible]

TASK [web_app : Create a directory if it doesn't exist] ************************************************************************************************************************************************************************************
ok: [ansible]

TASK [web_app : Template, validate, and copy compose file] *********************************************************************************************************************************************************************************
ok: [ansible]

TASK [web_app : Start all services] ********************************************************************************************************************************************************************************************************
ok: [ansible]

PLAY RECAP *********************************************************************************************************************************************************************************************************************************
ansible                    : ok=16   changed=0    unreachable=0    failed=0    skipped=16   rescued=0    ignored=0

# Application improvements

For both [app_python](/app_python/PYTHON.md) and [app_php](/app_php/PHP.md) both metrics and healthcheck were used. Find information in corresponding files.
