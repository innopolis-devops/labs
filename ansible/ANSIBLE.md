# Ansible Lab5

## ansible-playbook <path_to your_playbook> --diff

```bash

...skipped some steps

TASK [docker : Add Docker repository.] ***********************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [VM1]

TASK [docker : Install Docker packages.] *********************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libseccomp2 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin pigz slirp4netns
The following packages will be upgraded:
  libseccomp2
1 upgraded, 7 newly installed, 0 to remove and 254 not upgraded.
changed: [VM1]

TASK [docker : Install docker-compose plugin.] ***************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************

RUNNING HANDLER [docker : restart docker] ********************************************************************************************************************************
changed: [VM1]

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************
skipping: [VM1]

PLAY RECAP ***************************************************************************************************************************************************************
VM1                        : ok=11   changed=4    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```

## ansible-inventory -i <name_of_your_inventory_file>.yaml --list

```bash
{
    "_meta": {
        "hostvars": {
            "VM1"
    : {
                "ansible_host": "54.200.35.2",
                "ansible_user": "kamila"
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
            "VM1"
    
        ]
    }
}
```

# Ansible Lab 6

## ansible-playbook <path_to your_playbook> --diff

```bash

...skipped some steps

TASK [docker : Add Docker repository.] ***********************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [VM1]

TASK [docker : Install Docker packages.] *********************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libseccomp2 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin pigz slirp4netns
The following packages will be upgraded:
  libseccomp2
1 upgraded, 7 newly installed, 0 to remove and 254 not upgraded.
changed: [VM1]

TASK [docker : Install docker-compose plugin.] ***************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************

RUNNING HANDLER [docker : restart docker] ********************************************************************************************************************************
changed: [VM1]

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************
skipping: [VM1]

PLAY RECAP ***************************************************************************************************************************************************************
VM1                        : ok=11   changed=4    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   

```

## ansible-inventory -i <name_of_your_inventory_file>.yaml --list

```bash
{
    "_meta": {
        "hostvars": {
            "VM1": {
                "ansible_become": true,
                "ansible_host": "13.38.45.20",
                "ansible_ssh_private_key_file": "/mnt/c/lab6.pem",
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
            "VM1"
        ]
    }
}
```

# Ansible Lab 6 with Wipe

## ansible-playbook <path_to your_playbook> --diff

```bash

...skipped some steps

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Stop all services] ***************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Remove app directory] ************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Create a directory if it doesn't exist] ******************************************************************************************************************
ok: [VM1]

TASK [web_app : Template, validate, and copy compose file] ***************************************************************************************************************
--- before: /opt/app_python/docker-compose.yml
+++ after: /root/.ansible/tmp/ansible-local-9393e64bgxe3/tmpgxu6g8xd/docker_compose.yml.j2
@@ -2,7 +2,7 @@
 
 services:
   app_python:
-    image: Kamila-Khamidullina/time:latest
+    image: kamilakhamidullina/devops_lab2:latest
     container_name: app_python
     ports:
       - "80:8000"

changed: [VM1]

TASK [web_app : Start all services] **************************************************************************************************************************************
changed: [VM1]

PLAY RECAP ***************************************************************************************************************************************************************
VM1                        : ok=13   changed=2    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0 

```

# Ansible Lab 6 bonus

```bash

...skipped some steps

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Stop all services] ***************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Remove app directory] ************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Create a directory if it doesn't exist] ******************************************************************************************************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0755",
+    "mode": "0700",
     "path": "/opt/app_javascript",
-    "state": "absent"
+    "state": "directory"
 }

changed: [VM1]

TASK [web_app : Template, validate, and copy compose file] ***************************************************************************************************************
--- before
+++ after: /root/.ansible/tmp/ansible-local-10086_dwfodtw/tmpdxowizye/docker_compose.yml.j2
@@ -0,0 +1,10 @@
+version: "3.9"
+
+services:
+  app_javascript:
+    image: kamilakhamidullina/devops_lab2_bonus:latest
+    container_name: app_javascript
+    ports:
+      - "81:8000"
+    restart: always
+      
\ No newline at end of file

changed: [VM1]

TASK [web_app : Start all services] **************************************************************************************************************************************
changed: [VM1]

PLAY RECAP ***************************************************************************************************************************************************************
VM1                        : ok=13   changed=3    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0 
```