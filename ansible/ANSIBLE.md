# Ansible

## 1
```

PLAY [Install Docker] ******************************************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************************
Enter passphrase for key '/Users/diazzzu/.ssh/id_rsa': 
ok: [vm1]

TASK [docker : Load OS-specific vars.] *************************************************************************************************************************************
ok: [vm1]

TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [vm1]

TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/diazzzu/PycharmProjects/labs/ansible/roles/docker/tasks/setup-Debian.yml for vm1

TASK [docker : Ensure old versions of Docker are not installed.] ***********************************************************************************************************
ok: [vm1]

TASK [docker : Ensure dependencies are installed.] *************************************************************************************************************************
ok: [vm1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ********************************************************************
ok: [vm1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *****************************************************************************************
skipping: [vm1]

TASK [docker : Add Docker apt key.] ****************************************************************************************************************************************
ok: [vm1]

TASK [docker : Ensure curl is present (on older systems without SNI).] *****************************************************************************************************
skipping: [vm1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ********************************************************************************************
skipping: [vm1]

TASK [docker : Add Docker repository.] *************************************************************************************************************************************
ok: [vm1]

TASK [docker : Install Docker packages.] ***********************************************************************************************************************************
skipping: [vm1]

TASK [docker : Install Docker packages (with downgrade option).] ***********************************************************************************************************
ok: [vm1]

TASK [docker : Install docker-compose plugin.] *****************************************************************************************************************************
fatal: [vm1]: FAILED! => {"msg": "The conditional check 'docker_install_compose_plugin | bool == true and (ansible_version.full is version_compare('2.12', '<') or ansible_os_family not in ['RedHat', 'Debian'])' failed. The error was: error while evaluating conditional (docker_install_compose_plugin | bool == true and (ansible_version.full is version_compare('2.12', '<') or ansible_os_family not in ['RedHat', 'Debian'])): 'docker_install_compose_plugin' is undefined\n\nThe error appears to be in '/Users/diazzzu/PycharmProjects/labs/ansible/roles/docker/tasks/main.yml': line 36, column 3, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n- name: Install docker-compose plugin.\n  ^ here\n"}
...ignoring

TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************
fatal: [vm1]: FAILED! => {"msg": "The conditional check 'docker_install_compose_plugin | bool == true and ansible_version.full is version_compare('2.12', '>=') and ansible_os_family in ['RedHat', 'Debian']' failed. The error was: error while evaluating conditional (docker_install_compose_plugin | bool == true and ansible_version.full is version_compare('2.12', '>=') and ansible_os_family in ['RedHat', 'Debian']): 'docker_install_compose_plugin' is undefined\n\nThe error appears to be in '/Users/diazzzu/PycharmProjects/labs/ansible/roles/docker/tasks/main.yml': line 44, column 3, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n- name: Install docker-compose-plugin (with downgrade option).\n  ^ here\n"}
...ignoring

TASK [docker : Ensure /etc/docker/ directory exists.] **********************************************************************************************************************
skipping: [vm1]

TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************************
skipping: [vm1]

TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************
ok: [vm1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/diazzzu/PycharmProjects/labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

TASK [docker : Check current docker-compose version.] **********************************************************************************************************************
ok: [vm1]

TASK [docker : set_fact] ***************************************************************************************************************************************************
ok: [vm1]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************
ok: [vm1]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************
changed: [vm1]

TASK [docker : Get docker group info using getent.] ************************************************************************************************************************
skipping: [vm1]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [vm1]

PLAY RECAP *****************************************************************************************************************************************************************
vm1                        : ok=17   changed=1    unreachable=0    failed=0    skipped=10   rescued=0    ignored=2 
```

## 2

```
{
    "_meta": {
        "hostvars": {
            "vm1": {
                "ansible_become": true,
                "ansible_host": "34.159.144.214",
                "ansible_user": "diazzzu"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "virtualmachines"
        ]
    },
    "virtualmachines": {
        "hosts": [
            "vm1"
        ]
    }
}
```