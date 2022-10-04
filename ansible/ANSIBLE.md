## ansible part now!

###running ⬇
```sh
ansible-playbook -i ansible/inventory/yandex.yml ansible/playbooks/main.yaml --diff
```
### output:

<!-- markdownlint-disable MD033 -->

<details>
<summary>Full here</summary>

```diff
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

```
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

#### even dynamic inventory was implemented, ajda molodca!  👍👍👍