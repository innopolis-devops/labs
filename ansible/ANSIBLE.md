# Ansible

## Lab 5

### With static inventory file

#### `ansible-playbook playbooks/dev/main.yml --diff -i inventory/default.yml --private-key=~/.ssh/id_rsa_app_server`

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

#### `ansible-inventory -i inventory/default.yml --list`

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

### With dynamic inventory file

#### `ansible-playbook playbooks/yacloud_compute/main.yml --diff -i inventory/yacloud_compute.yml --private-key=~/.ssh/id_rsa_app_server`

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

#### `ansible-inventory -i inventory/yacloud_compute.yml --list`

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

## Lab 6

### `ansible-playbook playbooks/dev/app_python/main.yml --diff -i inventory/yacloud_compute.yml --private-key=~/.ssh/id_rsa_app_server`

    ...

      libpython3.10-stdlib libstdc++6 python3 python3-distutils python3-lib2to3
      python3-minimal python3.10 python3.10-minimal zlib1g
    14 upgraded, 64 newly installed, 0 to remove and 35 not upgraded.
    changed: [app-server]

    TASK [docker : Install Docker SDK for Python3] *********************************
    changed: [app-server]

    TASK [web_app : Stop services from docker-compose] *****************************
    skipping: [app-server]

    TASK [web_app : Remove directory with app] *************************************
    skipping: [app-server]

    TASK [web_app : Start Docker] **************************************************
    ok: [app-server]

    TASK [web_app : Create directory for app] **************************************
    --- before
    +++ after
    @@ -1,4 +1,4 @@
    {
        "path": "/opt/moscow-time-py",

    - "state": "absent"

    + "state": "directory"
    }

    changed: [app-server]

    TASK [web_app : Use template for docker-compose file] **************************
    --- before
    +++ after: /home/ezio/.ansible/tmp/ansible-local-2057713n8kpcfd/tmpsb7f3njz/docker-compose.yml.j2
    @@ -0,0 +1,9 @@
    +version: "3.9"
    +
    +services:
    - moscow-time-py:
    - image: grommash99/moscow-time-py:latest
    - container_name: moscow-time-py
    - ports:
    - - "80:8080"
    - restart: always

    changed: [app-server]

    TASK [web_app : Up docker-compose] *********************************************
    changed: [app-server]

    PLAY RECAP *********************************************************************
    app-server                 : ok=23   changed=12   unreachable=0    failed=0    skipped=13   rescued=0    ignored=0

### `ansible-playbook playbooks/dev/app_haskell/main.yml --diff -i inventory/yacloud_compute.yml --private-key=~/.ssh/id_rsa_app_server`

    ...

    TASK [docker : Install pip] ****************************************************
    ok: [app-server]

    TASK [docker : Install Docker SDK for Python3] *********************************
    ok: [app-server]

    TASK [web_app : Stop services from docker-compose] *****************************
    skipping: [app-server]

    TASK [web_app : Remove directory with app] *************************************
    skipping: [app-server]

    TASK [web_app : Start Docker] **************************************************
    ok: [app-server]

    TASK [web_app : Create directory for app] **************************************
    --- before
    +++ after
    @@ -1,4 +1,4 @@
    {
        "path": "/opt/moscow-time-hs",

    - "state": "absent"

    + "state": "directory"
    }

    changed: [app-server]

    TASK [web_app : Use template for docker-compose file] **************************
    --- before
    +++ after: /home/ezio/.ansible/tmp/ansible-local-214915z08o86to/tmpirlcjzc1/docker-compose.yml.j2
    @@ -0,0 +1,10 @@
    +version: "3.9"
    +
    +services:
    - moscow-time-hs:
    - image: grommash99/moscow-time-hs:latest
    - container_name: moscow-time-hs
    - ports:
    - - "80:8080"
    - - "8081:8081"
    - restart: always

    changed: [app-server]

    TASK [web_app : Up docker-compose] *********************************************
    changed: [app-server]

    PLAY RECAP *********************************************************************
    app-server                 : ok=20   changed=3    unreachable=0    failed=0    skipped=15   rescued=0    ignored=0
