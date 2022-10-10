# OUTPUT
## run playbook
```
TASK [docker : Install Docker packages (with downgrade option).] *****************************************************************************************************************************The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 29 not upgraded.
changed: [virtualmachine]

TASK [docker : Install docker-compose plugin.] ***********************************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***********************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Ensure /etc/docker/ directory exists.] ****************************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Configure Docker daemon options.] *********************************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Ensure Docker is started and enabled at boot.] ********************************************************************************************************************************ok: [virtualmachine]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ****************************************************************************************************************
RUNNING HANDLER [docker : restart docker] ****************************************************************************************************************************************************changed: [virtualmachine]

TASK [docker : include_tasks] ****************************************************************************************************************************************************************included: /mnt/c/Users/amiro/OneDrive/Рабочий стол/projects/labs/ansible/roles/docker/tasks/docker-compose.yml for virtualmachine

TASK [docker : Check current docker-compose version.] ****************************************************************************************************************************************ok: [virtualmachine]

TASK [docker : set_fact] *********************************************************************************************************************************************************************ok: [virtualmachine]

TASK [docker : Delete existing docker-compose version if it's different.] ********************************************************************************************************************ok: [virtualmachine]

TASK [docker : Install Docker Compose (if configured).] **************************************************************************************************************************************changed: [virtualmachine]

TASK [docker : Get docker group info using getent.] ******************************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Check if there are any users to add to the docker group.] *********************************************************************************************************************
TASK [docker : include_tasks] ****************************************************************************************************************************************************************skipping: [virtualmachine]

PLAY RECAP ***********************************************************************************************************************************************************************************virtualmachine             : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```
## inventory list
```
{
    "VM": {
        "hosts": [
            "virtualmachine"
        ]
    },
    "_meta": {
        "hostvars": {
            "virtualmachine": {
                "ansible_become": true,
                "ansible_host": "51.250.28.106",
                "ansible_ssh_private_key_file": "~/key",
                "ansible_user": "aldeeyar"
            }
        }
    },
    "all": {
        "children": [
            "VM",
            "ungrouped"
        ]
    }
}
```

## DEPLOYING MY APP (on yandex cloud)
```
TASK [docker : Add Docker apt key.] *********************************************************************************************************************************************ok: [virtualmachine]

TASK [docker : Ensure curl is present (on older systems without SNI).] **********************************************************************************************************skipping: [virtualmachine]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] *************************************************************************************************skipping: [virtualmachine]

TASK [docker : Add Docker repository.] ******************************************************************************************************************************************ok: [virtualmachine]

TASK [docker : Install Docker packages.] ****************************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Install Docker packages (with downgrade option).] ****************************************************************************************************************ok: [virtualmachine]

TASK [docker : Install docker-compose plugin.] **********************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Install docker-compose-plugin (with downgrade option).] **********************************************************************************************************skipping: [virtualmachine]

TASK [docker : Ensure /etc/docker/ directory exists.] ***************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Configure Docker daemon options.] ********************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Ensure Docker is started and enabled at boot.] *******************************************************************************************************************ok: [virtualmachine]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***************************************************************************************************
TASK [docker : include_tasks] ***************************************************************************************************************************************************included: /mnt/c/Users/amiro/OneDrive/Рабочий стол/projects/labs/ansible/roles/docker/tasks/docker-compose.yml for virtualmachine

TASK [docker : Check current docker-compose version.] ***************************************************************************************************************************ok: [virtualmachine]

TASK [docker : set_fact] ********************************************************************************************************************************************************ok: [virtualmachine]

TASK [docker : Delete existing docker-compose version if it's different.] *******************************************************************************************************skipping: [virtualmachine]

TASK [docker : Install Docker Compose (if configured).] *************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Get docker group info using getent.] *****************************************************************************************************************************skipping: [virtualmachine]

TASK [docker : Check if there are any users to add to the docker group.] ********************************************************************************************************
TASK [docker : include_tasks] ***************************************************************************************************************************************************skipping: [virtualmachine]

TASK [web_app : Stop a container] ***********************************************************************************************************************************************ok: [virtualmachine]

TASK [web_app : Remove app directory] *******************************************************************************************************************************************changed: [virtualmachine]

TASK [web_app : Create directory for app] ***************************************************************************************************************************************changed: [virtualmachine]

TASK [web_app : Copy app directory] *********************************************************************************************************************************************changed: [virtualmachine]

TASK [web_app : build container image] ******************************************************************************************************************************************changed: [virtualmachine]

PLAY RECAP **********************************************************************************************************************************************************************virtualmachine             : ok=18   changed=4    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0   
```