## Dev

The output of the `ansible-playbook playbooks/dev/main.yml --diff` command

```text
PLAY [Docker] ****************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : include_tasks] ************************************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_docker.yml for 127.0.0.1

TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_compose.yml for 127.0.0.1

TASK [docker : Check current docker-compose version.] ************************************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : set_fact] *****************************************************************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************************************
changed: [127.0.0.1]

TASK [docker : Get docker group info using getent.] **************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************************************
skipping: [127.0.0.1]

PLAY RECAP *******************************************************************************************************************************************************************************
127.0.0.1                  : ok=7    changed=1    unreachable=0    failed=0    skipped=10   rescued=0    ignored=0   
```

The output of the `ansible-inventory -i inventory/default.yml --list`

```text
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

## Yandex.Cloud

Initially, one have to create a file called `yacloud.token` in the ansible root and provide it with the Yandex OAuth token.
Also, there should be a running Yandex.Cloud machine. It is achievable by executing `terraform apply` in the `./terraform/yc` directory.
Finally, there is a private-public key mapping, so you have to manage it by yourself (if you are willing to run it locally)

The output of the `ansible-playbook playbooks/yacloud/main.yml --diff` command

```text
PLAY [Docker] ****************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/setup_debian.yml for terraform

TASK [docker : Ensure old versions of Docker are not installed.] *************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure dependencies are installed.] ***************************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key.] ******************************************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure curl is present (on older systems without SNI).] *******************************************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **********************************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker repository.] ***************************************************************************************************************************************************
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_docker.yml for terraform

TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************************************
ok: [terraform]

TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************************************
skipping: [terraform]

TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_compose.yml for terraform

TASK [docker : Check current docker-compose version.] ************************************************************************************************************************************
ok: [terraform]

TASK [docker : set_fact] *****************************************************************************************************************************************************************
ok: [terraform]

TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************************************
skipping: [terraform]

TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************************************
skipping: [terraform]

TASK [docker : Get docker group info using getent.] **************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************************************
skipping: [terraform]

PLAY RECAP *******************************************************************************************************************************************************************************
terraform                  : ok=12   changed=0    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```

The output of the `ansible-inventory -i inventory/yacloud_compute.yml --list`

```text
{
    "_meta": {
        "hostvars": {
            "terraform": {
                "ansible_host": "51.250.86.186"
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
            "terraform"
        ]
    }
}
```

Then, I SSHed to the VM and checked that docker and docker-compose are indeed installed