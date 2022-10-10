# Ansible tasks

## Docker task

Output of `ansible-playbook playbooks/dev/main.yml --diff`

I hardcoded VM's IP into `hosts.yaml` since in the bonus task and further I am not going to use it, although I know that this secret 
should be not be published :)

```
TASK [docker : Install Docker packages (with downgrade option).] ***********************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [62.84.120.181]

TASK [docker : Install docker-compose plugin.] *****************************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Ensure /etc/docker/ directory exists.] **********************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************
ok: [62.84.120.181]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

RUNNING HANDLER [docker : restart docker] **********************************************************************************************************************************
changed: [62.84.120.181]

TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/ilya/PycharmProjects/DevOps/ansible/roles/docker/tasks/docker-compose.yml for 62.84.120.181

TASK [docker : Check current docker-compose version.] **********************************************************************************************************************
ok: [62.84.120.181]

TASK [docker : set_fact] ***************************************************************************************************************************************************
ok: [62.84.120.181]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************
ok: [62.84.120.181]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************
changed: [62.84.120.181]

TASK [docker : Get docker group info using getent.] ************************************************************************************************************************
skipping: [62.84.120.181]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [62.84.120.181]

PLAY RECAP *****************************************************************************************************************************************************************
62.84.120.181              : ok=15   changed=6    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0   
```

Inventory

```
{ 
    "_meta": {
        "hostvars": {
            "62.84.120.181": {
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "docker",
            "ungrouped"
        ]
    },
    "docker": {
        "hosts": [
            "62.84.120.181"
        ]
    }
}
```

## Bonus task (yandex cloud)

```
TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

RUNNING HANDLER [docker : restart docker] **********************************************************************************************************************************
changed: [ilya-vm]

TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/ilya/PycharmProjects/DevOps/ansible/roles/docker/tasks/docker-compose.yml for ilya-vm

TASK [docker : Check current docker-compose version.] **********************************************************************************************************************
ok: [ilya-vm]

TASK [docker : set_fact] ***************************************************************************************************************************************************
ok: [ilya-vm]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************
ok: [ilya-vm]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************
changed: [ilya-vm]

TASK [docker : Get docker group info using getent.] ************************************************************************************************************************
skipping: [ilya-vm]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [ilya-vm]

PLAY RECAP *****************************************************************************************************************************************************************
ilya-vm                    : ok=15   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored
```

```
{ 
    "_meta": {
        "hostvars": {
            "ilya-vm": {
                "ansible_host": "62.84.115.182"
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
            "ilya-vm"
        ]
    }
}

```

## Lab 6

```
TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [ilya-vm]

TASK [web_app : Get running containers] ************************************************************************************************************************************
ok: [ilya-vm]

TASK [web_app : Stop running containers] ***********************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "exists": true,
-    "running": true
+    "exists": false,
+    "running": false
 }

changed: [ilya-vm] => (item=4340c48936df09bc120563de29fd6a50b9e623f0db97ec6c7e25cc06b85a53d8)

TASK [web_app : Remove images] *********************************************************************************************************************************************
changed: [ilya-vm] => (item=sha256:23c15ff1d1d39a2f3382b0f59244ce055a588cc6e83c02a744aa8f941394d44a)

TASK [web_app : Remove previous configuration] *****************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/etc/docker-compose.yml",
-    "state": "file"
+    "state": "absent"
 }

changed: [ilya-vm]

TASK [web_app : Template a docker-compose.yml to /etc/] ********************************************************************************************************************
--- before
+++ after: /Users/ilya/.ansible/tmp/ansible-local-890264bbgi0wt/tmpj_5_f61u/docker-compose.yml.j2
@@ -0,0 +1,5 @@
+services:
+  web:
+    image: "ilyakolomin/devops_app_python:latest"
+    ports:
+        - 8000:8000

changed: [ilya-vm]

TASK [web_app : Create and start web service] ******************************************************************************************************************************
changed: [ilya-vm]

PLAY RECAP *****************************************************************************************************************************************************************
ilya-vm                    : ok=20   changed=5    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   
```

![](https://i.imgur.com/QCYl7Dy.png)
_The docker is deployed_