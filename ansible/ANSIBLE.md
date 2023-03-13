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
