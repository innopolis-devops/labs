# Ansible

## Dev

The output of the `ansible-playbook playbooks/dev/main.yml --diff --ask-become-pass` command

```text
PLAY [Docker] ************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : include_tasks] ********************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : include_tasks] ********************************************************************************************************
included: /Users/k05m0navt/Programming/Innopolis/DevOps/labs/ansible/roles/docker/tasks/install_docker.yml for 127.0.0.1

TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************
skipping: [127.0.0.1]

TASK [docker : Install docker-compose plugin.] ***************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************
skipping: [127.0.0.1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************

TASK [docker : include_tasks] ********************************************************************************************************
included: /Users/k05m0navt/Programming/Innopolis/DevOps/labs/ansible/roles/docker/tasks/install_compose.yml for 127.0.0.1

TASK [docker : Check current docker-compose version.] ********************************************************************************
ok: [127.0.0.1]

TASK [docker : set_fact] *************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : Delete existing docker-compose version if it's different.] ************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/usr/local/bin/docker-compose",
-    "state": "link"
+    "state": "absent"
 }

changed: [127.0.0.1]

TASK [docker : Install Docker Compose (if configured).] ******************************************************************************
skipping: [127.0.0.1]

TASK [docker : Get docker group info using getent.] **********************************************************************************
skipping: [127.0.0.1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************
skipping: [127.0.0.1]

TASK [docker : include_tasks] ********************************************************************************************************
skipping: [127.0.0.1]

PLAY RECAP ***************************************************************************************************************************
127.0.0.1                  : ok=6    changed=1    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0
```

The output of the `ansible-inventory -i inventory/default.yml --list`

```text
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    }
}
```

## Yandex.Cloud

Initially, one have to create a file called `yacloud.token` in the ansible root and provide it with the Yandex OAuth token.
Also, there should be a running Yandex.Cloud machine. It is achievable by executing `terraform apply` in the `./terraform/yc` directory.

The output of the `ansible-playbook playbooks/yacloud/main.yml --diff` command

```text
PLAY [Docker] *******************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************
The authenticity of host '51.250.3.129 (51.250.3.129)' can't be established.
ED25519 key fingerprint is SHA256:gXxyxt22ZE2fMKH0EkGoy8eO+LvPIBR26sT21ep+sbA.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [lab-vm]

TASK [docker : include_tasks] ***************************************************************************************
included: /Users/k05m0navt/Programming/Innopolis/DevOps/labs/ansible/roles/docker/tasks/setup_debian.yml for lab-vm

TASK [docker : Ensure old versions of Docker are not installed.] ****************************************************
ok: [lab-vm]

TASK [docker : Ensure dependencies are installed.] ******************************************************************
ok: [lab-vm]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] **********************************
skipping: [lab-vm]

TASK [docker : Add Docker apt key.] *********************************************************************************
changed: [lab-vm]

TASK [docker : Ensure curl is present (on older systems without SNI).] **********************************************
skipping: [lab-vm]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] *************************************
skipping: [lab-vm]

TASK [docker : Add Docker repository.] ******************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

changed: [lab-vm]

TASK [docker : include_tasks] ***************************************************************************************
included: /Users/k05m0navt/Programming/Innopolis/DevOps/labs/ansible/roles/docker/tasks/install_docker.yml for lab-vm

TASK [docker : Install Docker packages (with downgrade option).] ****************************************************
The following additional packages will be installed:
  dbus dbus-user-session docker-buildx-plugin docker-compose-plugin
  docker-scan-plugin git git-man libcurl3-gnutls libdbus-1-3 liberror-perl
  libgdbm-compat4 libltdl7 libperl5.26 patch perl perl-base perl-modules-5.26
  pigz
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  diffutils-doc perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl make
Recommended packages:
  slirp4netns
The following NEW packages will be installed:
  containerd.io dbus-user-session docker-buildx-plugin docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-compose-plugin docker-scan-plugin git
  git-man libcurl3-gnutls liberror-perl libgdbm-compat4 libltdl7 libperl5.26
  patch perl perl-modules-5.26 pigz
The following packages will be upgraded:
  dbus libdbus-1-3 perl-base
3 upgraded, 19 newly installed, 0 to remove and 134 not upgraded.
changed: [lab-vm]

TASK [docker : Install docker-compose plugin.] **********************************************************************
skipping: [lab-vm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] **********************************************
skipping: [lab-vm]

TASK [docker : Ensure /etc/docker/ directory exists.] ***************************************************************
skipping: [lab-vm]

TASK [docker : Configure Docker daemon options.] ********************************************************************
skipping: [lab-vm]

TASK [docker : Ensure Docker is started and enabled at boot.] *******************************************************
ok: [lab-vm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***************************************

RUNNING HANDLER [docker : restart docker] ***************************************************************************
changed: [lab-vm]

TASK [docker : include_tasks] ***************************************************************************************
included: /Users/k05m0navt/Programming/Innopolis/DevOps/labs/ansible/roles/docker/tasks/install_compose.yml for lab-vm

TASK [docker : Check current docker-compose version.] ***************************************************************
ok: [lab-vm]

TASK [docker : set_fact] ********************************************************************************************
ok: [lab-vm]

TASK [docker : Delete existing docker-compose version if it's different.] *******************************************
ok: [lab-vm]

TASK [docker : Install Docker Compose (if configured).] *************************************************************
changed: [lab-vm]

TASK [docker : Get docker group info using getent.] *****************************************************************
skipping: [lab-vm]

TASK [docker : Check if there are any users to add to the docker group.] ********************************************
skipping: [lab-vm]

TASK [docker : include_tasks] ***************************************************************************************
skipping: [lab-vm]

PLAY RECAP **********************************************************************************************************
lab-vm                     : ok=15   changed=5    unreachable=0    failed=0    skipped=10   rescued=0    ignored=0
```

The output of the `ansible-inventory -i inventory/yacloud_compute.yml --list`

```text
{
    "_meta": {
        "hostvars": {
            "lab-vm": {
                "ansible_host": "51.250.3.129"
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
            "lab-vm"
        ]
    }
}
```

Then, I connected to the VM via SSH and checked that docker and docker-compose are indeed installed
