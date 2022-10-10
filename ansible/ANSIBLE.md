# Ansible
## `ansible-playbook ./playbooks/dev/main.yaml --diff`
```
alex@alex-VirtualBox:~/devprojects/devops/ansible$ ansible-playbook ./playbooks/dev/main.yaml --diff

PLAY [Prepare docker] ****************************************************************************

TASK [Gathering Facts] ***************************************************************************
ok: [VM1]

TASK [docker : Load OS-specific vars.] ***********************************************************
fatal: [VM1]: FAILED! => {"msg": "No file was found when using first_found."}

PLAY RECAP ***************************************************************************************
VM1                        : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   

alex@alex-VirtualBox:~/devprojects/devops/ansible$ ansible-playbook ./playbooks/dev/main.yaml --diff

PLAY [Prepare docker] ****************************************************************************

TASK [Gathering Facts] ***************************************************************************
ok: [VM1]

TASK [docker : Load OS-specific vars.] ***********************************************************
fatal: [VM1]: FAILED! => {"msg": "No file was found when using first_found."}

PLAY RECAP ***************************************************************************************
VM1                        : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   

alex@alex-VirtualBox:~/devprojects/devops/ansible$ ansible-playbook ./playbooks/dev/main.yaml --diff

PLAY [Prepare docker] ****************************************************************************

TASK [Gathering Facts] ***************************************************************************
ok: [VM1]

TASK [docker : Load OS-specific vars.] ***********************************************************
ok: [VM1]

TASK [docker : include_tasks] ********************************************************************
included: /home/alex/devprojects/devops/ansible/roles/docker/tasks/setup-Debian.yml for VM1

TASK [docker : Ensure old versions of Docker are not installed.] *********************************
ok: [VM1]

TASK [docker : Ensure dependencies are installed.] ***********************************************
ok: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
The following additional packages will be installed:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm libassuan0 libksba8 libnpth0 pinentry-curses
Suggested packages:
  dbus-user-session pinentry-gnome3 tor parcimonie xloadimage scdaemon
  pinentry-doc
The following NEW packages will be installed:
  dirmngr gnupg gnupg-l10n gnupg-utils gnupg2 gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm libassuan0 libksba8 libnpth0 pinentry-curses
0 upgraded, 15 newly installed, 0 to remove and 1 not upgraded.
changed: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***************
skipping: [VM1]

TASK [docker : Add Docker apt key.] **************************************************************
changed: [VM1]

TASK [docker : Ensure curl is present (on older systems without SNI).] ***************************
skipping: [VM1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ******************
skipping: [VM1]

TASK [docker : Add Docker repository.] ***********************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_debian.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable

changed: [VM1]

TASK [docker : Install Docker packages.] *********************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] *********************************
The following additional packages will be installed:
  dbus-user-session docker-scan-plugin git git-man iptables libcurl3-gnutls
  liberror-perl libip6tc2 libltdl7 libnetfilter-conntrack3 libnfnetlink0
  libslirp0 patch pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  firewalld ed diffutils-doc
The following NEW packages will be installed:
  containerd.io dbus-user-session docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-scan-plugin git git-man iptables
  libcurl3-gnutls liberror-perl libip6tc2 libltdl7 libnetfilter-conntrack3
  libnfnetlink0 libslirp0 patch pigz slirp4netns
0 upgraded, 19 newly installed, 0 to remove and 2 not upgraded.
changed: [VM1]

TASK [docker : Install docker-compose plugin.] ***************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] *************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************

RUNNING HANDLER [docker : restart docker] ********************************************************
changed: [VM1]

TASK [docker : include_tasks] ********************************************************************
included: /home/alex/devprojects/devops/ansible/roles/docker/tasks/docker-compose.yml for VM1

TASK [docker : Check current docker-compose version.] ********************************************
ok: [VM1]

TASK [docker : set_fact] *************************************************************************
ok: [VM1]

TASK [docker : Delete existing docker-compose version if it's different.] ************************
ok: [VM1]

TASK [docker : Install Docker Compose (if configured).] ******************************************
changed: [VM1]

TASK [docker : Get docker group info using getent.] **********************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] *************************

TASK [docker : include_tasks] ********************************************************************
skipping: [VM1]

PLAY RECAP ***************************************************************************************
VM1                        : ok=16   changed=6    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0  
```
## `ansible-inventory -i inventory/inventory.yaml --list`
```
alex@alex-VirtualBox:~/devprojects/devops/ansible$ ansible-inventory -i inventory/inventory.yaml --list
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
                "ansible_host": "51.250.91.238",
                "ansible_ssh_private_key_file": "~/.ssh/id_rsa",
                "ansible_user": "alexdesta"
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
## Deploy moscow_time container
```
PLAY [Prepare docker] ******************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [VM1]

TASK [docker : Load OS-specific vars.] *************************************************************************************
ok: [VM1]

TASK [docker : include_tasks] **********************************************************************************************
included: /home/alex/devprojects/devops/ansible/roles/docker/tasks/setup-Debian.yml for VM1

TASK [docker : Ensure old versions of Docker are not installed.] ***********************************************************
ok: [VM1]

TASK [docker : Ensure dependencies are installed.] *************************************************************************
ok: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ********************
ok: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *****************************************
skipping: [VM1]

TASK [docker : Add Docker apt key.] ****************************************************************************************
ok: [VM1]

TASK [docker : Ensure curl is present (on older systems without SNI).] *****************************************************
skipping: [VM1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ********************************************
skipping: [VM1]

TASK [docker : Add Docker repository.] *************************************************************************************
ok: [VM1]

TASK [docker : Install Docker packages.] ***********************************************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] ***********************************************************
ok: [VM1]

TASK [docker : Install python deps] ****************************************************************************************
ok: [VM1]

TASK [docker : Install docker sdk] *****************************************************************************************
ok: [VM1]

TASK [docker : install docker compose] *************************************************************************************
ok: [VM1]

TASK [docker : Install docker-compose plugin.] *****************************************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************
ok: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] **********************************************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] ***************************************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************

TASK [docker : include_tasks] **********************************************************************************************
included: /home/alex/devprojects/devops/ansible/roles/docker/tasks/docker-compose.yml for VM1

TASK [docker : Check current docker-compose version.] **********************************************************************
ok: [VM1]

TASK [docker : set_fact] ***************************************************************************************************
ok: [VM1]

TASK [docker : Delete existing docker-compose version if it's different.] **************************************************
skipping: [VM1]

TASK [docker : Install Docker Compose (if configured).] ********************************************************************
skipping: [VM1]

TASK [docker : Get docker group info using getent.] ************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] ***************************************************

TASK [docker : include_tasks] **********************************************************************************************
skipping: [VM1]

TASK [web_app : wipe base dir] *********************************************************************************************
skipping: [VM1]

TASK [web_app : create directory if not exist] *****************************************************************************
ok: [VM1]

TASK [web_app : template docker-compose] ***********************************************************************************
--- before: /root/web_app/docker-compose.yml
+++ after: /home/alex/.ansible/tmp/ansible-local-6619sy8sj8s9/tmpx5k9024l/docker-compose.yml.j2
@@ -1,7 +1,7 @@
 version: '2.0'
 services:
-    moscow_time:
+    moscow_time_ansible:
         image: "alexdestdev/moscow_time:latest"
-        container_name: moscow_time
+        container_name: moscow_time_ansible
         ports:
             - "5000:5000"

changed: [VM1]

TASK [web_app : Start deploy] **********************************************************************************************
changed: [VM1]

PLAY RECAP *****************************************************************************************************************
VM1                        : ok=20   changed=2    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0   
```
