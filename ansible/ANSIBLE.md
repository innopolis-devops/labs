# Ansible labs

## Lab 1
### 10 points task

1. Run playbook with docker role on localhost

<details>
    <summary>Console output: </summary>

```console
~/innopolis/devops/ansible (lab5*) » ansible-playbook playbooks/dev/main.yml
[DEPRECATION WARNING]: Ansible will require Python 3.8 or newer on the controller starting with Ansible 2.12. Current version: 3.6.9 (default, Jun 29 2022, 11:45:57) [GCC 8.4.0]. This feature will be removed from 
ansible-core in version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
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

ok: [127.0.0.1]
 _______________________________
< TASK [docker : include_tasks] >
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

included: /home/lev/innopolis/devops/ansible/roles/docker/tasks/setupDebian.yml for 127.0.0.1
 ______________________________________________________
/ TASK [docker : Ensure old versions of Docker are not \
\ installed.]                                          /
 ------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 ____________________________________________________
< TASK [docker : Ensure dependencies are installed.] >
 ----------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 _____________________________________________________________
/ TASK [docker : Ensure additional dependencies are installed \
\ (on Ubuntu < 20.04 and any other systems).]                 /
 -------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 _____________________________________________________________
/ TASK [docker : Ensure additional dependencies are installed \
\ (on Ubuntu >= 20.04).]                                      /
 -------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [127.0.0.1]
 _____________________________________
< TASK [docker : Add Docker apt key.] >
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 _________________________________________________________
/ TASK [docker : Ensure curl is present (on older systems \
\ without SNI).]                                          /
 ---------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [127.0.0.1]
 ________________________________________
< TASK [docker : Add Docker repository.] >
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 _______________________________
< TASK [docker : include_tasks] >
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

included: /home/lev/innopolis/devops/ansible/roles/docker/tasks/install_docker.yml for 127.0.0.1
 __________________________________________
< TASK [docker : Install Docker packages.] >
 ------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 _______________________________________________________
< TASK [docker : Ensure /etc/docker/ directory exists.] >
 -------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [127.0.0.1]
 __________________________________________________
< TASK [docker : Configure Docker daemon options.] >
 --------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [127.0.0.1]
 ________________________________________________________
/ TASK [docker : Ensure Docker is started and enabled at \
\ boot.]                                                 /
 --------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 __________________________________________________________
/ TASK [docker : Ensure handlers are notified now to avoid \
\ firewall conflicts.]                                     /
 ----------------------------------------------------------
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

included: /home/lev/innopolis/devops/ansible/roles/docker/tasks/install_compose.yml for 127.0.0.1
 _______________________________________________________
< TASK [docker : Check current docker-compose version.] >
 -------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 __________________________
< TASK [docker : set_fact] >
 --------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [127.0.0.1]
 __________________________________________________________
/ TASK [docker : Delete existing docker-compose version if \
\ it's different.]                                         /
 ----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [127.0.0.1]
 _______________________________________________________
< TASK [docker : Ensure installation directory exists.] >
 -------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [127.0.0.1]
 _________________________________________________________
< TASK [docker : Install Docker Compose (if configured).] >
 ---------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [127.0.0.1]
 _____________________________________________________
< TASK [docker : Get docker group info using getent.] >
 -----------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [127.0.0.1]
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

skipping: [127.0.0.1]
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

127.0.0.1                  : ok=15   changed=2    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0
```

</details>

2. List inventory

<details>
    <summary>Console output: </summary>

```
~/innopolis/devops/ansible (lab5*) » ansible-inventory -i inventory/default.yml --list                                                                                                                     lev@lev-pc
[DEPRECATION WARNING]: Ansible will require Python 3.8 or newer on the controller starting with Ansible 2.12. Current version: 3.6.9 (default, Jun 29 2022, 11:45:57) [GCC 8.4.0]. This feature will be removed from 
ansible-core in version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
{
    "_meta": {
        "hostvars": {
            "local": {
                "ansible_host": "localhost"
            }
        }
    },
    "all": {
        "children": [
            "test",
            "ungrouped"
        ]
    },
    "test": {
        "hosts": [
            "local"
        ]
    }
}
```
</details>

### Bonus task

#### Run playbook with docker role on yandex cloud vm

1. need to add yacloud_compute plugin. add file `plugins/inventory/yacloud_compute` from my [fork](https://github.com/sevenzing/yacloud_compute)
2. add inventory `yacloud_compute.yml`:

    ```yaml
    plugin: yacloud_compute
    ```
3. aquire yc token, put it in some file, add filename to `yacloud_compute.yml`
4. using Lab4 code, create yandex cloud VM using `tf apply`. Also I decided to ssh this VM and run `sudo apt-get update && sudo apt-get upgrade`, but I think it's optional.
5. run playbook:

<details>
    <summary>Console output: </summary>

```
> ansible-playbook playbooks/cloud/main.yml

PLAY [Prepare docker] ****************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************
ok: [terraform1]

TASK [docker : include_tasks] ********************************************************************************************************
included: /Users/levlymarenko/innopolis/devops/ansible/roles/docker/tasks/setupDebian.yml for terraform1

TASK [docker : Ensure old versions of Docker are not installed.] *********************************************************************
ok: [terraform1]

TASK [docker : Ensure dependencies are installed.] ***********************************************************************************
ok: [terraform1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ******************************
skipping: [terraform1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***************************************************
ok: [terraform1]

TASK [docker : Add Docker apt key.] **************************************************************************************************
ok: [terraform1]

TASK [docker : Ensure curl is present (on older systems without SNI).] ***************************************************************
skipping: [terraform1]

TASK [docker : Add Docker repository.] ***********************************************************************************************
ok: [terraform1]

TASK [docker : include_tasks] ********************************************************************************************************
included: /Users/levlymarenko/innopolis/devops/ansible/roles/docker/tasks/install_docker.yml for terraform1

TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************
changed: [terraform1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************
skipping: [terraform1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************
skipping: [terraform1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************
ok: [terraform1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************

RUNNING HANDLER [docker : restart docker] ********************************************************************************************
changed: [terraform1]

TASK [docker : include_tasks] ********************************************************************************************************
included: /Users/levlymarenko/innopolis/devops/ansible/roles/docker/tasks/install_compose.yml for terraform1

TASK [docker : Check current docker-compose version.] ********************************************************************************
ok: [terraform1]

TASK [docker : set_fact] *************************************************************************************************************
ok: [terraform1]

TASK [docker : Delete existing docker-compose version if it's different.] ************************************************************
ok: [terraform1]

TASK [docker : Ensure installation directory exists.] ********************************************************************************
skipping: [terraform1]

TASK [docker : Install Docker Compose (if configured).] ******************************************************************************
changed: [terraform1]

TASK [docker : Get docker group info using getent.] **********************************************************************************
skipping: [terraform1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************

TASK [docker : include_tasks] ********************************************************************************************************
skipping: [terraform1]

PLAY RECAP ***************************************************************************************************************************
terraform1                 : ok=16   changed=3    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0   
```

</details>


6. List inventory:
<details>
    <summary>Console output: </summary>

```
> ansible-inventory -i inventory/yacloud_compute.yml --list
{
    "_meta": {
        "hostvars": {
            "terraform1": {
                "ansible_host": "51.250.75.254"
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
            "terraform1"
        ]
    }
}
```

</details>

## Lab 2

### First docker deployment to yandex cloud

<details><summary>Console output:</summary>

```console
> ansible-playbook playbooks/cloud/app_python/main.yml --diff         

PLAY [Start web_app on yacloud] ***********************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************
ok: [terraform1]

TASK [docker : include_tasks] *************************************************************************************************************************************
included: /Users/levlymarenko/innopolis/devops/ansible/roles/docker/tasks/setupDebian.yml for terraform1

TASK [docker : Ensure old versions of Docker are not installed.] **************************************************************************************************
ok: [terraform1]

TASK [docker : Ensure dependencies are installed.] ****************************************************************************************************************
The following packages were automatically installed and are no longer required:
  linux-headers-5.15.0-43 linux-headers-5.15.0-43-generic
  linux-image-5.15.0-43-generic linux-modules-5.15.0-43-generic
  linux-modules-extra-5.15.0-43-generic
Use 'sudo apt autoremove' to remove them.
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
changed: [terraform1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***********************************************************
skipping: [terraform1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ********************************************************************************
ok: [terraform1]

TASK [docker : Add Docker apt key.] *******************************************************************************************************************************
changed: [terraform1]

TASK [docker : Ensure curl is present (on older systems without SNI).] ********************************************************************************************
skipping: [terraform1]

TASK [docker : Add Docker repository.] ****************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [terraform1]

TASK [docker : include_tasks] *************************************************************************************************************************************
included: /Users/levlymarenko/innopolis/devops/ansible/roles/docker/tasks/install_docker.yml for terraform1

TASK [docker : Install Docker packages (with downgrade option).] **************************************************************************************************
The following packages were automatically installed and are no longer required:
  linux-headers-5.15.0-43 linux-headers-5.15.0-43-generic
  linux-image-5.15.0-43-generic linux-modules-5.15.0-43-generic
  linux-modules-extra-5.15.0-43-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 0 not upgraded.
changed: [terraform1]

TASK [docker : Install pip] ***************************************************************************************************************************************
The following packages were automatically installed and are no longer required:
  linux-headers-5.15.0-43 linux-headers-5.15.0-43-generic
  linux-image-5.15.0-43-generic linux-modules-5.15.0-43-generic
  linux-modules-extra-5.15.0-43-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base javascript-common
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0
  libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev libfakeroot
  libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgd3 libgomp1 libisl23
  libitm1 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc
  libjs-underscore liblsan0 libmpc3 libnsl-dev libpython3-dev
  libpython3.10-dev libquadmath0 libstdc++-11-dev libtiff5 libtirpc-dev
  libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev lto-disabled-list make
  manpages-dev python3-dev python3-wheel python3.10-dev rpcsvc-proto
  zlib1g-dev
Suggested packages:
  bzip2-doc cpp-doc gcc-11-locales debian-keyring g++-multilib g++-11-multilib
  gcc-11-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
  gcc-11-multilib apache2 | lighttpd | httpd glibc-doc bzr libgd-tools
  libstdc++-11-doc make-doc
The following NEW packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base javascript-common
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0
  libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev libfakeroot
  libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgd3 libgomp1 libisl23
  libitm1 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc
  libjs-underscore liblsan0 libmpc3 libnsl-dev libpython3-dev
  libpython3.10-dev libquadmath0 libstdc++-11-dev libtiff5 libtirpc-dev
  libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev lto-disabled-list make
  manpages-dev python3-dev python3-pip python3-wheel python3.10-dev
  rpcsvc-proto zlib1g-dev
0 upgraded, 64 newly installed, 0 to remove and 0 not upgraded.
changed: [terraform1]

TASK [docker : Install docker module] *****************************************************************************************************************************
changed: [terraform1]

TASK [docker : Install compose module] ****************************************************************************************************************************
ok: [terraform1]

TASK [docker : Ensure /etc/docker/ directory exists.] *************************************************************************************************************
skipping: [terraform1]

TASK [docker : Configure Docker daemon options.] ******************************************************************************************************************
skipping: [terraform1]

TASK [docker : Ensure Docker is started and enabled at boot.] *****************************************************************************************************
ok: [terraform1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] *************************************************************************************

RUNNING HANDLER [docker : restart docker] *************************************************************************************************************************
changed: [terraform1]

TASK [docker : include_tasks] *************************************************************************************************************************************
included: /Users/levlymarenko/innopolis/devops/ansible/roles/docker/tasks/install_compose.yml for terraform1

TASK [docker : Check current docker-compose version.] *************************************************************************************************************
ok: [terraform1]

TASK [docker : set_fact] ******************************************************************************************************************************************
ok: [terraform1]

TASK [docker : Delete existing docker-compose version if it's different.] *****************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/usr/local/bin/docker-compose",
-    "state": "file"
+    "state": "absent"
 }

changed: [terraform1]

TASK [docker : Ensure installation directory exists.] *************************************************************************************************************
skipping: [terraform1]

TASK [docker : Install Docker Compose (if configured).] ***********************************************************************************************************
changed: [terraform1]

TASK [docker : Get docker group info using getent.] ***************************************************************************************************************
skipping: [terraform1]

TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************************

TASK [docker : include_tasks] *************************************************************************************************************************************
skipping: [terraform1]

TASK [web_app : Stop all services] ********************************************************************************************************************************
skipping: [terraform1]

TASK [web_app : Remove app directory] *****************************************************************************************************************************
skipping: [terraform1]

TASK [web_app : Create dir] ***************************************************************************************************************************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0755",
+    "mode": "0700",
     "path": "/opt/innopolis_devops_labs/app_python",
-    "state": "absent"
+    "state": "directory"
 }

changed: [terraform1]

TASK [web_app : Template a file to `dir/docker-compose.yml`] ******************************************************************************************************
--- before
+++ after: /Users/levlymarenko/.ansible/tmp/ansible-local-9655007pup7ft/tmpu_36xhdf/docker-compose.yml.j2
@@ -0,0 +1,9 @@
+version: "3.9"
+
+services:
+  app_python:
+    image: ghcr.io/sevenzing/currenttime:v0.3.2
+    container_name: app_python
+    ports:
+      - "4444:4444"
+    restart: on-failure

changed: [terraform1]

TASK [web_app : Start with docker compose] ************************************************************************************************************************
changed: [terraform1]

PLAY RECAP ********************************************************************************************************************************************************
terraform1                 : ok=22   changed=12   unreachable=0    failed=0    skipped=10   rescued=0    ignored=0   

```

</details>


We deployed app to yandex cloud, we can check via curl request:

```console
> curl 62.84.124.253:4444
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Innopolis DevOps</title>
</head>
<body>
    <center><p>Hello from Python app!</p></center>
    <center><p>MSK time: 16:56:41</p></center>
</body>
</html>
```

### Bonus task

Added metrics and healthcheck for python and rust application.

Wrote playbook for rust, deployed rust app to yandex cloud:

```console
> curl 62.84.124.253:4445    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Innopolis DevOps</title>
</head>
<body>
    <center><p>Hello from Rust app!</p></center>
    <center><p>MSK time: 17:48:18</p></center>
</body>
</html> 
```
