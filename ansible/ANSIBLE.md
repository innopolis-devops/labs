# Lab 5

```
ansible-playbook playbooks/dev/main.yml --diff

PLAY [main] ************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [yandex]

TASK [docker : Load OS-specific vars.] *********************************************************************************
ok: [yandex]

TASK [docker : include_tasks] ******************************************************************************************
skipping: [yandex]

TASK [docker : include_tasks] ******************************************************************************************
included: /home/draeston/labs/ansible/roles/docker/tasks/setup-Debian.yml for yandex

TASK [docker : Ensure old versions of Docker are not installed.] *******************************************************
ok: [yandex]

TASK [docker : Ensure dependencies are installed.] *********************************************************************
ok: [yandex]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************
ok: [yandex]

TASK [docker : Add Docker apt key.] ************************************************************************************
ok: [yandex]

TASK [docker : Ensure curl is present (on older systems without SNI).] *************************************************
skipping: [yandex]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************
skipping: [yandex]

TASK [docker : Add Docker repository.] *********************************************************************************
ok: [yandex]

TASK [docker : Install Docker packages.] *******************************************************************************
skipping: [yandex]

TASK [docker : Install Docker packages (with downgrade option).] *******************************************************
ok: [yandex]

TASK [docker : Install docker-compose plugin.] *************************************************************************
skipping: [yandex]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************
skipping: [yandex]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************
skipping: [yandex]

TASK [docker : Configure Docker daemon options.] ***********************************************************************
skipping: [yandex]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************
ok: [yandex]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************

TASK [docker : include_tasks] ******************************************************************************************
included: /home/draeston/labs/ansible/roles/docker/tasks/docker-compose.yml for yandex

TASK [docker : Check current docker-compose version.] ******************************************************************
ok: [yandex]

TASK [docker : set_fact] ***********************************************************************************************
ok: [yandex]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************
skipping: [yandex]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************
skipping: [yandex]

TASK [docker : Get docker group info using getent.] ********************************************************************
skipping: [yandex]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************
skipping: [yandex]

TASK [docker : include_tasks] ******************************************************************************************
skipping: [yandex]

PLAY RECAP *************************************************************************************************************
yandex                     : ok=13   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```

```
ansible-inventory -i yandex_cloud.yml --list
{
    "_meta": {
        "hostvars": {
            "yandex": {
                "ansible_become": true,
                "ansible_host": "51.250.80.12",
                "ansible_user": "draeston"
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
            "yandex"
        ]
    }
}
```

# Lab 6
```
ansible-playbook playbooks/dev/main.yml --diff

PLAY [main] ************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [yandex]

TASK [docker : Load OS-specific vars.] *********************************************************************************
ok: [yandex]

TASK [docker : include_tasks] ******************************************************************************************
skipping: [yandex]

TASK [docker : include_tasks] ******************************************************************************************
included: /home/draeston/labs/ansible/roles/docker/tasks/setup-Debian.yml for yandex

TASK [docker : Ensure old versions of Docker are not installed.] *******************************************************
ok: [yandex]

TASK [docker : Ensure dependencies are installed.] *********************************************************************
ok: [yandex]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************
ok: [yandex]

TASK [docker : Add Docker apt key.] ************************************************************************************
ok: [yandex]

TASK [docker : Ensure curl is present (on older systems without SNI).] *************************************************
skipping: [yandex]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************
skipping: [yandex]

TASK [docker : Add Docker repository.] *********************************************************************************
ok: [yandex]

TASK [docker : Install Docker packages.] *******************************************************************************
skipping: [yandex]

TASK [docker : Install Docker packages (with downgrade option).] *******************************************************
ok: [yandex]

TASK [docker : Install docker-compose plugin.] *************************************************************************
skipping: [yandex]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************
skipping: [yandex]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************
skipping: [yandex]

TASK [docker : Configure Docker daemon options.] ***********************************************************************
skipping: [yandex]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************
ok: [yandex]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************

TASK [docker : include_tasks] ******************************************************************************************
included: /home/draeston/labs/ansible/roles/docker/tasks/docker-compose.yml for yandex

TASK [docker : Check current docker-compose version.] ******************************************************************
ok: [yandex]

TASK [docker : set_fact] ***********************************************************************************************
ok: [yandex]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************
skipping: [yandex]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************
skipping: [yandex]

TASK [docker : Get docker group info using getent.] ********************************************************************
skipping: [yandex]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************
skipping: [yandex]

TASK [docker : include_tasks] ******************************************************************************************
skipping: [yandex]

TASK [web_app : include_tasks] *****************************************************************************************
included: /home/draeston/labs/ansible/roles/web_app/tasks/wipe.yml for yandex

TASK [web_app : Check docker-compose] **********************************************************************************
ok: [yandex]

TASK [web_app : Check directory] ***************************************************************************************
ok: [yandex]

TASK [web_app : Stop docker-compose] ***********************************************************************************
changed: [yandex]

TASK [web_app : Delete folder] *****************************************************************************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "/app_python",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/app_python/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [yandex]

TASK [web_app : Ensure destination folder exists] **********************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/app_python",
-    "state": "absent"
+    "state": "directory"
 }

changed: [yandex]

TASK [web_app : Install Docker-compose] ********************************************************************************
--- before
+++ after: /home/draeston/.ansible/tmp/ansible-local-4512qjd60po3/tmpfy8q2334/docker-compose.yml.j2
@@ -0,0 +1,7 @@
+services:
+  default-container:
+    image: draeston/devops_app:latest
+    container_name: default-container
+    ports:
+      - "3000:3000"
+    restart: always
\ No newline at end of file

changed: [yandex]

TASK [web_app : Run app via docker-compose] ****************************************************************************
changed: [yandex]

PLAY RECAP *************************************************************************************************************
yandex                     : ok=21   changed=5    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```
