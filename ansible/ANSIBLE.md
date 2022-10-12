# Ansible

## Table of contents

- [Lab 5](#lab-5)
  - [Inventory description](#inventory)
  - [Playbook description](#playbook)
  - [Command outputs](#deployment-outputs)
    - [Playbook run](#run-playbook)
    - [Inventory list](#inventory-list)
  - [Bonus: dynamic inventory](#bonus-dynamic-inventory)
    - [Plugin installation](#plugin-installation)
    - [Inventory configuration](#inventory-configuration)
    - [Inventory test](#test-the-inventory)
    - [Playbook run](#playbook-run)
- [Lab 6](#lab-6)

## Lab 5

### Inventory

Simply using one of the VMs created with terraform in the previous lab.

It's IP is encrypted using `ansible-vault` in order to not expose it.

Fun fact about the encryption: Windows filesystem in WSL has 0777 permissions on all files by default, which causes Ansible to think that the password file is an executable. I solved it in the easiest way: turn the password file into an actual executable file, which is basically a Bash one-liner:

```sh
echo "<PASSWORD>"
```

### Playbook

#### Pre-steps

- Update `apt` cache
  
  This step appeared to be required for the newly created cloud VMs.

  The docker role used (see below) does not include the update_cache option by itself ([see the PR](https://github.com/geerlingguy/ansible-role-docker/pull/363))

#### Roles

- Install Docker

  As suggested in the lab, used the ready-to-go [Docker role](https://github.com/geerlingguy/ansible-role-docker)

### Deployment outputs

The machines were re-created before running commands to make the clean deployment from scratch.

#### Run playbook

##### The command to run

```sh
ansible-playbook --vault-id dev@vault_password.sh -i inventory/yandex_cloud.yml playbooks/dev/main.yml --diff
```

##### Output

Full:

<!-- markdownlint-disable MD033 -->

<details>
<summary>Click to show...</summary>

```diff
PLAY [vms] **************************************************************************************************

TASK [Gathering Facts] **************************************************************************************
The authenticity of host '84.201.176.213 (84.201.176.213)' can't be established.
ECDSA key fingerprint is SHA256:StBOYBefPlvficwzA/rB6r/dJ3RB6rsdI8XhJ831w1k.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [vm1]

TASK [Update apt cache] *************************************************************************************
changed: [vm1]

TASK [geerlingguy.docker : Load OS-specific vars.] **********************************************************
ok: [vm1]

TASK [geerlingguy.docker : include_tasks] *******************************************************************
skipping: [vm1]

TASK [geerlingguy.docker : include_tasks] *******************************************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for vm1

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ********************************
ok: [vm1]

TASK [geerlingguy.docker : Ensure dependencies are installed.] **********************************************
ok: [vm1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
The following additional packages will be installed:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
Suggested packages:
  dbus-user-session pinentry-gnome3 tor parcimonie xloadimage scdaemon
The following NEW packages will be installed:
  gnupg2
The following packages will be upgraded:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
11 upgraded, 1 newly installed, 0 to remove and 46 not upgraded.
changed: [vm1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] **************
skipping: [vm1]

TASK [geerlingguy.docker : Add Docker apt key.] *************************************************************
changed: [vm1]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] **************************
skipping: [vm1]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] *****************
skipping: [vm1]

TASK [geerlingguy.docker : Add Docker repository.] **********************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

changed: [vm1]

TASK [geerlingguy.docker : Install Docker packages.] ********************************************************
skipping: [vm1]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ********************************
The following additional packages will be installed:
  dbus-user-session docker-scan-plugin git git-man libcurl3-gnutls
  liberror-perl libgdbm-compat4 libltdl7 libperl5.26 patch perl
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
0 upgraded, 17 newly installed, 0 to remove and 46 not upgraded.
changed: [vm1]

TASK [geerlingguy.docker : Install docker-compose plugin.] **************************************************
skipping: [vm1]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] **************************
skipping: [vm1]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *******************************************
skipping: [vm1]

TASK [geerlingguy.docker : Configure Docker daemon options.] ************************************************
skipping: [vm1]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ***********************************
ok: [vm1]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *******************

RUNNING HANDLER [geerlingguy.docker : restart docker] *******************************************************
changed: [vm1]

TASK [geerlingguy.docker : include_tasks] *******************************************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for vm1

TASK [geerlingguy.docker : Check current docker-compose version.] *******************************************
ok: [vm1]

TASK [geerlingguy.docker : set_fact] ************************************************************************
ok: [vm1]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***********************
ok: [vm1]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] *****************************************
changed: [vm1]

TASK [geerlingguy.docker : Get docker group info using getent.] *********************************************
skipping: [vm1]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ************************

TASK [geerlingguy.docker : include_tasks] *******************************************************************
skipping: [vm1]

PLAY RECAP **************************************************************************************************
vm1                        : ok=17   changed=7    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

</details>

Recap only:

```sh
PLAY RECAP **************************************************************************************************
vm1                        : ok=17   changed=7    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

#### Inventory list

##### Command

```sh
ansible-inventory -i inventory/yandex_cloud.yml --list
```

##### Command output

```json
{
    "_meta": {
        "hostvars": {
            "vm1": {
                "ansible_host": {
                    "__ansible_vault": "$ANSIBLE_VAULT;1.2;AES256;dev\n31666466366564383138323464386333666138313462333735623566333336613838333234386138\n6238663337656264333865656137333038326661393539640a323034626637386139396530366166\n31326463386536353435636162373164373866643066613934313934646164653166366461366634\n3836373166383661630a353966373932623766376530613732396236633439343637366333353666\n6662\n"
                },
                "ansible_ssh_private_key_file": "/tmp/vm1",
                "ansible_user": "amogus"
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

### Bonus: dynamic inventory

#### Plugin installation

As suggested in the lab, I'm using [a Yandex Cloud plugin](https://github.com/rodion-goritskov/yacloud_compute).

I've run the following commands to install the plugin, as specified [in this guide](https://www.redhat.com/sysadmin/ansible-plugin-inventory-files).

```bash
mkdir -p $HOME/.ansible/plugins/inventory
wget -O $HOME/.ansible/plugins/inventory/yacloud_compute.py "https://raw.githubusercontent.com/rodion-goritskov/yacloud_compute/master/yacloud_compute.py"
```

It also required to install `yandexcloud` package:

```bash
pip install yandexcloud
```

#### Inventory configuration

A file [`yacloud_compute.yml`](./inventory/yacloud_compute.yml) has been created, which uses the plugin and contains configuration options for it.

Such file name is a requirement of the plugin — it forces the inventory file to have a name ending with `yacloud_compute.{yml,yaml}`

##### Options

The only required parameter for the plugin is `yacloud_token`, which was added in an encrypted form using `ansible-vault`.

I've also added `yacloud_group_label` option to enable grouping the VMs according to the labels they have:

```yaml
yacloud_group_label: ansible_group
```

This allowed me to:

- Exclude the VMs without `ansible_group` from the list of hosts used. These would be still available in the inventory, but in a separate `yacloud` group.
- Add VMs to the `vms` group defined in the playbook.

##### Using `group_vars`

There is one more important thing: SSH connection parameters.

The trouble is, you can't define the group/host variables in the inventory file — these would be simply ignored by both Ansible and the inventory plugin (the latter could handle them, but it is not implemented by the plugin developers).

To handle this, I've created `inventory/group_vars` directory that would apply SSH connection variables on the group name basis. This could be done on the host name basis, but let's keep it simple and assume that all VMs in a group have the same user configuration.

###### [`./inventory/group_vars/vms.yml`](./inventory/group_vars/vms.yml) content

```yaml
ansible_user: amogus
ansible_ssh_private_key_file: /tmp/vm1
```

#### Test the inventory

Again, the VM for tests was created using `terraform`, as in the previous lab. But I've had to add the label to the VM:

```terraform
labels = {
  ansible_group = "vms"
}
```

##### `ansible-inventory` output

###### Command to run

```bash
ansible-inventory --vault-id dev@vault_password.sh -i inventory/yacloud_compute.yml --list
```

###### Output (redacted a bit)

```json
{
    "_meta": {
        "hostvars": {
            "terraform1": {
                "ansible_host": "<REDACTED>",
                "ansible_ssh_private_key_file": "/tmp/vm1",
                "ansible_user": "amogus"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yacloud"
        ]
    },
    "vms": {
        "hosts": [
            "terraform1"
        ]
    }
}
```

Boom, we have our host here. I've edited out the IP, but believe me, it's all fine there.

##### Playbook run

That's what we're here for, right?

###### The command

```sh
ansible-playbook \
  --vault-id dev@vault_password.sh \
  -i inventory/yacloud_compute.yml \
  playbooks/dev/main.yml \
  --diff
```

###### The output

Full:

<!-- markdownlint-disable MD033 -->

<details>
<summary>Click to show...</summary>

```diff
PLAY [vms] ***************************************************************************************************************************************************************************
TASK [Gathering Facts] ***************************************************************************************************************************************************************
ok: [terraform1]

TASK [Update apt cache] **************************************************************************************************************************************************************
changed: [terraform1]

TASK [geerlingguy.docker : Load OS-specific vars.] ***********************************************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for terraform1

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *********************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure dependencies are installed.] ***********************************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ******************************************************************
The following additional packages will be installed:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
Suggested packages:
  dbus-user-session pinentry-gnome3 tor parcimonie xloadimage scdaemon
The following NEW packages will be installed:
  gnupg2
The following packages will be upgraded:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
11 upgraded, 1 newly installed, 0 to remove and 46 not upgraded.
changed: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key.] **************************************************************************************************************************************
changed: [terraform1]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ******************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker repository.] ***********************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

changed: [terraform1]

TASK [geerlingguy.docker : Install Docker packages.] *********************************************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *********************************************************************************************************
The following additional packages will be installed:
  dbus-user-session docker-scan-plugin git git-man libcurl3-gnutls
  liberror-perl libgdbm-compat4 libltdl7 libperl5.26 patch perl
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
0 upgraded, 17 newly installed, 0 to remove and 46 not upgraded.
changed: [terraform1]

TASK [geerlingguy.docker : Install docker-compose plugin.] ***************************************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Configure Docker daemon options.] *************************************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************
RUNNING HANDLER [geerlingguy.docker : restart docker] ********************************************************************************************************************************
changed: [terraform1]

TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for terraform1

TASK [geerlingguy.docker : Check current docker-compose version.] ********************************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : set_fact] *************************************************************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ************************************************************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ******************************************************************************************************************
changed: [terraform1]

TASK [geerlingguy.docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [terraform1]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] *************************************************************************************************
TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************
skipping: [terraform1]

PLAY RECAP ***************************************************************************************************************************************************************************
terraform1                 : ok=17   changed=7    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```

</details>

Recap only:

```sh
PLAY RECAP ***************************************************************************************************************************************************************************
terraform1                 : ok=17   changed=7    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

## Lab 6

### Role info

A newly created role [`deploy_docker`](./roles/deploy_docker/) contains [its own README](./roles/deploy_docker/README.md) — check it out to see the capabilities of the role.

### `app_python` test

Command:

```sh
ansible-playbook \
  --vault-id dev@vault_password.sh \
  -i inventory/yacloud_compute.yml \
  playbooks/dev/app_python/main.yml \
  --diff
```

Output:

<details>
<summary>Click to show...</summary>

```diff
PLAY [vms] *****************************************************************************
TASK [Gathering Facts] *****************************************************************
The authenticity of host '84.201.162.179 (84.201.162.179)' can't be established.
ECDSA key fingerprint is SHA256:LhJYN6L5hsm03buR+Ml8qXWfdp4JfGZvWL9IAjOnb4o.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [terraform1]

TASK [Update apt cache] ****************************************************************
changed: [terraform1]

TASK [geerlingguy.docker : Load OS-specific vars.] *************************************
ok: [terraform1]

TASK [geerlingguy.docker : include_tasks] **********************************************
skipping: [terraform1]

TASK [geerlingguy.docker : include_tasks] **********************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for terraform1

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ***********
ok: [terraform1]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *************************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
The following additional packages will be installed:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
Suggested packages:
  dbus-user-session pinentry-gnome3 tor parcimonie xloadimage scdaemon
The following NEW packages will be installed:
  gnupg2
The following packages will be upgraded:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
11 upgraded, 1 newly installed, 0 to remove and 46 not upgraded.
changed: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key.] ****************************************
changed: [terraform1]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *****skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ***
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker repository.] *************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

changed: [terraform1]

TASK [geerlingguy.docker : Install Docker packages.] ***********************************
skipping: [terraform1]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***********
The following additional packages will be installed:
  dbus-user-session docker-scan-plugin git git-man libcurl3-gnutls
  liberror-perl libgdbm-compat4 libltdl7 libperl5.26 patch perl
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
0 upgraded, 17 newly installed, 0 to remove and 46 not upgraded.
changed: [terraform1]

TASK [geerlingguy.docker : Install docker-compose plugin.] *****************************
skipping: [terraform1]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *****skipping: [terraform1]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **********************
skipping: [terraform1]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***************************
skipping: [terraform1]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

RUNNING HANDLER [geerlingguy.docker : restart docker] **********************************
changed: [terraform1]

TASK [geerlingguy.docker : include_tasks] **********************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for terraform1

TASK [geerlingguy.docker : Check current docker-compose version.] **********************
ok: [terraform1]

TASK [geerlingguy.docker : set_fact] ***************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***
ok: [terraform1]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ********************
changed: [terraform1]

TASK [geerlingguy.docker : Get docker group info using getent.] ************************
ok: [terraform1]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***ok: [terraform1] => (item=amogus)

TASK [geerlingguy.docker : include_tasks] **********************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/docker-users.yml for terraform1

TASK [geerlingguy.docker : Ensure docker users are added to the docker group.] *********changed: [terraform1] => (item=amogus)

TASK [geerlingguy.docker : Reset ssh connection to apply user changes.] ****************
TASK [geerlingguy.pip : Ensure Pip is installed.] **************************************
The following additional packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-7
  dh-python dpkg-dev fakeroot g++ g++-7 gcc gcc-7 gcc-7-base
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan4 libatomic1 libbinutils libc-dev-bin libc6-dev libcc1-0 libcilkrts5
  libdpkg-perl libexpat1-dev libfakeroot libfile-fcntllock-perl libgcc-7-dev
  libgomp1 libisl19 libitm1 liblsan0 libmpc3 libmpfr6 libmpx2 libpython3-dev
  libpython3.6 libpython3.6-dev libpython3.6-minimal libpython3.6-stdlib
  libquadmath0 libstdc++-7-dev libtsan0 libubsan0 linux-libc-dev make
  manpages-dev python-pip-whl python3-crypto python3-dev python3-distutils
  python3-keyring python3-keyrings.alt python3-lib2to3 python3-secretstorage
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
  libpython3.6 libpython3.6-minimal libpython3.6-stdlib python3.6
  python3.6-minimal
5 upgraded, 58 newly installed, 0 to remove and 41 not upgraded.
changed: [terraform1]

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] ********************
changed: [terraform1] => (item={'name': 'pip', 'extra_args': '--upgrade'})
changed: [terraform1] => (item={'name': 'docker'})
changed: [terraform1] => (item={'name': 'docker-compose'})

TASK [deploy_docker : Make sure destination dir exists] ********************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0775",
+    "mode": "0755",
     "path": "/home/amogus/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [terraform1]

TASK [deploy_docker : Create a docker-compose.yml file] ********************************
--- before
+++ after: /home/dzmnd/.ansible/tmp/ansible-local-12813lr9u5pdr/tmp1n4lzn1_/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+version: '3.9'
+
+services:
+  web_app:
+    image: ntdesmond/iu-devops-python
+    restart: always
+    ports:
+      - "80:8000"
\ No newline at end of file

changed: [terraform1]

TASK [deploy_docker : Run the app using docker-compose] ********************************
changed: [terraform1]

PLAY RECAP *****************************************************************************
terraform1                 : ok=26   changed=13   unreachable=0    failed=0    skipped=9    rescued=0    ignored=0
```

</details>

Recap only:

```sh
PLAY RECAP *****************************************************************************
terraform1                 : ok=26   changed=13   unreachable=0    failed=0    skipped=9    rescued=0    ignored=0
```

### `app_typescript` test

Command:

```sh
ansible-playbook \
  --vault-id dev@vault_password.sh \
  -i inventory/yacloud_compute.yml \
  -e "web_app_full_wipe=true" \
  playbooks/dev/app_typescript/main.yml \
  --diff
```

Note: using `web_app_full_wipe=true` above, testing the wipe feature.

Output:

<details>
<summary>Click to show...</summary>

```diff
PLAY [vms] *****************************************************************************
TASK [Gathering Facts] *****************************************************************
ok: [terraform1]

TASK [Update apt cache] ****************************************************************
changed: [terraform1]

TASK [geerlingguy.docker : Load OS-specific vars.] *************************************
ok: [terraform1]

TASK [geerlingguy.docker : include_tasks] **********************************************
skipping: [terraform1]

TASK [geerlingguy.docker : include_tasks] **********************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for terraform1

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ***********
ok: [terraform1]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *************************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
ok: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key.] ****************************************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *****skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ***
skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker repository.] *************************************
ok: [terraform1]

TASK [geerlingguy.docker : Install Docker packages.] ***********************************
skipping: [terraform1]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***********
ok: [terraform1]

TASK [geerlingguy.docker : Install docker-compose plugin.] *****************************
skipping: [terraform1]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *****skipping: [terraform1]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **********************
skipping: [terraform1]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***************************
skipping: [terraform1]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **************
ok: [terraform1]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [geerlingguy.docker : include_tasks] **********************************************
included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for terraform1

TASK [geerlingguy.docker : Check current docker-compose version.] **********************
ok: [terraform1]

TASK [geerlingguy.docker : set_fact] ***************************************************
ok: [terraform1]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***
skipping: [terraform1]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ********************
skipping: [terraform1]

TASK [geerlingguy.docker : Get docker group info using getent.] ************************
ok: [terraform1]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***skipping: [terraform1] => (item=amogus) 

TASK [geerlingguy.docker : include_tasks] **********************************************
skipping: [terraform1]

TASK [geerlingguy.pip : Ensure Pip is installed.] **************************************
ok: [terraform1]

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] ********************
ok: [terraform1] => (item={'name': 'pip', 'extra_args': '--upgrade'})
ok: [terraform1] => (item={'name': 'docker'})
ok: [terraform1] => (item={'name': 'docker-compose'})

TASK [deploy_docker : include_tasks] ***************************************************
included: /mnt/d/Code/gits/iu-devops-labs/ansible/roles/deploy_docker/tasks/0-wipe.yml for terraform1

TASK [deploy_docker : Stop docker-compose] *********************************************
changed: [terraform1]

TASK [deploy_docker : Remove the application directory] ********************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "/home/amogus/web_app",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/home/amogus/web_app/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [terraform1]

TASK [deploy_docker : Make sure destination dir exists] ********************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0775",
+    "mode": "0755",
     "path": "/home/amogus/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [terraform1]

TASK [deploy_docker : Create a docker-compose.yml file] ********************************
--- before
+++ after: /home/dzmnd/.ansible/tmp/ansible-local-15545iaceh8vy/tmpuohjq0tx/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+version: '3.9'
+
+services:
+  web_app:
+    image: ntdesmond/iu-devops-ts
+    restart: always
+    ports:
+      - "80:3000"
\ No newline at end of file

changed: [terraform1]

TASK [deploy_docker : Run the app using docker-compose] ********************************
changed: [terraform1]

PLAY RECAP *****************************************************************************
terraform1                 : ok=23   changed=6    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```

</details>

Recap only:

```sh
PLAY RECAP *****************************************************************************
terraform1                 : ok=23   changed=6    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```
