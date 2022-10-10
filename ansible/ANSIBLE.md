## ansible part now!

###running ⬇
```sh
ansible-playbook -i ansible/inventory/yandex.yml ansible/playbooks/main.yaml --diff
```
#### output:

<!-- markdownlint-disable MD033 -->

<details>
<summary>full here</summary>

```bash

PLAY [molbertevm] ************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Load OS-specific vars.] ***************************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : include_tasks] ************************************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : include_tasks] ************************************************************************
included: /home/kseny/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for molbertevm

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Ensure dependencies are installed.] ***************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [molbertevm]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************
ok: [molbertevm]

TASK [geerlingguy.docker : Add Docker apt key.] ******************************************************************
changed: [molbertevm]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *******************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] **********************
skipping: [molbertevm]

TASK [geerlingguy.docker : Add Docker repository.] ***************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [molbertevm]

TASK [geerlingguy.docker : Install Docker packages.] *************************************************************
skipping: [molbertevm]
TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *************************************
The following additional packages will be installed:
  docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
  libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  diffutils-doc perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl make libb-debug-perl liblocale-codes-perl
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
  libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
0 upgraded, 16 newly installed, 0 to remove and 157 not upgraded.
changed: [molbertevm]

TASK [geerlingguy.docker : Install docker-compose plugin.] *******************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *******************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Configure Docker daemon options.] *****************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ****************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************

RUNNING HANDLER [geerlingguy.docker : restart docker] ************************************************************
changed: [molbertevm]

TASK [geerlingguy.docker : include_tasks] ************************************************************************
included: /home/kseny/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for molbertevm

TASK [geerlingguy.docker : Check current docker-compose version.] ************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : set_fact] *****************************************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ****************************
ok: [molbertevm]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] **********************************************
changed: [molbertevm]

TASK [geerlingguy.docker : Get docker group info using getent.] **************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] *****************************

TASK [geerlingguy.docker : include_tasks] ************************************************************************
skipping: [molbertevm]

PLAY RECAP *******************************************************************************************************
molbertevm                 : ok=16   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```
</details>

###recap only

```bash
PLAY RECAP *******************************************************************************************************
molbertevm                 : ok=16   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

###running ⬇

```bash
ansible-inventory -i ansible/inventory/inventory.yml --list
```

```bash
{
    "_meta": {
        "hostvars": {
            "molbertevm": {
                "ansible_host": "62.84.119.96",
                "ansible_user": "test",
                "become": true
            }
        }
    },
    "all": {
        "children": [
            "molberte",
            "ungrouped"
        ]
    },
    "molberte": {
        "hosts": [
            "molbertevm"
        ]
    }
}
```

#### even dynamic inventory was implemented, ajda molodca!👍👍👍

### running ⬇ (now from ansible folder!)
```sh
export ANSIBLE_CONFIG=$(realpath ./ansible.cfg) && ansible-playbook -i ./inventory/yandex.yml ./playbooks/main.yaml --diff
```
#### output:

<!-- markdownlint-disable MD033 -->

<details>
<summary>full here</summary>

```bash

TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
included: /mnt/d/my/study/sem7/devops/devops_labs/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for molbertevm

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****
skipping: [molbertevm]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************
ok: [molbertevm]

TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************
changed: [molbertevm]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [molbertevm]

TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************
The following additional packages will be installed:
  docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
  libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  diffutils-doc perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl make libb-debug-perl liblocale-codes-perl
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
  libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
0 upgraded, 16 newly installed, 0 to remove and 157 not upgraded.
changed: [molbertevm]

TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************

RUNNING HANDLER [geerlingguy.docker : restart docker] ******************************************************************
changed: [molbertevm]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
included: /mnt/d/my/study/sem7/devops/devops_labs/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for molbertevm

TASK [geerlingguy.docker : Check current docker-compose version.] ******************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : set_fact] ***********************************************************************************
ok: [molbertevm]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] **********************************
ok: [molbertevm]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ****************************************************
changed: [molbertevm]

TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************
skipping: [molbertevm]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
skipping: [molbertevm]

TASK [geerlingguy.pip : Ensure Pip is installed.] **********************************************************************
The following additional packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-9
  dpkg-dev fakeroot g++ g++-9 gcc gcc-9 gcc-9-base libalgorithm-diff-perl
  libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan5 libatomic1
  libbinutils libc-dev-bin libc6 libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0
  libctf0 libdpkg-perl libexpat1 libexpat1-dev libfakeroot
  libfile-fcntllock-perl libgcc-9-dev libgomp1 libisl22 libitm1 liblsan0
  libmpc3 libmpfr6 libpython3-dev libpython3.8 libpython3.8-dev
  libpython3.8-minimal libpython3.8-stdlib libquadmath0 libstdc++-9-dev
  libtsan0 libubsan1 linux-libc-dev make manpages-dev python-pip-whl
  python3-dev python3-wheel python3.8 python3.8-dev python3.8-minimal zlib1g
  zlib1g-dev
Suggested packages:
  binutils-doc cpp-doc gcc-9-locales debian-keyring g++-multilib
  g++-9-multilib gcc-9-doc gcc-multilib autoconf automake libtool flex bison
  gdb gcc-doc gcc-9-multilib glibc-doc bzr libstdc++-9-doc make-doc
  python3.8-venv python3.8-doc binfmt-support
The following NEW packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-9
  dpkg-dev fakeroot g++ g++-9 gcc gcc-9 gcc-9-base libalgorithm-diff-perl
  libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan5 libatomic1
  libbinutils libc-dev-bin libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0
  libctf0 libdpkg-perl libexpat1-dev libfakeroot libfile-fcntllock-perl
  libgcc-9-dev libgomp1 libisl22 libitm1 liblsan0 libmpc3 libmpfr6
  libpython3-dev libpython3.8-dev libquadmath0 libstdc++-9-dev libtsan0
  libubsan1 linux-libc-dev make manpages-dev python-pip-whl python3-dev
  python3-pip python3-wheel python3.8-dev zlib1g-dev
The following packages will be upgraded:
  libc6 libexpat1 libpython3.8 libpython3.8-minimal libpython3.8-stdlib
  python3.8 python3.8-minimal zlib1g
8 upgraded, 51 newly installed, 0 to remove and 149 not upgraded.
changed: [molbertevm]

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] ****************************************************
changed: [molbertevm] => (item={'name': 'pip', 'extra_args': '--upgrade'})
changed: [molbertevm] => (item={'name': 'docker'})
changed: [molbertevm] => (item={'name': 'docker-compose'})

TASK [web_app : Include wipe task list] ********************************************************************************
skipping: [molbertevm]

TASK [web_app : Create a directory if it does not exist] ***************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [molbertevm]

TASK [web_app : Template a file to /etc/file.conf] *********************************************************************
--- before
+++ after: /home/kseny/.ansible/tmp/ansible-local-320410897yt4/tmpyxyjigoq/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+version: "3"
+
+services:
+  python_app:
+    image: molberte/devops-labs:latest
+    ports:
+     - "80:5000"
+    restart: always
\ No newline at end of file

changed: [molbertevm]

TASK [web_app : Run docker-compose services] ***************************************************************************
changed: [molbertevm]

PLAY RECAP *************************************************************************************************************
molbertevm                 : ok=21   changed=10   unreachable=0    failed=0    skipped=13   rescued=0    ignored=0

```
</details>

###recap only

```bash
PLAY RECAP *************************************************************************************************************
molbertevm                 : ok=21   changed=10   unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```