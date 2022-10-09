# Ansible

## Lab5:  
```
ansible-playbook playbooks/dev/main.yml --diff
```
Output:

```shell
PLAY [Install docker] ************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************************
fatal: [yacloud]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ubuntu@62.84.118.130: Permission denied (publickey).", "unreachable": true}

PLAY RECAP ***********************************************************************************************************************************************************************************************************
yacloud                    : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   

(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/ansible$ ansible-playbook playbooks/dev/main.yml --diff
[WARNING]:  * Failed to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml with auto plugin: The yacloud dynamic inventory plugin requires yandexcloud
[WARNING]:  * Failed to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml with yaml plugin: Plugin configuration YAML file, not YAML inventory
[WARNING]:  * Failed to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml with ini plugin: Invalid host pattern 'plugin:' supplied, ending in ':' is not allowed, this character is
reserved to provide a port.
[WARNING]: Unable to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml as an inventory source

PLAY [Install docker] ************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Load OS-specific vars.] *******************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/setup-Debian.yml for yacloud

TASK [docker : Ensure old versions of Docker are not installed.] *****************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Add Docker apt key.] **********************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Ensure curl is present (on older systems without SNI).] ***********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Add Docker repository.] *******************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Install Docker packages.] *****************************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install Docker packages (with downgrade option).] *****************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Install docker-compose plugin.] ***********************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Ensure /etc/docker/ directory exists.] ****************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Configure Docker daemon options.] *********************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Ensure Docker is started and enabled at boot.] ********************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ****************************************************************************************************************************************

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/docker-compose.yml for yacloud

TASK [docker : Check current docker-compose version.] ****************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : set_fact] *********************************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Delete existing docker-compose version if it's different.] ********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install Docker Compose (if configured).] **************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Get docker group info using getent.] ******************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Check if there are any users to add to the docker group.] *********************************************************************************************************************************************

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
skipping: [yacloud]

PLAY RECAP ***********************************************************************************************************************************************************************************************************
yacloud                    : ok=11   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   

(venv) talgat@talgat-VirtualBox:~/PycharmProjects/DevOpsLabs/ansible$ ansible-playbook playbooks/dev/main.yml --diff
[WARNING]:  * Failed to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml with auto plugin: The yacloud dynamic inventory plugin requires yandexcloud
[WARNING]:  * Failed to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml with yaml plugin: Plugin configuration YAML file, not YAML inventory
[WARNING]:  * Failed to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml with ini plugin: Invalid host pattern 'plugin:' supplied, ending in ':' is not allowed, this character is
reserved to provide a port.
[WARNING]: Unable to parse /home/talgat/PycharmProjects/DevOpsLabs/ansible/inventory/yacloud_compute.yml as an inventory source

PLAY [Install docker] ************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Load OS-specific vars.] *******************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/setup-Debian.yml for yacloud

TASK [docker : Ensure old versions of Docker are not installed.] *****************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Add Docker apt key.] **********************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Ensure curl is present (on older systems without SNI).] ***********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Add Docker repository.] *******************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Install Docker packages.] *****************************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install Docker packages (with downgrade option).] *****************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Install docker-compose plugin.] ***********************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Ensure /etc/docker/ directory exists.] ****************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Configure Docker daemon options.] *********************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Ensure Docker is started and enabled at boot.] ********************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ****************************************************************************************************************************************

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/docker-compose.yml for yacloud

TASK [docker : Check current docker-compose version.] ****************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : set_fact] *********************************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Delete existing docker-compose version if it's different.] ********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install Docker Compose (if configured).] **************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Get docker group info using getent.] ******************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Check if there are any users to add to the docker group.] *********************************************************************************************************************************************

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
skipping: [yacloud]

PLAY RECAP ***********************************************************************************************************************************************************************************************************
yacloud                    : ok=11   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   

```
##
```
ansible-inventory -i inventory/default.yml --list
```
Output:
```
{
    "_meta": {
        "hostvars": {
            "yacloud": {
                "ansible_become": true,
                "ansible_host": "62.84.118.130",
                "ansible_user": "talgat"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "vm"
        ]
    },
    "vm": {
        "hosts": [
            "yacloud"
        ]
    }
}

```

```
ansible-playbook playbooks/dev/main.yml --diff -i inventory/default.yml --private-key=~/.ssh/id_ed25519
```
Output:

```
PLAY [Install docker] ************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Load OS-specific vars.] *******************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/setup-Debian.yml for yacloud

TASK [docker : Ensure old versions of Docker are not installed.] *****************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Add Docker apt key.] **********************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Ensure curl is present (on older systems without SNI).] ***********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Add Docker repository.] *******************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Install Docker packages.] *****************************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install Docker packages (with downgrade option).] *****************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Install docker-compose plugin.] ***********************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Ensure /etc/docker/ directory exists.] ****************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Configure Docker daemon options.] *********************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Ensure Docker is started and enabled at boot.] ********************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ****************************************************************************************************************************************

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/docker-compose.yml for yacloud

TASK [docker : Check current docker-compose version.] ****************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : set_fact] *********************************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Delete existing docker-compose version if it's different.] ********************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Install Docker Compose (if configured).] **************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Get docker group info using getent.] ******************************************************************************************************************************************************************
skipping: [yacloud]

TASK [docker : Check if there are any users to add to the docker group.] *********************************************************************************************************************************************

TASK [docker : include_tasks] ****************************************************************************************************************************************************************************************
skipping: [yacloud]

PLAY RECAP ***********************************************************************************************************************************************************************************************************
yacloud                    : ok=11   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0  
```
## Lab6:

```shell
ansible-playbook ./playbooks/dev/lab6.yml  --diff | tail -n50
```

Output:

```shell
TASK [docker : Ensure /etc/docker/ directory exists.] **************************
skipping: [yacloud]

TASK [docker : Configure Docker daemon options.] *******************************
skipping: [yacloud]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************
ok: [yacloud]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [docker : include_tasks] **************************************************
included: /home/talgat/PycharmProjects/DevOpsLabs/ansible/roles/docker/tasks/docker-compose.yml for yacloud

TASK [docker : Check current docker-compose version.] **************************
ok: [yacloud]

TASK [docker : set_fact] *******************************************************
ok: [yacloud]

TASK [docker : Delete existing docker-compose version if it's different.] ******
skipping: [yacloud]

TASK [docker : Install Docker Compose (if configured).] ************************
skipping: [yacloud]

TASK [docker : Get docker group info using getent.] ****************************
skipping: [yacloud]

TASK [docker : Check if there are any users to add to the docker group.] *******

TASK [docker : include_tasks] **************************************************
skipping: [yacloud]

TASK [web_app : Include wipe task list in play] ********************************
skipping: [yacloud]

TASK [web_app : Create a directory if it does not exist] ***********************
ok: [yacloud]

TASK [web_app : Template a docker-compose.yml] *********************************
ok: [yacloud]

TASK [web_app : Run docker-compose services] ***********************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ModuleNotFoundError: No module named 'docker'
fatal: [yacloud]: FAILED! => {"changed": false, "msg": "Failed to import the required Python library (Docker SDK for Python: docker above 5.0.0 (Python >= 3.6) or docker before 5.0.0 (Python 2.7) or docker-py (Python 2.6)) on talgat's Python /usr/bin/python3. Please read the module documentation and install it in the appropriate location. If the required library is installed, but Ansible is using the wrong Python interpreter, please consult the documentation on ansible_python_interpreter, for example via `pip install docker` (Python >= 3.6) or `pip install docker==4.4.4` (Python 2.7) or `pip install docker-py` (Python 2.6). The error was: No module named 'docker'"}

PLAY RECAP *********************************************************************
yacloud                    : ok=13   changed=0    unreachable=0    failed=1    skipped=14   rescued=0    ignored=0  
```