# Running `ansible-playbook playbooks/dev/main.yml --diff`

```sh 
PLAY [Prepare docker] **********************************************************

TASK [Gathering Facts] *********************************************************
ok: [host]

TASK [docker : Load OS-specific vars.] *****************************************
ok: [host]

TASK [docker : include_tasks] **************************************************
skipping: [host]

TASK [docker : include_tasks] **************************************************
included: /Users/tasneemtoolba/Documents/fall2022/DevOps/devOpsLabs/ansible/roles/docker/tasks/setup-Debian.yml for host

TASK [docker : Ensure old versions of Docker are not installed.] ***************
ok: [host]

TASK [docker : Ensure dependencies are installed.] *****************************
ok: [host]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
ok: [host]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***
skipping: [host]

TASK [docker : Add Docker apt key.] ********************************************
ok: [host]

TASK [docker : Ensure curl is present (on older systems without SNI).] *********
skipping: [host]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ***
skipping: [host]

TASK [docker : Add Docker repository.] *****************************************
ok: [host]

TASK [docker : Install Docker packages.] ***************************************
ok: [host]

TASK [docker : Install Docker packages (with downgrade option).] ***************
skipping: [host]

TASK [docker : Install docker-compose plugin.] *********************************
skipping: [host]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
skipping: [host]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************
skipping: [host]

TASK [docker : Configure Docker daemon options.] *******************************
skipping: [host]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************
ok: [host]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [docker : include_tasks] **************************************************
included: /Users/tasneemtoolba/Documents/fall2022/DevOps/devOpsLabs/ansible/roles/docker/tasks/docker-compose.yml for host

TASK [docker : Check current docker-compose version.] **************************
ok: [host]

TASK [docker : set_fact] *******************************************************
ok: [host]

TASK [docker : Delete existing docker-compose version if it's different.] ******
ok: [host]

TASK [docker : Install Docker Compose (if configured).] ************************
changed: [host]

TASK [docker : Get docker group info using getent.] ****************************
skipping: [host]

TASK [docker : Check if there are any users to add to the docker group.] *******

TASK [docker : include_tasks] **************************************************
skipping: [host]

PLAY RECAP *********************************************************************
host                       : ok=15   changed=1    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   

```

# Running `ansible-playbook playbooks/dev/main.yml --diff`

```sh
{
    "_meta": {
        "hostvars": {
            "host": {
                "ansible_become": true,
                "ansible_host": "192.168.56.10",
                "ansible_user": "tux"
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
            "host"
        ]
    }
}
```