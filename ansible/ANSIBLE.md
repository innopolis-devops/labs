# Ansible 1

## ansible-playbook <path_to your_playbook> --diff

```
TASK [docker : Install Docker packages (with downgrade option).] *******************************************************
The following additional packages will be installed:
  dbus-user-session docker-buildx-plugin docker-compose-plugin
  docker-scan-plugin git git-man iptables libcurl3-gnutls liberror-perl
  libip6tc2 libltdl7 libnetfilter-conntrack3 libnfnetlink0 libslirp0 patch
  pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  firewalld ed diffutils-doc
The following NEW packages will be installed:
  containerd.io dbus-user-session docker-buildx-plugin docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-compose-plugin docker-scan-plugin git
  git-man iptables libcurl3-gnutls liberror-perl libip6tc2 libltdl7
  libnetfilter-conntrack3 libnfnetlink0 libslirp0 patch pigz slirp4netns
0 upgraded, 21 newly installed, 0 to remove and 1 not upgraded.
changed: [vm]

TASK [docker : Install docker-compose plugin.] *************************************************************************
skipping: [vm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************
skipping: [vm]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************
skipping: [vm]

TASK [docker : Configure Docker daemon options.] ***********************************************************************
skipping: [vm]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************
ok: [vm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************

RUNNING HANDLER [docker : restart docker] ******************************************************************************
changed: [vm]

TASK [docker : include_tasks] ******************************************************************************************
included: /mnt/e/projects/temp/ansible/roles/docker/tasks/docker-compose.yml for vm

TASK [docker : Check current docker-compose version.] ******************************************************************
ok: [vm]

TASK [docker : set_fact] ***********************************************************************************************
ok: [vm]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************
ok: [vm]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************
changed: [vm]

TASK [docker : Get docker group info using getent.] ********************************************************************
skipping: [vm]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************
skipping: [vm]

TASK [docker : include_tasks] ******************************************************************************************
skipping: [vm]

PLAY RECAP *************************************************************************************************************
vm                         : ok=15   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

## ansible-inventory -i <name_of_your_inventory_file>.yaml --list

```
tiny0wizard@DESKTOP-U5IRIAH:/mnt/e/projects/temp/ansible$ ansible-inventory -i ./inventory/yandex_cloud.yml --list
{
    "_meta": {
        "hostvars": {
            "vm": {
                "ansible_become": true,
                "ansible_host": "158.160.46.145",
                "ansible_ssh_private_key_file": "/mnt/c/users/tiny wizard/id_tw",
                "ansible_user": "tiny0wizard"
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

# Ansible 2

## ansible-playbook <path_to your_playbook> --diff

```
TASK [web_app : Include wipe if needed] ********************************************************************************
included: /mnt/e/projects/temp/ansible/roles/web_app/tasks/0-wipe.yml for vm

TASK [web_app : wiping docker] *****************************************************************************************
ok: [vm]

TASK [web_app : wiping dir] ********************************************************************************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "/opt/web_app",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/opt/web_app/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [vm]

TASK [web_app : Create a directory] ************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [vm]

TASK [web_app : Docker compose installation] ***************************************************************************
--- before
+++ after: /home/tiny0wizard/.ansible/tmp/ansible-local-3018sorlgxl8/tmpjfjurqsp/docker-compose.yml
@@ -0,0 +1,9 @@
+version: "3.9"
+
+services:
+  app_python:
+    image: tiny0wizard/app_python:latest
+    container_name: app_python
+    ports:
+      - "80:5000"
+    restart: always
\ No newline at end of file

changed: [vm]

TASK [web_app : Run docker compose] ************************************************************************************
changed: [vm]

PLAY RECAP *************************************************************************************************************
vm                         : ok=18   changed=4    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```