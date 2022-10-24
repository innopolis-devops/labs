# Command outputs

```bash
ansible-playbook playbooks/main.yml --diff

PLAY [Prepare docker] **************************************************************************

TASK [Gathering Facts] *************************************************************************
ok: [VM1]

TASK [docker : Load OS-specific vars.] *********************************************************
ok: [VM1]

TASK [docker : include_tasks] ******************************************************************
skipping: [VM1]

TASK [docker : include_tasks] ******************************************************************
included: /Users/glebosotov/code/inno-devops-labs/ansible2/roles/docker/tasks/setup-Debian.yml for VM1

TASK [docker : Ensure old versions of Docker are not installed.] *******************************
ok: [VM1]

TASK [docker : Ensure dependencies are installed.] *********************************************
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 39 not upgraded.
changed: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************
ok: [VM1]

TASK [docker : Add Docker apt key.] ************************************************************
ok: [VM1]

TASK [docker : Ensure curl is present (on older systems without SNI).] *************************
skipping: [VM1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ****************
skipping: [VM1]

TASK [docker : Add Docker repository.] *********************************************************
ok: [VM1]

TASK [docker : Install Docker packages.] *******************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] *******************************
ok: [VM1]

TASK [docker : Install docker-compose plugin.] *************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] ***********************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************

TASK [docker : Get docker group info using getent.] ********************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] ***********************

TASK [docker : include_tasks] ******************************************************************
skipping: [VM1]

PLAY RECAP *************************************************************************************
VM1                        : ok=10   changed=1    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0  
```

```bash
ansible-inventory -i inventory/inventory.yaml --list
{
    "VM": {
        "hosts": [
            "VM1"
        ]
    },
    "_meta": {
        "hostvars": {
            "VM1": {
                "ansible_become": true,
                "ansible_host": "3.65.38.113",
                "ansible_ssh_private_key_file": "~/code/inno-devops-labs/devops.pem",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "VM",
            "ungrouped"
        ]
    }
}
```

```bash
ansible-playbook playbooks/main.yml --diff

PLAY [Prepare docker] *******************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************
The authenticity of host '18.196.137.39 (18.196.137.39)' can't be established.
ED25519 key fingerprint is SHA256:ClqoFWhsgz280uoonP/pMmzQG3UK8yGIq/wQGZsR8eg.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [VM1]

TASK [docker : Load OS-specific vars.] **************************************************************************************************************************************
ok: [VM1]

TASK [docker : include_tasks] ***********************************************************************************************************************************************
skipping: [VM1]

TASK [docker : include_tasks] ***********************************************************************************************************************************************
included: /Users/glebosotov/code/inno-devops-labs/ansible/roles/docker/tasks/setup-Debian.yml for VM1

TASK [docker : Ensure old versions of Docker are not installed.] ************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure dependencies are installed.] **************************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *********************************************************************
skipping: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ******************************************************************************************
ok: [VM1]

TASK [docker : Add Docker apt key.] *****************************************************************************************************************************************
changed: [VM1]

TASK [docker : Ensure curl is present (on older systems without SNI).] ******************************************************************************************************
skipping: [VM1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] *********************************************************************************************
skipping: [VM1]

TASK [docker : Add Docker repository.] **************************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [VM1]

TASK [docker : Install Docker packages.] ************************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] ************************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 45 not upgraded.
changed: [VM1]

TASK [docker : Install python dependencies] *********************************************************************************************************************************
The following additional packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base gcc-12-base
  javascript-common libalgorithm-diff-perl libalgorithm-diff-xs-perl
  libalgorithm-merge-perl libasan6 libatomic1 libc-dev-bin libc-devtools
  libc6-dev libcc1-0 libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev
  libfakeroot libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgcc-s1
  libgd3 libgomp1 libisl23 libitm1 libjbig0 libjpeg-turbo8 libjpeg8
  libjs-jquery libjs-sphinxdoc libjs-underscore liblsan0 libmpc3 libnsl-dev
  libpython3-dev libpython3-stdlib libpython3.10 libpython3.10-dev
  libpython3.10-minimal libpython3.10-stdlib libquadmath0 libstdc++-11-dev
  libstdc++6 libtiff5 libtirpc-dev libtsan0 libubsan1 libwebp7 libxpm4
  linux-libc-dev lto-disabled-list make manpages-dev python3 python3-dev
  python3-distutils python3-lib2to3 python3-minimal python3-wheel python3.10
  python3.10-dev python3.10-minimal rpcsvc-proto zlib1g zlib1g-dev
Suggested packages:
  bzip2-doc cpp-doc gcc-11-locales debian-keyring g++-multilib g++-11-multilib
  gcc-11-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
  gcc-11-multilib apache2 | lighttpd | httpd glibc-doc bzr libgd-tools
  libstdc++-11-doc make-doc python3-doc python3-tk python3-venv
  python3.10-venv python3.10-doc binfmt-support
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
The following packages will be upgraded:
  gcc-12-base libgcc-s1 libpython3-stdlib libpython3.10 libpython3.10-minimal
  libpython3.10-stdlib libstdc++6 python3 python3-distutils python3-lib2to3
  python3-minimal python3.10 python3.10-minimal zlib1g
14 upgraded, 64 newly installed, 0 to remove and 31 not upgraded.
changed: [VM1]

TASK [docker : Install 'Docker SDK for Python'] *****************************************************************************************************************************
changed: [VM1]

TASK [docker : Install 'Docker Compose for Python'] *************************************************************************************************************************
changed: [VM1]

TASK [docker : Install docker-compose plugin.] ******************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ******************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ***********************************************************************************************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] ***************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************

RUNNING HANDLER [docker : restart docker] ***********************************************************************************************************************************
changed: [VM1]

TASK [docker : Get docker group info using getent.] *************************************************************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] ****************************************************************************************************

TASK [docker : include_tasks] ***********************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Wipe the base dir] ******************************************************************************************************************************************
skipping: [VM1]

TASK [web_app : Create a directory if it doesn't exist] *********************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "opt/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [VM1]

TASK [web_app : Template the docker-compose.yml] ****************************************************************************************************************************
--- before
+++ after: /Users/glebosotov/.ansible/tmp/ansible-local-6724sj9_iphg/tmpzyjz5847/docker-compose.yml.j2
@@ -0,0 +1,9 @@
+version: '2.0'
+
+services:
+    web_app:
+        image: "glebosotov/inno-devops-labs-app-python:latest"
+        container_name: web_app
+        ports: 
+            - "1337:5000"
+        restart: always
\ No newline at end of file

changed: [VM1]

TASK [web_app : Start services] *********************************************************************************************************************************************
changed: [VM1]

PLAY RECAP ******************************************************************************************************************************************************************
VM1                        : ok=17   changed=10   unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   
```
