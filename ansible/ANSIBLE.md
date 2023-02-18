# ansible-playbook

```PLAY [yandex_cloud ansible] *************************************************************************************

TASK [Gathering Facts] *********************************************************************************
ok: [vm]

TASK [docker : Load OS-specific vars.] *****************************************************************
ok: [vm]

TASK [docker : include_tasks] **************************************************************************
skipping: [vm]

TASK [docker : include_tasks] **************************************************************************
included: /home/erik/devops/ansible/roles/docker/tasks/setup-Debian.yml for vm

TASK [docker : Ensure old versions of Docker are not installed.] ***************************************
ok: [vm]

TASK [docker : Ensure dependencies are installed.] *****************************************************
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
changed: [vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *********************
ok: [vm]

TASK [docker : Add Docker apt key.] ********************************************************************
changed: [vm]

TASK [docker : Ensure curl is present (on older systems without SNI).] *********************************
skipping: [vm]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ************************
skipping: [vm]

TASK [docker : Add Docker repository.] *****************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [vm]

TASK [docker : Install Docker packages.] ***************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [vm]

TASK [docker : Install Docker packages (with downgrade option).] ***************************************
skipping: [vm]

TASK [Install docker-compose plugin.] ******************************************************************
skipping: [vm]

TASK [Install docker-compose-plugin (with downgrade option).] ******************************************
skipping: [vm]

TASK [Ensure /etc/docker/ directory exists.] ***********************************************************
skipping: [vm]

TASK [docker : Configure Docker daemon options.] *******************************************************
skipping: [vm]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************************************
ok: [vm]

RUNNING HANDLER [restart docker] ***********************************************************************
changed: [vm]

TASK [docker : include_tasks] **************************************************************************
included: /home/erik/devops/ansible/roles/docker/tasks/docker-compose.yml for vm

TASK [Check current docker-compose version.] ***********************************************************
ok: [vm]

TASK [docker : set_fact] *******************************************************************************
skipping: [vm]

TASK [Delete existing docker-compose version if it's different.] ***************************************
skipping: [vm]

TASK [docker : Install Docker Compose (if configured).] ************************************************
changed: [vm]

TASK [Get docker group info using getent.] *************************************************************
skipping: [vm]

TASK [Check if there are any users to add to the docker group.] ****************************************

TASK [docker : include_tasks] **************************************************************************
skipping: [vm]

PLAY RECAP *********************************************************************************************
vm                         : ok=14   changed=6    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```

# ansible-inventory

```
  {
    "_meta": {
        "hostvars": {
            "vm": {
                "ansible_become": true,
                "ansible_host": "158.12.36.123",
                "ansible_ssh_private_key_file": "~/.ssh/id_rsa",
                "ansible_user": "erik"
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
            "vm"
        ]
    }
}

```

# ansible-playbook deploying a role

```
PLAY [Yandex Cloud ansible] ****************************************************

TASK [Gathering Facts] *********************************************************
ok: [vm]

TASK [docker : Load OS-specific vars.] *****************************************
ok: [vm]

TASK [docker : include_tasks] **************************************************
skipping: [vm]

TASK [docker : include_tasks] **************************************************
included: /home/erik/devops/ansible/roles/docker/tasks/setup-Debian.yml for vm

TASK [docker : Ensure old versions of Docker are not installed.] ***************
ok: [vm]

TASK [docker : Ensure dependencies are installed.] *****************************
ok: [vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***
ok: [vm]

TASK [docker : Add Docker apt key.] ********************************************
ok: [vm]

TASK [docker : Ensure curl is present (on older systems without SNI).] *********
skipping: [vm]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ***
skipping: [vm]

TASK [docker : Add Docker repository.] *****************************************
ok: [vm]

TASK [docker : Install Docker packages.] ***************************************
skipping: [vm]

TASK [docker : Install Docker packages (with downgrade option).] ***************
ok: [vm]

TASK [docker : Install docker-compose plugin.] *********************************
skipping: [vm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
skipping: [vm]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************
skipping: [vm]

TASK [docker : Configure Docker daemon options.] *******************************
skipping: [vm]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************
ok: [vm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [docker : include_tasks] **************************************************
included: /home/erik/devops/ansible/roles/docker/tasks/docker-compose.yml for vm

TASK [docker : Check current docker-compose version.] **************************
ok: [vm]

TASK [docker : set_fact] *******************************************************
ok: [vm]

TASK [docker : Delete existing docker-compose version if it's different.] ******
skipping: [vm]

TASK [docker : Install Docker Compose (if configured).] ************************
skipping: [vm]

TASK [docker : include_tasks] **************************************************
included: /home/erik/devops/ansible/roles/docker/tasks/docker-python.yml for vm

TASK [docker : Ensure Pip is installed.] ***************************************
ok: [vm]

TASK [docker : Install docker libraries] ***************************************
ok: [vm]

TASK [docker : Get docker group info using getent.] ****************************
skipping: [vm]

TASK [docker : Check if there are any users to add to the docker group.] *******

TASK [docker : include_tasks] **************************************************
skipping: [vm]

TASK [web_app : Include wipe if needed] ****************************************
included: /home/erik/devops/ansible/roles/web_app/tasks/0-wipe.yml for vm

TASK [web_app : wiping docker] *************************************************
changed: [vm]

TASK [web_app : wiping dir] ****************************************************
changed: [vm]

TASK [web_app : Create a directory] ********************************************
changed: [vm]

TASK [web_app : Docker compose installation] ***********************************
changed: [vm]

TASK [web_app : Run docker compose] ********************************************
changed: [vm]

PLAY RECAP *********************************************************************
vm                         : ok=22   changed=5    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```
