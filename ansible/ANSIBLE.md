# Ansible

## Install Ansible

1. Run this command to install the Ansible package for the current user:

    ```bash
    python3 -m pip install --user ansible
    ```

1. Check the version of the ansible package that has been installed:

    ```bash
    python3 -m pip show ansible
    ```

## Create an ansible role for docker

1. Install the package from `ansible-galaxy`:

    ```bash
    ansible-galaxy install geerlingguy.docker
    ```

1. Provide this predefined role in playbooks configuration:

    ```bash
    roles: 
        - geerlingguy.docker
    ```

## Outputs

1. Output of 'ansible-playbook <path_to your_playbook> --diff':

   ```sh
    The following additional packages will be installed:
    docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
    Suggested packages:
    aufs-tools cgroupfs-mount | cgroup-lite
    The following NEW packages will be installed:
    containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
    docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
    0 upgraded, 9 newly installed, 0 to remove and 32 not upgraded.
    changed: [yacloud-vm]

    TASK [geerlingguy.docker : Install docker-compose plugin.] ********************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ********************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Configure Docker daemon options.] ******************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] *****************************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *************************************************************

    RUNNING HANDLER [geerlingguy.docker : restart docker] *************************************************************************************************
    changed: [yacloud-vm]

    TASK [geerlingguy.docker : include_tasks] *************************************************************************************************************
    included: /Users/amina/Desktop/test/DevOps/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for yacloud-vm

    TASK [geerlingguy.docker : Check current docker-compose version.] *************************************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : set_fact] ******************************************************************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] *****************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : Install Docker Compose (if configured).] ***********************************************************************************
    changed: [yacloud-vm]

    TASK [geerlingguy.docker : Get docker group info using getent.] ***************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ******************************************************************

    TASK [geerlingguy.docker : include_tasks] *************************************************************************************************************
    skipping: [yacloud-vm]

    PLAY RECAP ********************************************************************************************************************************************
    yacloud-vm                 : ok=16   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
   ```

1. Output of 'ansible-inventory -i <name_of_your_inventory_file>.yaml --list':

   ```sh
    {
        "_meta": {
            "hostvars": {
                "yacloud-vm": {
                    "ansible_become": true,
                    "ansible_host": "51.250.28.83",
                    "ansible_user": "ubuntu"
                }
            }
        },
        "all": {
            "children": [
                "ungrouped",
                "vms"
            ]
        },
        "vms": {
            "hosts": [
                "yacloud-vm"
            ]
        }
    }
   ```

## Yandex Cloud

1. Add 'yacloud_compute.py' file to plugins using this [Yandex Cloud](https://github.com/rodion-goritskov/yacloud_compute)
