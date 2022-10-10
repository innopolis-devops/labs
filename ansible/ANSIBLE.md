# Ansible Lab 1

## 1

```shell
$ansible-playbook playbooks/dev/main.yml --diff

PLAY [Install Docker] *******************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Load OS-specific vars.] **************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : include_tasks] ***********************************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : include_tasks] ***********************************************************************************************************************************************
included: /Users/maxim/Study/devops/innopolis-devops-labs/ansible/roles/docker/tasks/setup-Debian.yml for yacloud-vm

TASK [docker : Ensure old versions of Docker are not installed.] ************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure dependencies are installed.] **************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *********************************************************************
skipping: [yacloud-vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ******************************************************************************************
ok: [yacloud-vm]

TASK [docker : Add Docker apt key.] *****************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure curl is present (on older systems without SNI).] ******************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] *********************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Add Docker repository.] **************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Install Docker packages.] ************************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Install Docker packages (with downgrade option).] ************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Install docker-compose plugin.] ******************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ******************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Ensure /etc/docker/ directory exists.] ***********************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Ensure Docker is started and enabled at boot.] ***************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************

TASK [docker : include_tasks] ***********************************************************************************************************************************************
included: /Users/maxim/Study/devops/innopolis-devops-labs/ansible/roles/docker/tasks/docker-compose.yml for yacloud-vm

TASK [docker : Check current docker-compose version.] ***********************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : set_fact] ****************************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Delete existing docker-compose version if it's different.] ***************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Install Docker Compose (if configured).] *********************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Get docker group info using getent.] *************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Check if there are any users to add to the docker group.] ****************************************************************************************************

TASK [docker : include_tasks] ***********************************************************************************************************************************************
skipping: [yacloud-vm]

PLAY RECAP ******************************************************************************************************************************************************************
yacloud-vm                 : ok=13   changed=0    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0

```

## 2

```shell
$ansible-inventory -i inventory/main.yml --list
{
    "_meta": {
        "hostvars": {
            "yacloud-vm": {
                "ansible_become": true,
                "ansible_host": "51.250.102.181",
                "ansible_user": "app"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
    "ungrouped": {
        "hosts": [
            "yacloud-vm"
        ]
    }
}
```

# Ansible Lab 2

```shell
$ansible-playbook playbooks/dev/main.yml

PLAY [Install web_app] ******************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Load OS-specific vars.] **************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : include_tasks] ***********************************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : include_tasks] ***********************************************************************************************************************************************
included: /Users/maxim/Study/devops/innopolis-devops-labs/ansible/roles/docker/tasks/setup-Debian.yml for yacloud-vm

TASK [docker : Ensure old versions of Docker are not installed.] ************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure dependencies are installed.] **************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *********************************************************************
skipping: [yacloud-vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ******************************************************************************************
ok: [yacloud-vm]

TASK [docker : Add Docker apt key.] *****************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure curl is present (on older systems without SNI).] ******************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] *********************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Add Docker repository.] **************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Install Docker packages.] ************************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Install Docker packages (with downgrade option).] ************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Install docker-compose plugin.] ******************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ******************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Ensure /etc/docker/ directory exists.] ***********************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Ensure Docker is started and enabled at boot.] ***************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************

TASK [docker : include_tasks] ***********************************************************************************************************************************************
included: /Users/maxim/Study/devops/innopolis-devops-labs/ansible/roles/docker/tasks/docker-compose.yml for yacloud-vm

TASK [docker : Check current docker-compose version.] ***********************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : set_fact] ****************************************************************************************************************************************************
ok: [yacloud-vm]

TASK [docker : Delete existing docker-compose version if it's different.] ***************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Install Docker Compose (if configured).] *********************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Get docker group info using getent.] *************************************************************************************************************************
skipping: [yacloud-vm]

TASK [docker : Check if there are any users to add to the docker group.] ****************************************************************************************************

TASK [docker : include_tasks] ***********************************************************************************************************************************************
skipping: [yacloud-vm]

TASK [web_app : Install dependencies] ***************************************************************************************************************************************
included: /Users/maxim/Study/devops/innopolis-devops-labs/ansible/roles/web_app/tasks/dependencies.yml for yacloud-vm

TASK [web_app : Install pip] ************************************************************************************************************************************************
ok: [yacloud-vm]

TASK [web_app : Install docker libraries] ***********************************************************************************************************************************
ok: [yacloud-vm]

TASK [web_app : Start docker] ***********************************************************************************************************************************************
ok: [yacloud-vm]

TASK [web_app : Copy docker-compose.yml] ************************************************************************************************************************************
changed: [yacloud-vm]

TASK [web_app : Run docker-compose] *****************************************************************************************************************************************
changed: [yacloud-vm]

PLAY RECAP ******************************************************************************************************************************************************************
yacloud-vm                 : ok=19   changed=2    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0

```