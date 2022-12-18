# Ansible

## Install Ansible

Run this command to install the [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) package for the current user:

    ```bash
    python3 -m pip install --user ansible
    ```

We can check it by running:

    ```bash
    python3 -m pip show ansible
    ```
![Ansible](../images/ansible.png)

## Create an ansible role for docker

1. You can use a [docker role](https://github.com/geerlingguy/ansible-role-docker) from `ansible-galaxy` as template.

    ```bash
    ansible-galaxy install geerlingguy.docker
    ```  
    Sometimes it is installed in some different directory, so we need to move it manually.

1. I have creared a playbook file and provided the full path for the this predefined role in playbooks configuration (just the role by itself resolved in the error of the system not knowing it):

    ```bash
    roles: 
        - /home/kseniya/DevOps/ansible/roles/geerlingguy.docker
    ```

1. Start your VM. I have used Yandex service:
    ```bash
    cd terraform/yandex
    terraform init
    terraform fmt
    terraform validate
    terraform apply
    ```

1. Then I putted VM's information to `ansible/inventory/inventory.yml` file  
1. Run 'ansible-playbook <path_to your_playbook> --diff':

    If you got message like this:

    ```bash
    "E: Failed to fetch http://ru.archive.ubuntu.com/ubuntu/pool/universe/a/apt/apt-transport-https_2.4.7_all.deb  404  Not Found [IP: some_ip]"
    ```

    Connect to your VM via ssh and change mirrors in Ubuntu Server from regional to main:

    ```bash
        sudo nano /etc/apt/sources.list
        ```

    Change all `ru.archive.ubuntu.com/ubuntu` to `http://archive.ubuntu.com/ubuntu`

## Outputs

1. Playbook Run (Updated):

   ```sh
    ansible-playbook  /home/kseniya/DevOps/ansible/playbooks/dev/main.yaml -i /home/kseniya/DevOps/ansible/inventory --diff

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
    included: /Users/kseniya/Desktop/devops_forked/ansible/roles/docker/tasks/docker-compose.yml for yacloud-vm

    TASK [docker : Check current docker-compose version.] *******************************
    ok: [yacloud-vm]

    TASK [docker : set_fact] ************************************************************
    ok: [yacloud-vm]

    TASK [docker : Delete existing docker-compose version if it\'s different.] ***********
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

1. Output of 'ansible-inventory -i <name_of_your_inventory_file>.yaml --list' (Updated):

   ```sh
    {
        "_meta": {
            "hostvars": {
                "yacloud-vm": {
                    "ansible_become": true,
                    "ansible_host": "62.84.112.117",
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

1. [Set up dynamic inventory](https://github.com/rodion-goritskov/yacloud_compute) for the cloud by adding 'yacloud_compute.py' file to plugins using this 
