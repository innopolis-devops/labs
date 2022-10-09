# Ansible

## Lab5

```bash
ansible-playbook ./playbooks/dev/lab5.yml --diff | tail -n50                                                                
Enter passphrase for key '/home/wat4er/.ssh/yc':

TASK [geerlingguy.docker : Install Docker packages.] ***************************
skipping: [asdfffff]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***
ok: [asdfffff]

TASK [geerlingguy.docker : Install docker-compose plugin.] *********************
skipping: [asdfffff]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***
skipping: [asdfffff]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **************
skipping: [asdfffff]

TASK [geerlingguy.docker : Configure Docker daemon options.] *******************
skipping: [asdfffff]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ******
ok: [asdfffff]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
included: /home/wat4er/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for asdfffff

TASK [geerlingguy.docker : Check current docker-compose version.] **************
ok: [asdfffff]

TASK [geerlingguy.docker : set_fact] *******************************************
ok: [asdfffff]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***
skipping: [asdfffff]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ************
skipping: [asdfffff]

TASK [geerlingguy.docker : Get docker group info using getent.] ****************
skipping: [asdfffff]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [asdfffff]

PLAY RECAP *********************************************************************
asdfffff                   : ok=13   changed=0    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```

## Lab6

```bash
ansible-playbook ./playbooks/dev/lab5.yml  --diff | tail -n50
Enter passphrase for key '/home/wat4er/.ssh/yc':

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
included: /home/wat4er/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for asdfffff

TASK [geerlingguy.docker : Check current docker-compose version.] **************
ok: [asdfffff]

TASK [geerlingguy.docker : set_fact] *******************************************
ok: [asdfffff]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***
skipping: [asdfffff]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ************
skipping: [asdfffff]

TASK [geerlingguy.docker : Get docker group info using getent.] ****************
skipping: [asdfffff]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [asdfffff]

TASK [docker : Install pip] ****************************************************
ok: [asdfffff]

TASK [docker : Install Docker SDK for Py] **************************************
ok: [asdfffff]

TASK [docker : Install Docker Compose for Py] **********************************
ok: [asdfffff]

TASK [web_app : Wipe app] ******************************************************
skipping: [asdfffff]

TASK [web_app : Create a dir] **************************************************
ok: [asdfffff]

TASK [web_app : Template the docker-compose.yml] *******************************
ok: [asdfffff]

TASK [web_app : Start services] ************************************************
ok: [asdfffff]

PLAY RECAP *********************************************************************
asdfffff                   : ok=19   changed=0    unreachable=0    failed=0    skipped=15   rescued=0    ignored=0
```

## Dart app

```bash
ansible-playbook ./playbooks/app_dart/main.yml  --diff | tail -n50
@@ -1,10 +1,4 @@
 {
     "path": "/dart_app",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/dart_app/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [asdfffff]

TASK [web_app : Create a dir] **************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/dart_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [asdfffff]

TASK [web_app : Template the docker-compose.yml] *******************************
--- before
+++ after: /home/wat4er/.ansible/tmp/ansible-local-24461288xlm7ul3/tmpfohkp1xt/docker-compose.yml.j2
@@ -0,0 +1,9 @@
+version: '3.0'
+
+services:
+    dart_app:
+        image: "wat4er/inno_devops:dart"
+        container_name: dart_app
+        ports:
+            - "80:5050"
+        restart: always
\ No newline at end of file

changed: [asdfffff]

TASK [web_app : Start services] ************************************************
changed: [asdfffff]

PLAY RECAP *********************************************************************
asdfffff                   : ok=22   changed=4    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```