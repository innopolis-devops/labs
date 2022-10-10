# Lab #5

Initially, one have to create a file called `yacloud.token` in the ansible root and provide it with the Yandex OAuth token.
Also, there should be a running Yandex.Cloud machine. It is achievable by executing `terraform apply` in the `./terraform/yc` directory.
Finally, there is a private-public key mapping, so you have to manage it by yourself (if you are willing to run it locally)

The output of the `ansible-playbook playbooks/yacloud/main.yml --diff` command

```text
PLAY [Docker] ****************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/setup_debian.yml for terraform

TASK [docker : Ensure old versions of Docker are not installed.] *************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure dependencies are installed.] ***************************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key.] ******************************************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure curl is present (on older systems without SNI).] *******************************************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **********************************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker repository.] ***************************************************************************************************************************************************
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_docker.yml for terraform

TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************************************
ok: [terraform]

TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************************************
skipping: [terraform]

TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_compose.yml for terraform

TASK [docker : Check current docker-compose version.] ************************************************************************************************************************************
ok: [terraform]

TASK [docker : set_fact] *****************************************************************************************************************************************************************
ok: [terraform]

TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************************************
skipping: [terraform]

TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************************************
skipping: [terraform]

TASK [docker : Get docker group info using getent.] **************************************************************************************************************************************
skipping: [terraform]

TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************************************
skipping: [terraform]

PLAY RECAP *******************************************************************************************************************************************************************************
terraform                  : ok=12   changed=0    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```

The output of the `ansible-inventory -i inventory/yacloud_compute.yml --list`

```text
{
    "_meta": {
        "hostvars": {
            "terraform": {
                "ansible_host": "51.250.86.186"
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
            "terraform"
        ]
    }
}
```

Then, I SSHed to the VM and checked that docker and docker-compose are indeed installed

# Lab #6

## Python app

Output of the `ansible-playbook playbooks/yacloud/app_python/main.yml --diff` command

```text
PLAY [Deploy app_python] *****************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/setup_debian.yml for terraform

TASK [docker : Ensure old versions of Docker are not installed.] *************************************************************************************************
ok: [terraform]

TASK [docker : Ensure dependencies are installed.] ***************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key.] ******************************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure curl is present (on older systems without SNI).] *******************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **********************************************************************************
skipping: [terraform]

TASK [docker : Add Docker repository.] ***************************************************************************************************************************
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_docker.yml for terraform

TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************
ok: [terraform]

TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************
skipping: [terraform]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************
skipping: [terraform]

TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************
skipping: [terraform]

TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************
skipping: [terraform]

TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************
ok: [terraform]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_compose.yml for terraform

TASK [docker : Check current docker-compose version.] ************************************************************************************************************
ok: [terraform]

TASK [docker : set_fact] *****************************************************************************************************************************************
ok: [terraform]

TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************
skipping: [terraform]

TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************
skipping: [terraform]

TASK [docker : Get docker group info using getent.] **************************************************************************************************************
skipping: [terraform]

TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************
skipping: [terraform]

TASK [web_app : Wipe] ********************************************************************************************************************************************
skipping: [terraform]

TASK [web_app : Initialize working dir] **************************************************************************************************************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0755",
+    "mode": "0700",
     "path": "/opt/app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [terraform]

TASK [web_app : Move docker-compose template to remote] **********************************************************************************************************
--- before
+++ after: /Users/kurmazov/.ansible/tmp/ansible-local-165824tx77u_7/tmpu276jftc/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+version: '3.8'
+
+services:
+  server:
+    image: akurmazov/server:latest
+    command: python -m poetry run uvicorn server.app:app --host 0.0.0.0
+    ports:
+      - 8000:8000

changed: [terraform]

TASK [web_app : Install pip] *************************************************************************************************************************************
The following additional packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-7
  dh-python dpkg-dev fakeroot g++ g++-7 gcc gcc-7 gcc-7-base
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan4 libatomic1 libbinutils libc-dev-bin libc6 libc6-dev libcc1-0
  libcilkrts5 libdpkg-perl libexpat1 libexpat1-dev libfakeroot
  libfile-fcntllock-perl libgcc-7-dev libgomp1 libisl19 libitm1 liblsan0
  libmpc3 libmpfr6 libmpx2 libpython3-dev libpython3.6 libpython3.6-dev
  libpython3.6-minimal libpython3.6-stdlib libquadmath0 libstdc++-7-dev
  libtsan0 libubsan0 linux-libc-dev make manpages-dev python-pip-whl
  python3-crypto python3-dev python3-distutils python3-keyring
  python3-keyrings.alt python3-lib2to3 python3-secretstorage
  python3-setuptools python3-wheel python3-xdg python3.6 python3.6-dev
  python3.6-minimal
Suggested packages:
  binutils-doc cpp-doc gcc-7-locales debian-keyring g++-multilib
  g++-7-multilib gcc-7-doc libstdc++6-7-dbg gcc-multilib autoconf automake
  libtool flex bison gdb gcc-doc gcc-7-multilib libgcc1-dbg libgomp1-dbg
  libitm1-dbg libatomic1-dbg libasan4-dbg liblsan0-dbg libtsan0-dbg
  libubsan0-dbg libcilkrts5-dbg libmpx2-dbg libquadmath0-dbg glibc-doc bzr
  libstdc++-7-doc make-doc python-crypto-doc gnome-keyring libkf5wallet-bin
  gir1.2-gnomekeyring-1.0 python-secretstorage-doc python-setuptools-doc
  python3.6-venv python3.6-doc binfmt-support
The following NEW packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-7
  dh-python dpkg-dev fakeroot g++ g++-7 gcc gcc-7 gcc-7-base
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan4 libatomic1 libbinutils libc-dev-bin libc6-dev libcc1-0 libcilkrts5
  libdpkg-perl libexpat1-dev libfakeroot libfile-fcntllock-perl libgcc-7-dev
  libgomp1 libisl19 libitm1 liblsan0 libmpc3 libmpfr6 libmpx2 libpython3-dev
  libpython3.6-dev libquadmath0 libstdc++-7-dev libtsan0 libubsan0
  linux-libc-dev make manpages-dev python-pip-whl python3-crypto python3-dev
  python3-distutils python3-keyring python3-keyrings.alt python3-lib2to3
  python3-pip python3-secretstorage python3-setuptools python3-wheel
  python3-xdg python3.6-dev
The following packages will be upgraded:
  libc6 libexpat1 libpython3.6 libpython3.6-minimal libpython3.6-stdlib
  python3.6 python3.6-minimal
7 upgraded, 58 newly installed, 0 to remove and 97 not upgraded.
changed: [terraform]

TASK [web_app : Install python docker-compose module] ************************************************************************************************************
changed: [terraform]

TASK [web_app : Start with docker-compose] ***********************************************************************************************************************
changed: [terraform]

PLAY RECAP *******************************************************************************************************************************************************
terraform                  : ok=17   changed=5    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   
```

Output of the `curl http://51.250.91.19:8000/` command

```text
<h1>2022-10-10 23:38:18.733917+03:00</h1>
```

Output of the `curl http://51.250.91.19:8000/health` command

```text
{}  # i.e., 200 OK
```

Output of the `curl http://51.250.91.19:8000/metrics` command

```text
# HELP python_gc_objects_collected_total Objects collected during gc
# TYPE python_gc_objects_collected_total counter
python_gc_objects_collected_total{generation="0"} 3153.0
python_gc_objects_collected_total{generation="1"} 1305.0
python_gc_objects_collected_total{generation="2"} 0.0
# HELP python_gc_objects_uncollectable_total Uncollectable object found during GC
# TYPE python_gc_objects_uncollectable_total counter
python_gc_objects_uncollectable_total{generation="0"} 0.0
python_gc_objects_uncollectable_total{generation="1"} 0.0
python_gc_objects_uncollectable_total{generation="2"} 0.0
# HELP python_gc_collections_total Number of times this generation was collected
# TYPE python_gc_collections_total counter
python_gc_collections_total{generation="0"} 96.0
python_gc_collections_total{generation="1"} 8.0
python_gc_collections_total{generation="2"} 0.0
# HELP python_info Python platform information
# TYPE python_info gauge
python_info{implementation="CPython",major="3",minor="9",patchlevel="4",version="3.9.4"} 1.0
# HELP process_virtual_memory_bytes Virtual memory size in bytes.
# TYPE process_virtual_memory_bytes gauge
process_virtual_memory_bytes 1.22421248e+08
# HELP process_resident_memory_bytes Resident memory size in bytes.
# TYPE process_resident_memory_bytes gauge
process_resident_memory_bytes 3.975168e+07
# HELP process_start_time_seconds Start time of the process since unix epoch in seconds.
# TYPE process_start_time_seconds gauge
process_start_time_seconds 1.66543419054e+09
# HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.
# TYPE process_cpu_seconds_total counter
process_cpu_seconds_total 2.53
# HELP process_open_fds Number of open file descriptors.
# TYPE process_open_fds gauge
process_open_fds 9.0
# HELP process_max_fds Maximum number of open file descriptors.
# TYPE process_max_fds gauge
process_max_fds 1.048576e+06
# HELP starlette_requests_in_progress Total HTTP requests currently in progress
# TYPE starlette_requests_in_progress gauge
starlette_requests_in_progress{app_name="starlette",method="GET"} 1.0
# HELP starlette_requests_total Total HTTP requests
# TYPE starlette_requests_total counter
starlette_requests_total{app_name="starlette",method="GET",path="/",status_code="200"} 2.0
starlette_requests_total{app_name="starlette",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_requests_total{app_name="starlette",method="GET",path="/health",status_code="200"} 1.0
# HELP starlette_requests_created Total HTTP requests
# TYPE starlette_requests_created gauge
starlette_requests_created{app_name="starlette",method="GET",path="/",status_code="200"} 1.6654342947048893e+09
starlette_requests_created{app_name="starlette",method="GET",path="/favicon.ico",status_code="404"} 1.665434295110553e+09
starlette_requests_created{app_name="starlette",method="GET",path="/health",status_code="200"} 1.6654343732555847e+09
# HELP starlette_request_duration_seconds HTTP request duration, in seconds
# TYPE starlette_request_duration_seconds histogram
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.005",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.01",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.025",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.05",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.075",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.1",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.25",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.5",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.75",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="1.0",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="2.5",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="5.0",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="7.5",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="10.0",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="+Inf",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_count{app_name="starlette",method="GET",path="/",status_code="200"} 2.0
starlette_request_duration_seconds_sum{app_name="starlette",method="GET",path="/",status_code="200"} 0.0018959159999667463
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.005",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.01",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.025",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.05",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.075",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.1",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.25",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.5",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.75",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="1.0",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="2.5",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="5.0",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="7.5",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="10.0",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="+Inf",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_count{app_name="starlette",method="GET",path="/favicon.ico",status_code="404"} 1.0
starlette_request_duration_seconds_sum{app_name="starlette",method="GET",path="/favicon.ico",status_code="404"} 0.000698358000022381
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.005",method="GET",path="/health",status_code="200"} 0.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.01",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.025",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.05",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.075",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.1",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.25",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.5",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="0.75",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="1.0",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="2.5",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="5.0",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="7.5",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="10.0",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_bucket{app_name="starlette",le="+Inf",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_count{app_name="starlette",method="GET",path="/health",status_code="200"} 1.0
starlette_request_duration_seconds_sum{app_name="starlette",method="GET",path="/health",status_code="200"} 0.007113512999922023
# HELP starlette_request_duration_seconds_created HTTP request duration, in seconds
# TYPE starlette_request_duration_seconds_created gauge
starlette_request_duration_seconds_created{app_name="starlette",method="GET",path="/",status_code="200"} 1.6654342947049615e+09
starlette_request_duration_seconds_created{app_name="starlette",method="GET",path="/favicon.ico",status_code="404"} 1.665434295110593e+09
starlette_request_duration_seconds_created{app_name="starlette",method="GET",path="/health",status_code="200"} 1.6654343732556252e+09
```

Output of the `ansible-playbook playbooks/yacloud/app_python/main.yml --tags wipe --diff` command

```text

PLAY [Deploy app_python] *****************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************
ok: [terraform]

TASK [web_app : Wipe] ********************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/web_app/tasks/wipe.yml for terraform

TASK [web_app : Stop all services] *******************************************************************************************************************************
changed: [terraform]

TASK [web_app : Tear down existing services] *********************************************************************************************************************
changed: [terraform]

TASK [web_app : Wipe working dir] ********************************************************************************************************************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "/opt/app",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/opt/app/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [terraform]

PLAY RECAP *******************************************************************************************************************************************************
terraform                  : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Rust app

Output of the `ansible-playbook playbooks/yacloud/app_rust/main.yml --diff` command

```text

PLAY [Deploy app_rust] *******************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************
The authenticity of host '51.250.71.54 (51.250.71.54)' can't be established.
ECDSA key fingerprint is SHA256:psC6fFcWAKgix0+vAjVUq4ukZauRnijmHLw1rZgbBqE.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/setup_debian.yml for terraform

TASK [docker : Ensure old versions of Docker are not installed.] *************************************************************************************************
ok: [terraform]

TASK [docker : Ensure dependencies are installed.] ***************************************************************************************************************
ok: [terraform]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key.] ******************************************************************************************************************************
changed: [terraform]

TASK [docker : Ensure curl is present (on older systems without SNI).] *******************************************************************************************
skipping: [terraform]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **********************************************************************************
skipping: [terraform]

TASK [docker : Add Docker repository.] ***************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

changed: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_docker.yml for terraform

TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************
The following additional packages will be installed:
  dbus dbus-user-session docker-scan-plugin git git-man libcurl3-gnutls
  libdbus-1-3 liberror-perl libgdbm-compat4 libltdl7 libperl5.26 patch perl
  perl-modules-5.26 pigz
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  diffutils-doc perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl make
Recommended packages:
  slirp4netns
The following NEW packages will be installed:
  containerd.io dbus-user-session docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-scan-plugin git git-man libcurl3-gnutls
  liberror-perl libgdbm-compat4 libltdl7 libperl5.26 patch perl
  perl-modules-5.26 pigz
The following packages will be upgraded:
  dbus libdbus-1-3
2 upgraded, 17 newly installed, 0 to remove and 104 not upgraded.
changed: [terraform]

TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************
skipping: [terraform]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************
skipping: [terraform]

TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************
skipping: [terraform]

TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************
skipping: [terraform]

TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************
ok: [terraform]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************

RUNNING HANDLER [docker : restart docker] ************************************************************************************************************************
changed: [terraform]

TASK [docker : include_tasks] ************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/docker/tasks/install_compose.yml for terraform

TASK [docker : Check current docker-compose version.] ************************************************************************************************************
ok: [terraform]

TASK [docker : set_fact] *****************************************************************************************************************************************
ok: [terraform]

TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************
ok: [terraform]

TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************
changed: [terraform]

TASK [docker : Get docker group info using getent.] **************************************************************************************************************
skipping: [terraform]

TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************

TASK [docker : include_tasks] ************************************************************************************************************************************
skipping: [terraform]

TASK [web_app : Wipe] ********************************************************************************************************************************************
skipping: [terraform]

TASK [web_app : Initialize working dir] **************************************************************************************************************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0755",
+    "mode": "0700",
     "path": "/opt/app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [terraform]

TASK [web_app : Move docker-compose template to remote] **********************************************************************************************************
--- before
+++ after: /Users/kurmazov/.ansible/tmp/ansible-local-17253a41nsvox/tmpxc3th57e/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+version: '3.8'
+
+services:
+  server:
+    image: akurmazov/app_rust-server:latest
+    command: cargo run
+    ports:
+      - 8000:8000

changed: [terraform]

TASK [web_app : Install pip] *************************************************************************************************************************************
The following additional packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-7
  dh-python dpkg-dev fakeroot g++ g++-7 gcc gcc-7 gcc-7-base
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan4 libatomic1 libbinutils libc-dev-bin libc6 libc6-dev libcc1-0
  libcilkrts5 libdpkg-perl libexpat1 libexpat1-dev libfakeroot
  libfile-fcntllock-perl libgcc-7-dev libgomp1 libisl19 libitm1 liblsan0
  libmpc3 libmpfr6 libmpx2 libpython3-dev libpython3.6 libpython3.6-dev
  libpython3.6-minimal libpython3.6-stdlib libquadmath0 libstdc++-7-dev
  libtsan0 libubsan0 linux-libc-dev make manpages-dev python-pip-whl
  python3-crypto python3-dev python3-distutils python3-keyring
  python3-keyrings.alt python3-lib2to3 python3-secretstorage
  python3-setuptools python3-wheel python3-xdg python3.6 python3.6-dev
  python3.6-minimal
Suggested packages:
  binutils-doc cpp-doc gcc-7-locales debian-keyring g++-multilib
  g++-7-multilib gcc-7-doc libstdc++6-7-dbg gcc-multilib autoconf automake
  libtool flex bison gdb gcc-doc gcc-7-multilib libgcc1-dbg libgomp1-dbg
  libitm1-dbg libatomic1-dbg libasan4-dbg liblsan0-dbg libtsan0-dbg
  libubsan0-dbg libcilkrts5-dbg libmpx2-dbg libquadmath0-dbg glibc-doc bzr
  libstdc++-7-doc make-doc python-crypto-doc gnome-keyring libkf5wallet-bin
  gir1.2-gnomekeyring-1.0 python-secretstorage-doc python-setuptools-doc
  python3.6-venv python3.6-doc binfmt-support
The following NEW packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-7
  dh-python dpkg-dev fakeroot g++ g++-7 gcc gcc-7 gcc-7-base
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan4 libatomic1 libbinutils libc-dev-bin libc6-dev libcc1-0 libcilkrts5
  libdpkg-perl libexpat1-dev libfakeroot libfile-fcntllock-perl libgcc-7-dev
  libgomp1 libisl19 libitm1 liblsan0 libmpc3 libmpfr6 libmpx2 libpython3-dev
  libpython3.6-dev libquadmath0 libstdc++-7-dev libtsan0 libubsan0
  linux-libc-dev make manpages-dev python-pip-whl python3-crypto python3-dev
  python3-distutils python3-keyring python3-keyrings.alt python3-lib2to3
  python3-pip python3-secretstorage python3-setuptools python3-wheel
  python3-xdg python3.6-dev
The following packages will be upgraded:
  libc6 libexpat1 libpython3.6 libpython3.6-minimal libpython3.6-stdlib
  python3.6 python3.6-minimal
7 upgraded, 58 newly installed, 0 to remove and 97 not upgraded.
changed: [terraform]

TASK [web_app : Install python docker-compose module] ************************************************************************************************************
changed: [terraform]

TASK [web_app : Start with docker-compose] ***********************************************************************************************************************
changed: [terraform]

PLAY RECAP *******************************************************************************************************************************************************
terraform                  : ok=20   changed=10   unreachable=0    failed=0    skipped=11   rescued=0    ignored=0   
```

Output of the `curl http://51.250.71.54:8000/` command

```text
<h1>2022-10-10T23:57:06.309434612+03:00</h1>
```

Output of the `curl http://51.250.71.54:8000/health` command

```text
Ok  # i.e., 200 OK
```

Output of the `curl http://51.250.71.54:8000/metrics` command

```text
# HELP rocket_http_requests_duration_seconds HTTP request duration in seconds for all requests
# TYPE rocket_http_requests_duration_seconds histogram
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.005"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.01"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.025"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.05"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.1"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.25"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.5"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="1"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="2.5"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="5"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="10"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="+Inf"} 3
rocket_http_requests_duration_seconds_sum{endpoint="/",method="GET",status="200"} 0.0008357000000000001
rocket_http_requests_duration_seconds_count{endpoint="/",method="GET",status="200"} 3
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.005"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.01"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.025"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.05"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.1"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.25"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="1"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="2.5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="10"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="+Inf"} 1
rocket_http_requests_duration_seconds_sum{endpoint="/health",method="GET",status="200"} 0.00028173
rocket_http_requests_duration_seconds_count{endpoint="/health",method="GET",status="200"} 1
# HELP rocket_http_requests_total Total number of HTTP requests
# TYPE rocket_http_requests_total counter
rocket_http_requests_total{endpoint="/",method="GET",status="200"} 3
rocket_http_requests_total{endpoint="/health",method="GET",status="200"} 1
```

Output of the `ansible-playbook playbooks/yacloud/app_rust/main.yml --tags wipe --diff` command

```text
PLAY [Deploy app_rust] *******************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************
ok: [terraform]

TASK [web_app : Wipe] ********************************************************************************************************************************************
included: /Users/kurmazov/labs/ansible/roles/web_app/tasks/wipe.yml for terraform

TASK [web_app : Stop all services] *******************************************************************************************************************************
changed: [terraform]

TASK [web_app : Tear down existing services] *********************************************************************************************************************
changed: [terraform]

TASK [web_app : Wipe working dir] ********************************************************************************************************************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "/opt/app",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/opt/app/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [terraform]

PLAY RECAP *******************************************************************************************************************************************************
terraform                  : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
