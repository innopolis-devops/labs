# Ansible

## Table of contents

- [Inventory description](#inventory)
- [Playbook description](#playbook)
- [Command outputs](#inventory)
  - [Playbook run](#run-playbook)
  - [Inventory list](#inventory-list)
- [Bonus: dynamic inventory](#bonus-dynamic-inventory)
  - [Plugin installation](#plugin-installation)
  - [Inventory configuration](#inventory-configuration)
  - [Inventory test](#test-the-inventory)
  - [Playbook run](#playbook-run)

## Inventory

Simply using one of the VMs created with terraform in the previous lab.

It's IP is encrypted using `ansible-vault` in order to not expose it.

Fun fact about the encryption: Windows filesystem in WSL has 0777 permissions on all files by default, which causes Ansible to think that the password file is an executable. I solved it in the easiest way: turn the password file into an actual executable file, which is basically a Bash one-liner:

```sh
echo "<PASSWORD>"
```

## Playbook

### Pre-steps

- Update `apt` cache
  
  This step appeared to be required for the newly created cloud VMs.

  The docker role used (see below) does not include the update_cache option by itself ([see the PR](https://github.com/geerlingguy/ansible-role-docker/pull/363))

### Roles

- Install Docker

  As suggested in the lab, used the ready-to-go [Docker role](https://github.com/geerlingguy/ansible-role-docker)

## Deployment outputs

The machines were re-created before running commands to make the clean deployment from scratch.

### Run playbook

#### The command to run

```sh
ansible-playbook --vault-id dev@vault_password.sh -i inventory/yandex_cloud.yml playbooks/dev/main.yml --diff
```

#### Output

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

### Inventory list

#### Command

```sh
ansible-inventory -i inventory/yandex_cloud.yml --list
```

#### Command output

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

## Bonus: dynamic inventory

### Plugin installation

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

### Inventory configuration

A file [`yacloud_compute.yml`](./inventory/yacloud_compute.yml) has been created, which uses the plugin and contains configuration options for it.

Such file name is a requirement of the plugin — it forces the inventory file to have a name ending with `yacloud_compute.{yml,yaml}`

#### Options

The only required parameter for the plugin is `yacloud_token`, which was added in an encrypted form using `ansible-vault`.

I've also added `yacloud_group_label` option to enable grouping the VMs according to the labels they have:

```yaml
yacloud_group_label: ansible_group
```

This allowed me to:

- Exclude the VMs without `ansible_group` from the list of hosts used. These would be still available in the inventory, but in a separate `yacloud` group.
- Add VMs to the `vms` group defined in the playbook.

#### Using `group_vars`

There is one more important thing: SSH connection parameters.

The trouble is, you can't define the group/host variables in the inventory file — these would be simply ignored by both Ansible and the inventory plugin (the latter could handle them, but it is not implemented by the plugin developers).

To handle this, I've created `inventory/group_vars` directory that would apply SSH connection variables on the group name basis. This could be done on the host name basis, but let's keep it simple and assume that all VMs in a group have the same user configuration.

##### [`./inventory/group_vars/vms.yml`](./inventory/group_vars/vms.yml) content

```yaml
ansible_user: amogus
ansible_ssh_private_key_file: /tmp/vm1
```

### Test the inventory

Again, the VM for tests was created using `terraform`, as in the previous lab. But I've had to add the label to the VM:

```terraform
labels = {
  ansible_group = "vms"
}
```

#### `ansible-inventory` output

##### Command to run

```bash
ansible-inventory --vault-id dev@vault_password.sh -i inventory/yacloud_compute.yml --list
```

##### Output (redacted a bit)

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

#### Playbook run

That's what we're here for, right?

##### The command

```sh
ansible-playbook \
  --vault-id dev@vault_password.sh \
  -i inventory/yacloud_compute.yml \
  playbooks/dev/main.yml \
  --diff
```

##### The output

Full:

<!-- markdownlint-disable MD033 -->

<details>
<summary>Click to show...</summary>

```diff
PLAY [vms] ***************************************************************************************************************************************************************************
TASK [Gathering Facts] ***************************************************************************************************************************************************************ok: [terraform1]

TASK [Update apt cache] **************************************************************************************************************************************************************changed: [terraform1]

TASK [geerlingguy.docker : Load OS-specific vars.] ***********************************************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for terraform1

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *********************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : Ensure dependencies are installed.] ***********************************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ******************************************************************The following additional packages will be installed:
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

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key.] **************************************************************************************************************************************changed: [terraform1]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ******************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Add Docker repository.] ***********************************************************************************************************************************--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

changed: [terraform1]

TASK [geerlingguy.docker : Install Docker packages.] *********************************************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *********************************************************************************************************The following additional packages will be installed:
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

TASK [geerlingguy.docker : Install docker-compose plugin.] ***************************************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Configure Docker daemon options.] *************************************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************
RUNNING HANDLER [geerlingguy.docker : restart docker] ********************************************************************************************************************************changed: [terraform1]

TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************included: /home/dzmnd/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for terraform1

TASK [geerlingguy.docker : Check current docker-compose version.] ********************************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : set_fact] *************************************************************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ************************************************************************************************ok: [terraform1]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ******************************************************************************************************************changed: [terraform1]

TASK [geerlingguy.docker : Get docker group info using getent.] **********************************************************************************************************************skipping: [terraform1]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] *************************************************************************************************
TASK [geerlingguy.docker : include_tasks] ********************************************************************************************************************************************skipping: [terraform1]

PLAY RECAP ***************************************************************************************************************************************************************************terraform1                 : ok=17   changed=7    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```

</details>

Recap only:

```sh
PLAY RECAP ***************************************************************************************************************************************************************************terraform1                 : ok=17   changed=7    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```
