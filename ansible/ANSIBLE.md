# Ansible

<details>
  <summary>Lab 5</summary>
  
## Install Ansible

1. Run this command to install the Ansible package for the current user:

    ```bash
    python3 -m pip install --user ansible
    ```

1. Check the version of the ansible package that has been installed:

    ```bash
    python3 -m pip show ansible
    ```

## Create an ansible role for docker

1. Install the package from `ansible-galaxy`:

    ```bash
    ansible-galaxy install geerlingguy.docker
    ```

1. Provide this predefined role in playbooks configuration:

    ```bash
    roles: 
        - geerlingguy.docker
    ```

1. Start your VM (in my case it provided with yandex, so I run `terraform/yandex`)

    ```bash
    cd terraform/yandex
    terraform init
    terraform apply
    ```

1. Then put your VM's IP to `ansible/inventory/main.yml` file:

    ```bash
        ansible_host: //here
        ```

1. Run 'ansible-playbook <path_to your_playbook> --diff':

    If you got message like this:

    ```bash
    "E: Failed to fetch http://ru.archive.ubuntu.com/ubuntu/pool/universe/a/apt/apt-transport-https_2.4.7_all.deb  404  Not Found [IP: 213.180.204.183 80]"
    ```

    Connect to your VM via ssh and change mirrors in Ubuntu Server from regional to main:

    ```bash
        sudo nano /etc/apt/sources.list
        ```

    Change all `ru.archive.ubuntu.com/ubuntu` to `http://archive.ubuntu.com/ubuntu`

## Outputs

1. Output of 'ansible-playbook <path_to your_playbook> --diff':

   ```sh
    The following additional packages will be installed:
    docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
    Suggested packages:
    aufs-tools cgroupfs-mount | cgroup-lite
    The following NEW packages will be installed:
    containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
    docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
    0 upgraded, 9 newly installed, 0 to remove and 32 not upgraded.
    changed: [yacloud-vm]

    TASK [geerlingguy.docker : Install docker-compose plugin.] ********************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ********************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Configure Docker daemon options.] ******************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] *****************************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *************************************************************

    RUNNING HANDLER [geerlingguy.docker : restart docker] *************************************************************************************************
    changed: [yacloud-vm]

    TASK [geerlingguy.docker : include_tasks] *************************************************************************************************************
    included: /Users/amina/Desktop/test/DevOps/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for yacloud-vm

    TASK [geerlingguy.docker : Check current docker-compose version.] *************************************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : set_fact] ******************************************************************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] *****************************************************************
    ok: [yacloud-vm]

    TASK [geerlingguy.docker : Install Docker Compose (if configured).] ***********************************************************************************
    changed: [yacloud-vm]

    TASK [geerlingguy.docker : Get docker group info using getent.] ***************************************************************************************
    skipping: [yacloud-vm]

    TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ******************************************************************

    TASK [geerlingguy.docker : include_tasks] *************************************************************************************************************
    skipping: [yacloud-vm]

    PLAY RECAP ********************************************************************************************************************************************
    yacloud-vm                 : ok=16   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
   ```

1. Output of 'ansible-inventory -i <name_of_your_inventory_file>.yaml --list':

   ```sh
    {
        "_meta": {
            "hostvars": {
                "yacloud-vm": {
                    "ansible_become": true,
                    "ansible_host": "51.250.28.83",
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
                "yacloud-vm"
            ]
        }
    }
   ```

## Yandex Cloud

1. Add 'yacloud_compute.py' file to plugins using this [Yandex Cloud](https://github.com/rodion-goritskov/yacloud_compute)

</details>

## Lab 6

## Output

1. Output of 'ansible-playbook <path_to your_playbook> --diff':

   ```sh
    TASK [docker : Add Docker repository.] **********************************************
    ok: [yacloud-vm]

    TASK [docker : Install Docker packages.] ********************************************
    skipping: [yacloud-vm]

    TASK [docker : Install Docker packages (with downgrade option).] ********************
    ok: [yacloud-vm]

    TASK [docker : Install python dependencies] *****************************************
    The following additional packages will be installed:
    build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
    fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base javascript-common
    libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
    libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0
    libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev libfakeroot
    libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgd3 libgomp1 libisl23
    libitm1 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc
    libjs-underscore liblsan0 libmpc3 libnsl-dev libpython3-dev
    libpython3-stdlib libpython3.10 libpython3.10-dev libpython3.10-minimal
    libpython3.10-stdlib libquadmath0 libstdc++-11-dev libtiff5 libtirpc-dev
    libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev lto-disabled-list make
    manpages-dev python3 python3-dev python3-distutils python3-lib2to3
    python3-minimal python3-wheel python3.10 python3.10-dev python3.10-minimal
    rpcsvc-proto zlib1g-dev
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
    libpython3-stdlib libpython3.10 libpython3.10-minimal libpython3.10-stdlib
    python3 python3-distutils python3-lib2to3 python3-minimal python3.10
    python3.10-minimal
    10 upgraded, 64 newly installed, 0 to remove and 25 not upgraded.
    changed: [yacloud-vm]

    TASK [docker : Install 'Docker SDK for Python'] *************************************
    changed: [yacloud-vm]

    TASK [docker : Install 'Docker Compose for Python'] *********************************
    changed: [yacloud-vm]

    TASK [docker : Install docker-compose plugin.] **************************************
    skipping: [yacloud-vm]

    TASK [docker : Install docker-compose-plugin (with downgrade option).] **************
    skipping: [yacloud-vm]

    TASK [docker : Ensure /etc/docker/ directory exists.] *******************************
    skipping: [yacloud-vm]

    TASK [docker : Configure Docker daemon options.] ************************************
    skipping: [yacloud-vm]

    TASK [docker : Ensure Docker is started and enabled at boot.] ***********************
    ok: [yacloud-vm]

    TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] *******

    TASK [docker : include_tasks] *******************************************************
    included: /Users/amina/Desktop/test/DevOps/ansible/roles/docker/tasks/docker-compose.yml for yacloud-vm

    TASK [docker : Check current docker-compose version.] *******************************
    ok: [yacloud-vm]

    TASK [docker : set_fact] ************************************************************
    ok: [yacloud-vm]

    TASK [docker : Delete existing docker-compose version if it's different.] ***********
    --- before
    +++ after
    @@ -1,4 +1,4 @@
    {
        "path": "/usr/local/bin/docker-compose",
    -    "state": "file"
    +    "state": "absent"
    }

    changed: [yacloud-vm]

    TASK [docker : Install Docker Compose (if configured).] *****************************
    changed: [yacloud-vm]

    TASK [docker : Get docker group info using getent.] *********************************
    skipping: [yacloud-vm]

    TASK [docker : Check if there are any users to add to the docker group.] ************

    TASK [docker : include_tasks] *******************************************************
    skipping: [yacloud-vm]

    TASK [web_app : Wipe the base dir] **************************************************
    skipping: [yacloud-vm]

    TASK [web_app : Create web_app directory] *******************************************
    ok: [yacloud-vm]

    TASK [web_app : Template the docker-compose.yml] ************************************
    ok: [yacloud-vm]

    TASK [web_app : Start web_app] ******************************************************
    changed: [yacloud-vm]

    PLAY RECAP **************************************************************************
    yacloud-vm                 : ok=20   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
   ```

1. Output of 'ansible-inventory -i <name_of_your_inventory_file>.yaml --list':

    ```sh
    {
        "_meta": {
            "hostvars": {
                "yacloud-vm": {
                    "ansible_become": true,
                    "ansible_host": "158.160.6.165",
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
                "yacloud-vm"
            ]
        }
    }

    ```
