# Ansible

## With static inventory file

### `ansible-playbook playbooks/dev/main.yml --diff -i inventory/default.yml --private-key=~/.ssh/id_rsa_app_server`

    ...

    TASK [docker : Install Docker packages (with downgrade option).] ***********************************************************************************************
    The following additional packages will be installed:
      docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
    Suggested packages:
      aufs-tools cgroupfs-mount | cgroup-lite
    The following NEW packages will be installed:
      containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
      docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
    0 upgraded, 9 newly installed, 0 to remove and 43 not upgraded.
    changed: [vm1]

    TASK [docker : Install docker-compose plugin.] *****************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************
    skipping: [vm1]

    TASK [docker : Ensure /etc/docker/ directory exists.] **********************************************************************************************************
    skipping: [vm1]

    TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************
    ok: [vm1]

    TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************

    RUNNING HANDLER [docker : restart docker] **********************************************************************************************************************
    changed: [vm1]

    TASK [docker : include_tasks] **********************************************************************************************************************************
    included: /data/work/iu/devops-labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

    TASK [docker : Check current docker-compose version.] **********************************************************************************************************
    ok: [vm1]

    TASK [docker : set_fact] ***************************************************************************************************************************************
    ok: [vm1]

    TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************
    ok: [vm1]

    TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************
    changed: [vm1]

    TASK [docker : Get docker group info using getent.] ************************************************************************************************************
    skipping: [vm1]

    TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************

    TASK [docker : include_tasks] **********************************************************************************************************************************
    skipping: [vm1]

    PLAY RECAP *****************************************************************************************************************************************************
    vm1                        : ok=15   changed=6    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0

### `ansible-inventory -i inventory/default.yml --list`

    {
        "_meta": {
            "hostvars": {
                "vm1": {
                    "ansible_become": true,
                    "ansible_host": "51.250.82.130",
                    "ansible_user": "ubuntu"
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
                "vm1"
            ]
        }
    }

## With dynamic inventory file

### `ansible-playbook playbooks/yacloud_compute/main.yml --diff -i inventory/yacloud_compute.yml --private-key=~/.ssh/id_rsa_app_server`

    ...

    TASK [docker : Add Docker repository.] ****************************************************************************************************************************************************
    ok: [app-server]

    TASK [docker : Install Docker packages.] **************************************************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Install Docker packages (with downgrade option).] **************************************************************************************************************************
    ok: [app-server]

    TASK [docker : Install docker-compose plugin.] ********************************************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Install docker-compose-plugin (with downgrade option).] ********************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Ensure /etc/docker/ directory exists.] *************************************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Configure Docker daemon options.] ******************************************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Ensure Docker is started and enabled at boot.] *****************************************************************************************************************************
    ok: [app-server]

    TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] *************************************************************************************************************

    TASK [docker : include_tasks] *************************************************************************************************************************************************************
    included: /data/work/iu/devops-labs/ansible/roles/docker/tasks/docker-compose.yml for app-server

    TASK [docker : Check current docker-compose version.] *************************************************************************************************************************************
    ok: [app-server]

    TASK [docker : set_fact] ******************************************************************************************************************************************************************
    ok: [app-server]

    TASK [docker : Delete existing docker-compose version if it's different.] *****************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Install Docker Compose (if configured).] ***********************************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Get docker group info using getent.] ***************************************************************************************************************************************
    skipping: [app-server]

    TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************************************************

    TASK [docker : include_tasks] *************************************************************************************************************************************************************
    skipping: [app-server]

    PLAY RECAP ********************************************************************************************************************************************************************************
    app-server                 : ok=12   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0

### `ansible-inventory -i inventory/yacloud_compute.yml --list`

    {
        "_meta": {
            "hostvars": {
                "app-server": {
                    "ansible_host": "51.250.82.130"
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
                "app-server"
            ]
        }
    }
