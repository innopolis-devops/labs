# Lab 5 #

## Playbook ##

```
dapp-anyway@DESKTOP-H7HVR0O:/mnt/c/Users/dappa/devops/devops/ansible$ ansible-playbook playbooks/dev/main.yml
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Configure Docker] *****************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : include_tasks] ***********************************************************************************************
included: /mnt/c/Users/dappa/devops/devops/ansible/roles/docker/tasks/setup_debian.yml for 127.0.0.1

TASK [../../roles/docker : Ensure old versions of Docker are not installed.] ************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : Ensure dependencies are installed.] **************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *********************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ******************************************
ok: [127.0.0.1]

TASK [../../roles/docker : Add Docker apt key.] *****************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure curl is present (on older systems without SNI).] ******************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : Add Docker repository.] **************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : include_tasks] ***********************************************************************************************
included: /mnt/c/Users/dappa/devops/devops/ansible/roles/docker/tasks/install_docker.yml for 127.0.0.1

TASK [../../roles/docker : Install Docker packages.] ************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure /etc/docker/ directory exists.] ***********************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Configure Docker daemon options.] ****************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure Docker is started and enabled at boot.] ***************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : include_tasks] **************************************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Check current docker-compose version.] **************************************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : set_fact] *******************************************************************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : Delete existing docker-compose version if it's different.] ******************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Install Docker Compose (if configured).] ************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Install docker-compose plugin.] *********************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Install docker-compose-plugin (with downgrade option).] *********************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure handlers are notified now to avoid firewall conflicts.] **************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Get docker group info using getent.] ****************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Check if there are any users to add to the docker group.] *******************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : include_tasks] **************************************************************************************************************************************************************
skipping: [127.0.0.1]

PLAY RECAP ******************************************************************************************************************************
127.0.0.1                  : ok=12    changed=0    unreachable=0    failed=0    skipped=14    rescued=0    ignored=0
```

## Inventory ##

```
dapp-anyway@DESKTOP-H7HVR0O:/mnt/c/Users/dappa/devops/devops/ansible$ ansible-inventory -i default_aws_ec2.yaml --list  
[WARNING]: Unable to parse /mnt/c/Users/dappa/devops/devops/ansible/default_aws_ec2.yaml as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    }
}
```

# Lab 6 #

50 last lines of the output of the deployment command `ansible-playbook playbooks/yc/main.yml --diff`


...
TASK [../../roles/docker : Configure Docker daemon options.] ***************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : include_tasks] **********************************************************************************************************************************************************
included: /home/sokratmillman/IU/devcourse/labs/ansible/roles/docker/tasks/install_compose.yml for localhost

TASK [../../roles/docker : Check current docker-compose version.] **********************************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : set_fact] ***************************************************************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/docker : Delete existing docker-compose version if it's different.] **************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Install Docker Compose (if configured).] ********************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Install docker-compose plugin.] *****************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************************

TASK [../../roles/docker : Get docker group info using getent.] ************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : Check if there are any users to add to the docker group.] ***************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/docker : include_tasks] **********************************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [../../roles/app_role : Create a directory if it does not exist] ****************************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/app_role : Move template to dest] **********************************************************************************************************************************************
ok: [127.0.0.1]

TASK [../../roles/app_role : Run docker-compose] *************************************************************************************************************************************************
ok: [127.0.0.1]

PLAY RECAP *****************************************************************************************************************************************************************************
localhost                  : ok=22   changed=0    unreachable=0    failed=0    skipped=23   rescued=0    ignored=0   
```