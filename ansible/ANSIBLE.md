# Ansible

### 50 last lines of the output of the your deployment command 

After Running ```ansible-playbook playbooks/dev/main.yml --diff```
 
```
TASK [docker : Install docker-compose plugin.] ******************************************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Install docker-compose-plugin (with downgrade option).] ******************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Ensure /etc/docker/ directory exists.] ***********************************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Ensure Docker is started and enabled at boot.] ***************************************************************************************************************************
    ok: [vm1]

    TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************************

    RUNNING HANDLER [docker : restart docker] ***********************************************************************************************************************************************
    changed: [vm1]

    TASK [docker : include_tasks] ***********************************************************************************************************************************************************
    included: /home/khalil/Desktop/study/Devops-labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

    TASK [docker : Check current docker-compose version.] ***********************************************************************************************************************************
    ok: [vm1]

    TASK [docker : set_fact] ****************************************************************************************************************************************************************
    ok: [vm1]

    TASK [docker : Delete existing docker-compose version if it's different.] ***************************************************************************************************************
    ok: [vm1]

    TASK [docker : Install Docker Compose (if configured).] *********************************************************************************************************************************
    changed: [vm1]

    TASK [docker : Get docker group info using getent.] *************************************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Check if there are any users to add to the docker group.] ****************************************************************************************************************

    TASK [docker : include_tasks] ***********************************************************************************************************************************************************
    skipping: [vm1]

    PLAY RECAP ******************************************************************************************************************************************************************************
    vm1                        : ok=16   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0 


```
 
 
### output of the following command: 

```ansible-inventory -i inventory/main.yml --list```

```
    {
        "_meta": {
            "hostvars": {
                "vm1": {
                    "ansible_host": "51.250.80.61",
                    "ansible_user": "test"
                }
            }
        },
        "all": {
            "children": [
                "ungrouped",
                "vms"
            ]
        },
    }

```
