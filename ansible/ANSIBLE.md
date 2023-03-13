# Ansible

## Playbook

Running `ansible-playbook playbooks/dev/main.yml --diff`:

```
PLAY [Prepare docker] **************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************
ok: [localhost]

TASK [docker : include_tasks] ******************************************************************************************************************************
skipping: [localhost]

TASK [docker : include_tasks] ******************************************************************************************************************************
included: /Users/timurbl/inno/devops_labs/ansible/roles/docker/tasks/install_docker.yml for localhost

TASK [docker : Install Docker packages.] *******************************************************************************************************************
ok: [localhost]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************************************************
skipping: [localhost]

TASK [docker : Configure Docker daemon options.] ***********************************************************************************************************
skipping: [localhost]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************************************************************************************************************************
ok: [localhost]

TASK [docker : include_tasks] ******************************************************************************************************************************
included: /Users/timurbl/inno/devops_labs/ansible/roles/docker/tasks/install_compose.yml for localhost

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************************************

TASK [docker : Get docker group info using getent.] ********************************************************************************************************
skipping: [localhost]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************************************************
skipping: [localhost]

TASK [docker : include_tasks] ******************************************************************************************************************************
skipping: [localhost]

PLAY RECAP *************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0
```

## Inventory

Running `ansible-inventory -i default_aws_ec2.yaml --list`:

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

## AppPython

```
TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************************************
skipping: [localhost]
TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************************
ok: [localhost]
TASK [docker : include_tasks] **********************************************************************************************************************************************************
included: /Users/timurbl/inno/devops_labs/ansible/roles/docker/tasks/install_compose.yml for localhost
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
TASK [web_app : Create a directory if it does not exist] ****************************************************************************************************************************
ok: [localhost]
TASK [web_app : Move template to dest] **********************************************************************************************************************************************
ok: [localhost]
TASK [web_app : Run docker-compose] *************************************************************************************************************************************************
ok: [localhost]
PLAY RECAP *****************************************************************************************************************************************************************************
localhost                  : ok=26   changed=0    unreachable=0    failed=0    skipped=26   rescued=0    ignored=0
```
