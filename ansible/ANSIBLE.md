# Result of execution Ansible commands

Last 50 lines of output command `ansible-playbook` 
```
TASK [docker : Install Docker packages.] **************************************************************************************************************
changed: [yc_host]

TASK [docker : Install Docker packages (with downgrade option).] **************************************************************************************
skipping: [yc_host]

TASK [docker : Install docker-compose plugin.] ********************************************************************************************************
skipping: [yc_host]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ********************************************************************************
skipping: [yc_host]

TASK [docker : Ensure /etc/docker/ directory exists.] *************************************************************************************************
skipping: [yc_host]

TASK [docker : Configure Docker daemon options.] ******************************************************************************************************
skipping: [yc_host]

TASK [docker : Ensure Docker is started and enabled at boot.] *****************************************************************************************
ok: [yc_host]

RUNNING HANDLER [docker : restart docker] *************************************************************************************************************
changed: [yc_host]

TASK [docker : include_tasks] *************************************************************************************************************************
included: /mnt/labs/ansible/roles/docker/tasks/docker-compose.yml for yc_host

TASK [docker : Check current docker-compose version.] *************************************************************************************************
ok: [yc_host]

TASK [docker : set_fact] ******************************************************************************************************************************
skipping: [yc_host]

TASK [docker : Delete existing docker-compose version if it's different.] *****************************************************************************
skipping: [yc_host]

TASK [docker : Install Docker Compose (if configured).] ***********************************************************************************************
changed: [yc_host]

TASK [docker : Get docker group info using getent.] ***************************************************************************************************
skipping: [yc_host]

TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************

TASK [docker : include_tasks] *************************************************************************************************************************
skipping: [yc_host]

PLAY RECAP ********************************************************************************************************************************************
yc_host                    : ok=13   changed=6    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   

```
\
Output command `ansible-inventory`
```
{
    "_meta": {
        "hostvars": {
            "yc_host": {
                "ansible_host": "51.250.81.158",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "managed_nodes",
            "ungrouped"
        ]
    },
    "managed_nodes": {
        "hosts": [
            "yc_host"
        ]
    }
}

```