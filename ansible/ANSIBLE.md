# Ansible

## Lab 5

### Without plugin

1. 50 last lines of *ansible-playbook* command

    ```plain

        ...(skipped)

        docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
        libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
        0 upgraded, 16 newly installed, 0 to remove and 36 not upgraded.
        changed: [vm1]

        TASK [docker : Install docker-compose plugin.] ******************************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Install docker-compose-plugin (with downgrade option).] ******************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Ensure /etc/docker/ directory exists.] ***********************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Ensure Docker is started and enabled at boot.] ***************************************************************************************************************************
        ok: [vm1]

        TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************************

        RUNNING HANDLER [docker : restart docker] ***********************************************************************************************************************************************
        changed: [vm1]

        TASK [docker : include_tasks] ***********************************************************************************************************************************************************
        included: /home/danila/Study/devops_labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

        TASK [docker : Check current docker-compose version.] ***********************************************************************************************************************************
        ok: [vm1]

        TASK [docker : set_fact] ****************************************************************************************************************************************************************
        ok: [vm1]

        TASK [docker : Delete existing docker-compose version if it's different.] ***************************************************************************************************************
        ok: [vm1]

        TASK [docker : Install Docker Compose (if configured).] *********************************************************************************************************************************
        changed: [vm1]

        TASK [docker : Get docker group info using getent.] *************************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Check if there are any users to add to the docker group.] ****************************************************************************************************************

        TASK [docker : include_tasks] ***********************************************************************************************************************************************************
        skipping: [vm1]

        PLAY RECAP ******************************************************************************************************************************************************************************
        vm1                        : ok=16   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0 
    ```

2. Output of *ansible-inventory* command

    ```plain
        {
            "_meta": {
                "hostvars": {
                    "vm1": {
                        "ansible_host": "51.250.79.82",
                        "ansible_user": "ubuntu"
                    }
                }
            },
            "all": {
                "children": [
                    "ungrouped",
                    "vms"
                ]
            },
            "vms": {
                "hosts": [
                    "vm1"
                ]
            }
        }
    ```

### With plugin

1. 50 last lines of *ansible-playbook* command

    ```plain

        ...(skipped)
        
        docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
        libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
        0 upgraded, 16 newly installed, 0 to remove and 36 not upgraded.
        changed: [terraform1]

        TASK [docker : Install docker-compose plugin.] *********************************
        skipping: [terraform1]

        TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
        skipping: [terraform1]

        TASK [docker : Ensure /etc/docker/ directory exists.] **************************
        skipping: [terraform1]

        TASK [docker : Configure Docker daemon options.] *******************************
        skipping: [terraform1]

        TASK [docker : Ensure Docker is started and enabled at boot.] ******************
        ok: [terraform1]

        TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

        RUNNING HANDLER [docker : restart docker] **************************************
        changed: [terraform1]

        TASK [docker : include_tasks] **************************************************
        included: /home/danila/Study/devops_labs/ansible/roles/docker/tasks/docker-compose.yml for terraform1

        TASK [docker : Check current docker-compose version.] **************************
        ok: [terraform1]

        TASK [docker : set_fact] *******************************************************
        ok: [terraform1]

        TASK [docker : Delete existing docker-compose version if it's different.] ******
        ok: [terraform1]

        TASK [docker : Install Docker Compose (if configured).] ************************
        changed: [terraform1]

        TASK [docker : Get docker group info using getent.] ****************************
        skipping: [terraform1]

        TASK [docker : Check if there are any users to add to the docker group.] *******

        TASK [docker : include_tasks] **************************************************
        skipping: [terraform1]

        PLAY RECAP *********************************************************************
        terraform1                 : ok=16   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0  
    ```

2. Output of *ansible-inventory* command

    ```plain
        {
            "_meta": {
                "hostvars": {
                    "terraform1": {
                        "ansible_host": "51.250.71.17"
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

## Lab 6

1. 50 last lines of the output of the the deployment command

    ```plain

        ...(skipped)

        PLAY [Prepare docker] *********************************************************************************************************************************************

        TASK [Gathering Facts] ********************************************************************************************************************************************
        ok: [terraform1]

        TASK [docker : Load OS-specific vars.] ****************************************************************************************************************************
        ok: [terraform1]

        TASK [docker : include_tasks] *************************************************************************************************************************************
        included: /home/danila/Study/devops_labs/ansible/roles/docker/tasks/setup-Debian.yml for terraform1

        TASK [docker : Ensure old versions of Docker are not installed.] **************************************************************************************************
        ok: [terraform1]

        TASK [docker : Ensure dependencies are installed.] ****************************************************************************************************************
        ok: [terraform1]

        TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***********************************************************
        skipping: [terraform1]

        TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ********************************************************************************
        ok: [terraform1]

        TASK [docker : Add Docker apt key.] *******************************************************************************************************************************
        ok: [terraform1]

        TASK [docker : Ensure curl is present (on older systems without SNI).] ********************************************************************************************
        skipping: [terraform1]

        TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ***********************************************************************************
        skipping: [terraform1]

        TASK [docker : Add Docker repository.] ****************************************************************************************************************************
        ok: [terraform1]

        TASK [docker : Install Docker packages.] **************************************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Install Docker packages (with downgrade option).] **************************************************************************************************
        ok: [terraform1]

        TASK [docker : Install docker-compose plugin.] ********************************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Install docker-compose-plugin (with downgrade option).] ********************************************************************************************
        skipping: [terraform1]

        TASK [docker : Ensure /etc/docker/ directory exists.] *************************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Configure Docker daemon options.] ******************************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Ensure Docker is started and enabled at boot.] *****************************************************************************************************
        ok: [terraform1]

        TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] *************************************************************************************

        TASK [docker : include_tasks] *************************************************************************************************************************************
        included: /home/danila/Study/devops_labs/ansible/roles/docker/tasks/docker-compose.yml for terraform1

        TASK [docker : Check current docker-compose version.] *************************************************************************************************************
        ok: [terraform1]

        TASK [docker : set_fact] ******************************************************************************************************************************************
        ok: [terraform1]

        TASK [docker : Delete existing docker-compose version if it's different.] *****************************************************************************************
        skipping: [terraform1]

        TASK [docker : Install Docker Compose (if configured).] ***********************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Get docker group info using getent.] ***************************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************************

        TASK [docker : include_tasks] *************************************************************************************************************************************
        skipping: [terraform1]

        TASK [web_app : Install Python] ***********************************************************************************************************************************
        ok: [terraform1]

        TASK [web_app : Install PIP] **************************************************************************************************************************************
        The following additional packages will be installed:
        binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-9
        dpkg-dev fakeroot g++ g++-9 gcc gcc-9 gcc-9-base libalgorithm-diff-perl
        libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan5 libatomic1
        libbinutils libc-dev-bin libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0
        libctf0 libdpkg-perl libexpat1-dev libfakeroot libfile-fcntllock-perl
        libgcc-9-dev libgomp1 libisl22 libitm1 liblsan0 libmpc3 libmpfr6
        libpython3-dev libpython3.8-dev libquadmath0 libstdc++-9-dev libtsan0
        libubsan1 linux-libc-dev make manpages-dev python-pip-whl python3-dev
        python3-wheel python3.8-dev zlib1g zlib1g-dev
        Suggested packages:
        binutils-doc cpp-doc gcc-9-locales debian-keyring g++-multilib
        g++-9-multilib gcc-9-doc gcc-multilib autoconf automake libtool flex bison
        gdb gcc-doc gcc-9-multilib glibc-doc bzr libstdc++-9-doc make-doc
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
        zlib1g
        1 upgraded, 51 newly installed, 0 to remove and 38 not upgraded.
        changed: [terraform1]

        TASK [web_app : Install Docker sdk for python] ********************************************************************************************************************
        changed: [terraform1]

        TASK [web_app : Start Docker service] *****************************************************************************************************************************
        ok: [terraform1]

        TASK [web_app : Pull app docker image] ****************************************************************************************************************************
        changed: [terraform1]

        TASK [web_app : Run docker container] *****************************************************************************************************************************
        --- before
        +++ after
        @@ -1,4 +1,4 @@
        {
        -    "exists": false,
        -    "running": false
        +    "exists": true,
        +    "running": true
        }

        changed: [terraform1]

        PLAY RECAP ********************************************************************************************************************************************************
        terraform1                 : ok=19   changed=4    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   

    ```

2. 50 last lines after additions to configs, required in the remaining part of main task

    ```plain

        ...(skipped)

        TASK [docker : Install Docker Compose (if configured).] ***********************************************************************************************************
        changed: [terraform1]

        TASK [docker : Get docker group info using getent.] ***************************************************************************************************************
        skipping: [terraform1]

        TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************************

        TASK [docker : include_tasks] *************************************************************************************************************************************
        skipping: [terraform1]

        TASK [web_app : Wipe app] *****************************************************************************************************************************************
        skipping: [terraform1]

        TASK [web_app : Start Docker service] *****************************************************************************************************************************
        ok: [terraform1]

        TASK [web_app : Create app directory] *****************************************************************************************************************************
        --- before
        +++ after
        @@ -1,4 +1,4 @@
        {
            "path": "/opt/python_kremlin_chimes",
        -    "state": "absent"
        +    "state": "directory"
        }

        changed: [terraform1]

        TASK [web_app : Template a docker file] ***************************************************************************************************************************
        --- before
        +++ after: /home/danila/.ansible/tmp/ansible-local-52204hyg4ii3b/tmp03m7gz42/docker-compose.yml.j2
        @@ -0,0 +1,9 @@
        +version: "3.9"
        +
        +services:
        +  python_kremlin_chimes:
        +    image: danmory/python_kremlin_chimes:latest
        +    container_name: python_kremlin_chimes
        +    ports:
        +      - "80:8000"
        +    restart: always

        changed: [terraform1]

        TASK [web_app : Start all services] *******************************************************************************************************************************
        changed: [terraform1]

        PLAY RECAP ********************************************************************************************************************************************************
        terraform1                 : ok=23   changed=11   unreachable=0    failed=0    skipped=12   rescued=0    ignored=0     
    ```
