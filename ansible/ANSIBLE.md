# Lab 5. Install Docker

## Notes
- Generate ssh key: `ssh-keygen -t rsa`.
- I placed the ssh key in **ansible** folder.
- I used Yandex Cloud VM and provided `key.pub` value.
- Connect to VM:

<img width="400" alt="1" src="https://user-images.githubusercontent.com/49106163/193684636-d02b7bbc-870f-43c8-9708-2569dd0ad554.png">

## ansible-playbook
- Initially there wasn't Docker

<img width="400" alt="2" src="https://user-images.githubusercontent.com/49106163/193684672-b3180c7f-7e75-43d5-941e-085d9e891e65.png">

- cd in **ansible** folder
- Run `ansible-playbook playbooks/dev/main.yaml --diff`
- Now the Docker is installed:

<img width="507" alt="3" src="https://user-images.githubusercontent.com/49106163/193684703-1a4f1d17-fae7-4e7a-ab2e-a2574a9ede71.png">


### Logs output:
```bash
PLAY [Install Docker for Yandex cloud] *********************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
Enter passphrase for key 'key': 
ok: [server]

TASK [docker : Load OS-specific vars.] *********************************************************************************************************************************************************************
ok: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
skipping: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
included: /Users/smore/Desktop/Innopolis/DevOps Engineering/DevOps_Innopolis/ansible/roles/docker/tasks/setup-Debian.yml for server

TASK [docker : Ensure old versions of Docker are not installed.] *******************************************************************************************************************************************
ok: [server]

TASK [docker : Ensure dependencies are installed.] *********************************************************************************************************************************************************
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
changed: [server]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****************************************************************************************************
skipping: [server]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************************************************************************************************
ok: [server]

TASK [docker : Add Docker apt key.] ************************************************************************************************************************************************************************
changed: [server]

TASK [docker : Ensure curl is present (on older systems without SNI).] *************************************************************************************************************************************
skipping: [server]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************************************************************************************************
skipping: [server]

TASK [docker : Add Docker repository.] *********************************************************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [server]

TASK [docker : Install Docker packages.] *******************************************************************************************************************************************************************
skipping: [server]

TASK [docker : Install Docker packages (with downgrade option).] *******************************************************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [server]

TASK [docker : Install docker-compose plugin.] *************************************************************************************************************************************************************
skipping: [server]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************************************************************************************************
skipping: [server]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************************************************************************************************
skipping: [server]

TASK [docker : Configure Docker daemon options.] ***********************************************************************************************************************************************************
skipping: [server]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************************************************************************************************
ok: [server]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************************************************************************************

RUNNING HANDLER [docker : restart docker] ******************************************************************************************************************************************************************
changed: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
included: /Users/smore/Desktop/Innopolis/DevOps Engineering/DevOps_Innopolis/ansible/roles/docker/tasks/install-compose.yml for server

TASK [docker : Check current docker-compose version.] ******************************************************************************************************************************************************
ok: [server]

TASK [docker : set_fact] ***********************************************************************************************************************************************************************************
ok: [server]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************************************************************************************************
ok: [server]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************************************************************************************************
changed: [server]

TASK [docker : Get docker group info using getent.] ********************************************************************************************************************************************************
skipping: [server]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************************************************************************************************

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
skipping: [server]

PLAY RECAP *************************************************************************************************************************************************************************************************
server                     : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0  
```

## ansible-inventory

- cd in **ansible** folder
- Run `ansible-inventory -i inventory/default_ya_ru_central1_a.yml --list`

### Logs output:
```bash
{
    "_meta": {
        "hostvars": {
            "server": {
                "ansible_become": true,
                "ansible_host": "51.250.64.126",
                "ansible_ssh_private_key_file": "key",
                "ansible_user": "smore"
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
            "server"
        ]
    }
}
```

# Lab 6. Deploy web app

## app_python

- Run `ansible-playbook playbooks/dev/app_python.yaml --diff`
- Python app is deployed, we can check it 
  (you can also try, I hope Yandex Cloud VM won't change its IP):
- `curl 51.250.95.105:8000` 
- `curl 51.250.95.105:8000/healthcheck` 
  

<img width="400" alt="2" src="https://user-images.githubusercontent.com/49106163/194946964-10ff212a-d5d4-4b9b-9bf3-07231ce140f9.png">

- Also, let's open this URL in a browser: `51.250.95.105:8000` (it's magic!)

<img width="600" alt="2" src="https://user-images.githubusercontent.com/49106163/194945886-319afa3a-2f02-4e32-a80f-e9b4a4f546a7.png">

### Logs output (last 50 lines):

```bash
TASK [web_app : Include wipe if needed] ********************************************************************************************************************************************************************
included: /Users/smore/Desktop/Innopolis/DevOps Engineering/DevOps_Innopolis/ansible/roles/web_app/tasks/0-wipe.yml for server

TASK [web_app : Wipe docker compose services] **************************************************************************************************************************************************************
fatal: [server]: FAILED! => {"changed": false, "msg": "Configuration error - \n        Can't find a suitable configuration file in this directory or any\n        parent. Are you in the right directory?\n\n        Supported filenames: docker-compose.yml, docker-compose.yaml, compose.yml, compose.yaml\n        "}
...ignoring

TASK [web_app : Wipe a base path] **************************************************************************************************************************************************************************
ok: [server]

TASK [web_app : Create a directory of application] *********************************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/app_python",
-    "state": "absent"
+    "state": "directory"
 }

changed: [server]

TASK [web_app : Docker compose file creation] **************************************************************************************************************************************************************
--- before
+++ after: /Users/smore/.ansible/tmp/ansible-local-14914sdxirmqn/tmprl6dh93a/docker-compose.yml.j2
@@ -0,0 +1,17 @@
+version: "3.9"
+
+services:
+  app_python:
+    image: smorenapi/app_python:latest
+    container_name: app_python
+    ports:
+      - "8000:8000"
+    restart: always
+    healthcheck:
+       test:
+         - CMD-SHELL
+         - wget --no-verbose --tries=1 -O /dev/null http://localhost:8000/healthcheck || exit 1
+       interval: 1m30s
+       timeout: 10s
+       retries: 3
+       start_period: 5s

changed: [server]

TASK [web_app : Run all services] **************************************************************************************************************************************************************************
changed: [server]

PLAY RECAP *************************************************************************************************************************************************************************************************
server                     : ok=24   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=1  
```

## app_kotlin

- Run `ansible-playbook playbooks/dev/app_kotlin.yaml --diff`
- Kotlin app is deployed, we can check it
  (you can also try, I hope Yandex Cloud VM won't change its IP):
- `curl 51.250.95.105:8080`
- `curl 51.250.95.105:8080/healthcheck`

<img width="400" alt="2" src="https://user-images.githubusercontent.com/49106163/194947033-9d8e7e24-9066-43ab-911f-8d69e9d311b3.png">

- Also, let's open this URL in a browser: `51.250.95.105:8080` (it's magic!)

<img width="600" alt="2" src="https://user-images.githubusercontent.com/49106163/194945921-4e4055f6-9980-4ade-974a-6e0e459d9ac6.png">

### Logs output (last 50 lines):

```bash
TASK [web_app : Include wipe if needed] ********************************************************************************************************************************************************************
included: /Users/smore/Desktop/Innopolis/DevOps Engineering/DevOps_Innopolis/ansible/roles/web_app/tasks/0-wipe.yml for server

TASK [web_app : Wipe docker compose services] **************************************************************************************************************************************************************
fatal: [server]: FAILED! => {"changed": false, "msg": "Configuration error - \n        Can't find a suitable configuration file in this directory or any\n        parent. Are you in the right directory?\n\n        Supported filenames: docker-compose.yml, docker-compose.yaml, compose.yml, compose.yaml\n        "}
...ignoring

TASK [web_app : Wipe a base path] **************************************************************************************************************************************************************************
ok: [server]

TASK [web_app : Create a directory of application] *********************************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/app_kotlin",
-    "state": "absent"
+    "state": "directory"
 }

changed: [server]

TASK [web_app : Docker compose file creation] **************************************************************************************************************************************************************
--- before
+++ after: /Users/smore/.ansible/tmp/ansible-local-15367kvo90ti1/tmp71yfdtjn/docker-compose.yml.j2
@@ -0,0 +1,17 @@
+version: "3.9"
+
+services:
+  app_kotlin:
+    image: smorenapi/app_kotlin:latest
+    container_name: app_kotlin
+    ports:
+      - "8080:8080"
+    restart: always
+    healthcheck:
+       test:
+         - CMD-SHELL
+         - wget --no-verbose --tries=1 -O /dev/null http://localhost:8080/healthcheck || exit 1
+       interval: 1m30s
+       timeout: 10s
+       retries: 3
+       start_period: 5s

changed: [server]

TASK [web_app : Run all services] **************************************************************************************************************************************************************************
changed: [server]

PLAY RECAP *************************************************************************************************************************************************************************************************
server                     : ok=22   changed=3    unreachable=0    failed=0    skipped=14   rescued=0    ignored=1  
```

## P.S.

Since **app_python** and **app_kotlin** images use different ports, 
VM runs two web application simultaneously

<img width="600" alt="2" src="https://user-images.githubusercontent.com/49106163/194945929-c1203dcd-2630-4797-8303-ac484081eca1.png">
