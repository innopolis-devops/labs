# The results of ansible run tasks
### `ansible-playbook -i inventory/yandex_cloud_vm.yml playbooks/dev/main.yaml`
<details>
    <summary>Full log</summary>

    PLAY [all] *************************************************************************************************************
    TASK [Gathering Facts] *************************************************************************************************
    ok: [vm]
    TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************
    ok: [vm]
    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    skipping: [vm]
    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    included: /home/andrew/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for vm
    TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************
    ok: [vm]
    TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************
    ok: [vm]
    TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****
    skipping: [vm]
    TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************
    ok: [vm]
    TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************
    changed: [vm]
    TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************
    skipping: [vm]
    TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************
    changed: [vm]
    TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************
    changed: [vm]
    TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************
    ok: [vm]
    TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************
    RUNNING HANDLER [geerlingguy.docker : restart docker] ******************************************************************
    changed: [vm]
    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    included: /home/andrew/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for vm
    TASK [geerlingguy.docker : Check current docker-compose version.] ******************************************************
    ok: [vm]
    TASK [geerlingguy.docker : set_fact] ***********************************************************************************
    ok: [vm]
    TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] **********************************
    ok: [vm]
    TASK [geerlingguy.docker : Install Docker Compose (if configured).] ****************************************************
    changed: [vm]
    TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************
    skipping: [vm]
    TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************
    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    skipping: [vm]
    TASK [Update apt repos cache] ******************************************************************************************
    ok: [vm]
    PLAY RECAP *************************************************************************************************************
    vm                         : ok=17   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
</details>

### `ansible-inventory -i inventory/yandex_cloud_vm.yml --list`
```sh
ex_cloud_vm.yml --list
{
    "_meta": {
        "hostvars": {
            "vm": {
                "ansible_host": "62.84.125.48",
                "ansible_ssh_private_key_file": "~/.ssh/id_rsa",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "msc_serv",
            "ungrouped"
        ]
    },
    "msc_serv": {
        "hosts": [
            "vm"
        ]
    }
}
```

## Ansible with `web_app` role:

`ansible-playbook -i inventory/yandex_cloud_vm.yml -t web_app playbooks/dev/main.yaml`

<details>
    <summary>Full log</summary>

    PLAY [all] *************************************************************************************************************

    TASK [Gathering Facts] *************************************************************************************************
    ok: [vm]

    TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************
    ok: [vm]

    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    skipping: [vm]

    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    included: /home/andrew/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for vm

    TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************
    ok: [vm]

    TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************
    ok: [vm]

    TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****
    skipping: [vm]

    TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************
    ok: [vm]

    TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************
    changed: [vm]

    TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************
    skipping: [vm]

    TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************
    changed: [vm]

    TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************
    changed: [vm]

    TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************
    ok: [vm]

    TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************

    RUNNING HANDLER [geerlingguy.docker : restart docker] ******************************************************************
    changed: [vm]

    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    included: /home/andrew/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for vm

    TASK [geerlingguy.docker : Check current docker-compose version.] ******************************************************
    ok: [vm]

    TASK [geerlingguy.docker : set_fact] ***********************************************************************************
    ok: [vm]

    TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] **********************************
    ok: [vm]

    TASK [geerlingguy.docker : Install Docker Compose (if configured).] ****************************************************
    changed: [vm]

    TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************
    skipping: [vm]

    TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************

    TASK [geerlingguy.docker : include_tasks] ******************************************************************************
    skipping: [vm]

    TASK [geerlingguy.pip : Ensure Pip is installed.] **********************************************************************
    changed: [vm]

    TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] ****************************************************
    changed: [vm] => (item={'name': 'pip', 'extra_args': '--upgrade'})
    changed: [vm] => (item={'name': 'docker'})
    changed: [vm] => (item={'name': 'docker-compose'})

    TASK [web_app : Wipe] **************************************************************************************************
    skipping: [vm]

    TASK [web_app : Create a base dir] *************************************************************************************
    changed: [vm]

    TASK [web_app : Template a file to base dir] ***************************************************************************
    changed: [vm]

    TASK [web_app : Start docker-compose] **********************************************************************************
    changed: [vm]

    TASK [Update apt repos cache] ******************************************************************************************
    ok: [vm]

    PLAY RECAP *************************************************************************************************************
    vm                         : ok=22   changed=10   unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
</details>

### The healthcheck is working:
```sh
$ docker inspect --format "{{json .State.Health }}" <container name>
{"Status":"healthy","FailingStreak":0,"Log":[{"Start":"2022-10-10T19:40:03.106264092Z","End":"2022-10-10T19:40:03.181327787Z","ExitCode":0,"Output":"Connecting to localhost:5000 (127.0.0.1:5000)\nremote file exists\n"}]}
```

The metrics added to the app can be seen on `/stats` web-site's page
