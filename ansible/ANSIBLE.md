# Install Docker via Ansible (Results)

## Part I: Install Docker locally

### Deployment

Output of the command after deployment of the role docker.

```
ansible-playbook playbooks/dev/main.yml --diff
```

<details> <summary>Output</summary>

```
PLAY [Install docker] **************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [local_host]

TASK [docker : include_tasks] ******************************************************************************************
included: /home/local/minina/PythonProjects/Innopolis_DevOps2022/ansible/roles/docker/tasks/setup-Debian.yml for local_host

TASK [docker : Ensure old versions of Docker are not installed.] *******************************************************
ok: [local_host]

TASK [docker : Ensure dependencies are installed.] *********************************************************************
ok: [local_host]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****************
skipping: [local_host]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************
ok: [local_host]

TASK [docker : Add Docker apt key.] ************************************************************************************
ok: [local_host]

TASK [docker : Ensure curl is present (on older systems without SNI).] *************************************************
skipping: [local_host]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************
skipping: [local_host]

TASK [docker : Add Docker repository.] *********************************************************************************
ok: [local_host]

TASK [docker : Install Docker packages.] *******************************************************************************
skipping: [local_host]

TASK [docker : Install Docker packages (with downgrade option).] *******************************************************
ok: [local_host]

TASK [docker : Install docker-compose plugin.] *************************************************************************
skipping: [local_host]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************
skipping: [local_host]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************
skipping: [local_host]

TASK [docker : Configure Docker daemon options.] ***********************************************************************
skipping: [local_host]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************
ok: [local_host]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************

TASK [docker : include_tasks] ******************************************************************************************
included: /home/local/minina/PythonProjects/Innopolis_DevOps2022/ansible/roles/docker/tasks/docker-compose.yml for local_host

TASK [docker : Check current docker-compose version.] ******************************************************************
ok: [local_host]

TASK [docker : set_fact] ***********************************************************************************************
ok: [local_host]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************
skipping: [local_host]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************
skipping: [local_host]

TASK [docker : Get docker group info using getent.] ********************************************************************
skipping: [local_host]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************

TASK [docker : include_tasks] ******************************************************************************************
skipping: [local_host]

PLAY RECAP *************************************************************************************************************
local_host                 : ok=12   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```

</details>

### Check inventory
Run the command to check the inventory:

```
ansible-inventory -i inventory/local.yml --list
```

```
{
    "_meta": {
        "hostvars": {
            "local_host": {
                "ansible_host": "127.0.0.1"
            }
        }
    },
    "all": {
        "children": [
            "servers",
            "ungrouped"
        ]
    },
    "servers": {
        "hosts": [
            "local_host"
        ]
    }
}
```
## Part II: Install Docker remotely

### Deployment

Output of the command after deployment of the role docker on remote virtual machine.

```
ansible-playbook playbooks/prod/main.yml --diff
```

### Check inventory
Run the command to check the inventory:

```
ansible-inventory -i inventory/yacloud_compute.yml --list
```

```
{
    "_meta": {
        "hostvars": {
            "ya_vm": {
                "ansible_host": "51.250.80.31"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yacloud"
        ]
    },
    "servers": {
        "hosts": [
            "ya_vm"
        ]
    }
}
```

## Part III: Deploy Docker remotely

### Deployment

```
ansible-playbook playbooks/prod/app_python/main.yml --diff
```
```
PLAY [Web app] *****************************************************************************

TASK [Gathering Facts] *********************************************************************
ok: [vm1]

TASK [docker : include_tasks] **************************************************************
included: /home/polina/Innopolis_DevOps2022/ansible/roles/docker/tasks/setup-Debian.yml for vm1

TASK [docker : Ensure old versions of Docker are not installed.] ***************************
ok: [vm1]

TASK [docker : Ensure dependencies are installed.] *****************************************
ok: [vm1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [vm1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *********
ok: [vm1]

TASK [docker : Add Docker apt key.] ********************************************************
ok: [vm1]

TASK [docker : Ensure curl is present (on older systems without SNI).] *********************
skipping: [vm1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ************
skipping: [vm1]

TASK [docker : Add Docker repository.] *****************************************************
ok: [vm1]

TASK [docker : Install Docker packages.] ***************************************************
skipping: [vm1]

TASK [docker : Install Docker packages (with downgrade option).] ***************************
ok: [vm1]

TASK [docker : Install docker-compose plugin.] *********************************************
skipping: [vm1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********************
skipping: [vm1]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************************
skipping: [vm1]

TASK [docker : Configure Docker daemon options.] *******************************************
skipping: [vm1]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************************
ok: [vm1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **************

TASK [docker : include_tasks] **************************************************************
included: /home/polina/Innopolis_DevOps2022/ansible/roles/docker/tasks/docker-compose.yml for vm1

TASK [docker : Check current docker-compose version.] **************************************
ok: [vm1]

TASK [docker : set_fact] *******************************************************************
ok: [vm1]

TASK [docker : Delete existing docker-compose version if it's different.] ******************
skipping: [vm1]

TASK [docker : Install Docker Compose (if configured).] ************************************
skipping: [vm1]

TASK [docker : Get docker group info using getent.] ****************************************
skipping: [vm1]

TASK [docker : Check if there are any users to add to the docker group.] *******************

TASK [docker : include_tasks] **************************************************************
skipping: [vm1]

TASK [docker : include_tasks] **************************************************************
skipping: [vm1]

TASK [web_app : Stop services] *************************************************************
skipping: [vm1]

TASK [web_app : Remove app directory] ******************************************************
skipping: [vm1]

TASK [web_app : Create directory] **********************************************************
ok: [vm1]

TASK [web_app : Template and copy docker compose file] *************************************
ok: [vm1]

TASK [web_app : Start] *********************************************************************
changed: [vm1]

PLAY RECAP *********************************************************************************
vm1                 : ok=15   changed=1    unreachable=0    failed=0    skipped=16   rescued=0    ignored=0
```