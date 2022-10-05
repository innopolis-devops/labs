# Ansible report

## Playbook run

```text
~/Documents/Studying/devops-labs/ansible$ ansible-playbook playbooks/dev/main.yml
 _______________________
< PLAY [Prepare docker] >
 -----------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 ______________________________________________________
/ TASK [docker : Ensure old versions of Docker are not \
\ installed.]                                          /
 ------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 ____________________________________________________
< TASK [docker : Ensure dependencies are installed.] >
 ----------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [vm01]
 _____________________________________________________________
/ TASK [docker : Ensure additional dependencies are installed \
\ (on Ubuntu < 20.04 and any other systems).]                 /
 -------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 _____________________________________________________________
/ TASK [docker : Ensure additional dependencies are installed \
\ (on Ubuntu >= 20.04).]                                      /
 -------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 _____________________________________
< TASK [docker : Add Docker apt key.] >
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [vm01]
 _________________________________________________________
/ TASK [docker : Ensure curl is present (on older systems \
\ without SNI).]                                          /
 ---------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 __________________________________________________________
/ TASK [docker : Add Docker apt key (alternative for older \
\ systems without SNI).]                                   /
 ----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 ________________________________________
< TASK [docker : Add Docker repository.] >
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [vm01]
 ________________________________________________________
/ TASK [docker : Install Docker packages (with downgrade \
\ option).]                                              /
 --------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [vm01]
 _______________________________________________________
< TASK [docker : Ensure /etc/docker/ directory exists.] >
 -------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 __________________________________________________
< TASK [docker : Configure Docker daemon options.] >
 --------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 ________________________________________________________
/ TASK [docker : Ensure Docker is started and enabled at \
\ boot.]                                                 /
 --------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 __________________________________________________________
/ TASK [docker : Ensure handlers are notified now to avoid \
\ firewall conflicts.]                                     /
 ----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ___________________________________________
< RUNNING HANDLER [docker : restart docker] >
 -------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [vm01]
 _______________________________________________________
< TASK [docker : Check current docker-compose version.] >
 -------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 __________________________
< TASK [docker : set_fact] >
 --------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 __________________________________________________________
/ TASK [docker : Delete existing docker-compose version if \
\ it's different.]                                         /
 ----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [vm01]
 _________________________________________________________
< TASK [docker : Install Docker Compose (if configured).] >
 ---------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [vm01]
 _____________________________________________________
< TASK [docker : Get docker group info using getent.] >
 -----------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 ___________________________________________________________
/ TASK [docker : Check if there are any users to add to the \
\ docker group.]                                            /
 -----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 _______________________________
< TASK [docker : include_tasks] >
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [vm01]
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

vm01                       : ok=13   changed=6    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0   

```

(I also later would run it again to tweak some stuff, I think it is not necessary to include all runs, too verbose)

## Inventory output

```json
~/Documents/Studying/devops-labs/ansible$ ansible-inventory -i inventory/yandex_cloud_vm.yml --list
{
    "_meta": {
        "hostvars": {
            "local": {
                "ansible_host": "localhost"
            },
            "vm01": {
                "ansible_host": "130.193.38.59"
            }
        }
    },
    "all": {
        "children": [
            "test",
            "ungrouped",
            "vms"
        ]
    },
    "test": {
        "hosts": [
            "local"
        ]
    },
    "vms": {
        "hosts": [
            "vm01"
        ]
    }
}
```

## Web application deployment output

last 50 lines

```diff
$ ansible-playbook playbooks/dev/main.yml --diff
...
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0755",
+    "mode": "0700",
     "path": "/opt/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [test]
 ____________________________________________________________
< TASK [web_app : Template, validate, and copy compose file] >
 ------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--- before
+++ after: /home/bragov4ik/.ansible/tmp/ansible-local-31499b873vnj0/tmpzik__280/docker-compose.yml.j2
@@ -0,0 +1,10 @@
+version: "3.9"
+
+services:
+  app_python:
+    image: bragov4ik/time_web_app:latest
+    container_name: app_python
+    ports:
+      - "80:8000"
+    restart: always
+      
\ No newline at end of file

changed: [test]
 _____________________________________
< TASK [web_app : Start all services] >
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [test]
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

test                       : ok=19   changed=11   unreachable=0    failed=0    skipped=11   rescued=0    ignored=0
```

### Bonus web app deployment result

```bash
test                       : ok=4    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0 
```

### Everything is working

```bash
$ curl http://178.154.206.170:80/
<h1>Moscow time: 20:56:26</h1>
$ curl http://178.154.206.170:81/
Moscow time: 20:56:36
```

### Other bonus staff

everything is implemented
