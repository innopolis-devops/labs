The result playbook execution:

```ps
tony@SENTIA:~/devops/ansible$ ansible-playbook playbooks/dev/playbook.yml --diff

PLAY [Install Docker On VM1] *************************************************************************************************
TASK [Gathering Facts] *******************************************************************************************************ok: [bobamachine]

TASK [ansible_role_docker : Load OS-specific vars.] **************************************************************************ok: [bobamachine]

TASK [ansible_role_docker : include_tasks] ***********************************************************************************skipping: [bobamachine]

TASK [ansible_role_docker : include_tasks] ***********************************************************************************included: /home/tony/devops/ansible/roles/ansible_role_docker/tasks/setup-Debian.yml for bobamachine

TASK [ansible_role_docker : Ensure old versions of Docker are not installed.] ************************************************ok: [bobamachine]

TASK [ansible_role_docker : Ensure dependencies are installed.] **************************************************************ok: [bobamachine]

TASK [ansible_role_docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *********skipping: [bobamachine]

TASK [ansible_role_docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ******************************ok: [bobamachine]

TASK [ansible_role_docker : Add Docker apt key.] *****************************************************************************changed: [bobamachine]

TASK [ansible_role_docker : Ensure curl is present (on older systems without SNI).] ******************************************skipping: [bobamachine]

TASK [ansible_role_docker : Add Docker apt key (alternative for older systems without SNI).] *********************************skipping: [bobamachine]

TASK [ansible_role_docker : Add Docker repository.] **************************************************************************--- before: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -1 +1,2 @@
 deb https://download.docker.com/linux/ubuntu focal stable
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [bobamachine]

TASK [ansible_role_docker : Install Docker packages.] ************************************************************************skipping: [bobamachine]

TASK [ansible_role_docker : Install Docker packages (with downgrade option).] ************************************************ok: [bobamachine]

TASK [ansible_role_docker : Install docker-compose plugin.] ******************************************************************skipping: [bobamachine]

TASK [ansible_role_docker : Install docker-compose-plugin (with downgrade option).] ******************************************skipping: [bobamachine]

TASK [ansible_role_docker : Ensure /etc/docker/ directory exists.] ***********************************************************skipping: [bobamachine]

TASK [ansible_role_docker : Configure Docker daemon options.] ****************************************************************skipping: [bobamachine]

TASK [ansible_role_docker : Ensure Docker is started and enabled at boot.] ***************************************************ok: [bobamachine]

TASK [ansible_role_docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************
TASK [ansible_role_docker : include_tasks] ***********************************************************************************included: /home/tony/devops/ansible/roles/ansible_role_docker/tasks/docker-compose.yml for bobamachine

TASK [ansible_role_docker : Check current docker-compose version.] ***********************************************************ok: [bobamachine]

TASK [ansible_role_docker : set_fact] ****************************************************************************************skipping: [bobamachine]

TASK [ansible_role_docker : Delete existing docker-compose version if it's different.] ***************************************skipping: [bobamachine]

TASK [ansible_role_docker : Install Docker Compose (if configured).] *********************************************************changed: [bobamachine]

TASK [ansible_role_docker : Get docker group info using getent.] *************************************************************skipping: [bobamachine]

TASK [ansible_role_docker : Check if there are any users to add to the docker group.] ****************************************skipping: [bobamachine]

TASK [ansible_role_docker : include_tasks] ***********************************************************************************skipping: [bobamachine]

PLAY RECAP *******************************************************************************************************************bobamachine                : ok=13   changed=3    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```
Inventory:
```ps
tony@SENTIA:~/devops/ansible$ ansible-inventory -i inventory/inventory.yaml --list
{
    "_meta": {
        "hostvars": {
            "bobamachine": {
                "ansible_host": "51.250.16.188",
                "ansible_user": "megaman"
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
            "bobamachine"
        ]
    }
}
```