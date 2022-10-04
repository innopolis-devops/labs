# The result of ansible run tasks

### `ansible-playbook -i inventory/yandex_cloud_vm.yml playbooks/dev/main.yaml`

```sh
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
```


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