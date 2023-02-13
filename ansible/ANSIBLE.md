# Ansible lab 5

## Playbook

Running `ansible-playbook playbooks/dev/main.yml --diff`:

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/ansible$ ansible-playbook playbooks/dev/main.yml --diff
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Prepare docker] **********************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************
ok: [localhost]

TASK [docker : include_tasks] **************************************************************************************************************************************************************
included: /home/sokratmillman/IU/devcourse/labs/ansible/roles/docker/tasks/setup-Debian.yml for localhost

TASK [docker : Ensure old versions of Docker are not installed.] ***************************************************************************************************************************
ok: [localhost]

TASK [docker : Ensure dependencies are installed.] *****************************************************************************************************************************************
ok: [localhost]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ************************************************************************************
skipping: [localhost]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *********************************************************************************************************
ok: [localhost]

TASK [docker : Add Docker apt key.] ********************************************************************************************************************************************************
ok: [localhost]

TASK [docker : Ensure curl is present (on older systems without SNI).] *********************************************************************************************************************
skipping: [localhost]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ************************************************************************************************************
skipping: [localhost]

TASK [docker : Add Docker repository.] *****************************************************************************************************************************************************
ok: [localhost]

TASK [docker : include_tasks] **************************************************************************************************************************************************************
included: /home/sokratmillman/IU/devcourse/labs/ansible/roles/docker/tasks/install_docker.yml for localhost

TASK [docker : Install Docker packages.] ***************************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Configure Docker daemon options.] *******************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************************************************************************************************************************
ok: [localhost]

TASK [docker : include_tasks] **************************************************************************************************************************************************************
included: /home/sokratmillman/IU/devcourse/labs/ansible/roles/docker/tasks/install_compose.yml for localhost

TASK [docker : Check current docker-compose version.] **************************************************************************************************************************************
ok: [localhost]

TASK [docker : set_fact] *******************************************************************************************************************************************************************
ok: [localhost]

TASK [docker : Delete existing docker-compose version if it's different.] ******************************************************************************************************************
skipping: [localhost]

TASK [docker : Install Docker Compose (if configured).] ************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Install docker-compose plugin.] *********************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********************************************************************************************************************
skipping: [localhost]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **************************************************************************************************************

TASK [docker : Get docker group info using getent.] ****************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Check if there are any users to add to the docker group.] *******************************************************************************************************************
skipping: [localhost]

TASK [docker : include_tasks] **************************************************************************************************************************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************************************************************************************************************************
localhost                  : ok=12   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0  
```

## Inventory

Checking inventory with `ansible-inventory -i <name_of_your_inventory_file>.yaml --list`:

```
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
    "ungrouped": {
        "hosts": [
            "localhost"
        ]
    }
}
```

# Ansible lab 6

Last 50 lines of `ansible-playbook playbooks/yc/main.yml --diff`:

```
...

TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************************
ok: [localhost]

TASK [docker : include_tasks] **********************************************************************************************************************************************************
included: /home/sokratmillman/IU/devcourse/labs/ansible/roles/docker/tasks/install_compose.yml for localhost

TASK [docker : Check current docker-compose version.] **********************************************************************************************************************************
ok: [localhost]

TASK [docker : set_fact] ***************************************************************************************************************************************************************
ok: [localhost]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************************
skipping: [localhost]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************************
skipping: [localhost]

TASK [docker : Install docker-compose plugin.] *****************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************************
skipping: [localhost]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************************

TASK [docker : Get docker group info using getent.] ************************************************************************************************************************************
skipping: [localhost]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************************
skipping: [localhost]

TASK [docker : include_tasks] **********************************************************************************************************************************************************
skipping: [localhost]

TASK [python_app : Create a directory if it does not exist] ****************************************************************************************************************************
ok: [localhost]

TASK [python_app : Move template to dest] **********************************************************************************************************************************************
ok: [localhost]

TASK [python_app : Run docker-compose] *************************************************************************************************************************************************
ok: [localhost]

PLAY RECAP *****************************************************************************************************************************************************************************
localhost                  : ok=26   changed=0    unreachable=0    failed=0    skipped=26   rescued=0    ignored=0   
```