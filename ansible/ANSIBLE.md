# Ansible
## ansible-playbook ansible-playbook -i ./inventory/inventory.yaml ./playbooks/dev/main.yml --diff
```
user@DESKTOP-L4BD1JV:/mnt/c/Users/User/Documents/Python Projects/devops/ansible$ ansible-playbook -i ./inventory/inventory.yaml ./playbooks/dev/main.yml --diff
[WARNING]: Ansible is being run in a world writable directory (/mnt/c/Users/User/Documents/Python Projects/devops/ansible), ignoring it as
an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-        
writable-dir

PLAY [Prepare docker] ***********************************************************************************************************************
TASK [Gathering Facts] **********************************************************************************************************************Enter passphrase for key '/mnt/c/Users/User/.ssh/devopskey': 
ok: [VM1]

TASK [docker : Load OS-specific vars.] ******************************************************************************************************ok: [VM1]

TASK [docker : include_tasks] ***************************************************************************************************************skipping: [VM1]

TASK [docker : include_tasks] ***************************************************************************************************************included: /mnt/c/Users/User/Documents/Python Projects/devops/ansible/roles/docker/tasks/setup-Debian.yml for VM1

TASK [docker : Ensure old versions of Docker are not installed.] ****************************************************************************ok: [VM1]

TASK [docker : Ensure dependencies are installed.] ******************************************************************************************ok: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *************************************The following NEW packages will be installed:
  gnupg2
0 upgraded, 1 newly installed, 0 to remove and 2 not upgraded.
changed: [VM1]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] **********************************************************skipping: [VM1]

TASK [docker : Add Docker apt key.] *********************************************************************************************************changed: [VM1]

TASK [docker : Ensure curl is present (on older systems without SNI).] **********************************************************************skipping: [VM1]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] *************************************************************skipping: [VM1]

TASK [docker : Add Docker repository.] ******************************************************************************************************--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_debian.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable

changed: [VM1]

TASK [docker : Install Docker packages.] ****************************************************************************************************skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] ****************************************************************************The following additional packages will be installed:
  dbus dbus-user-session docker-scan-plugin git git-man iptables
  libcurl3-gnutls libdbus-1-3 liberror-perl libip6tc2 libltdl7
  libnetfilter-conntrack3 libnfnetlink0 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  firewalld
The following NEW packages will be installed:
  containerd.io dbus-user-session docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-scan-plugin git git-man iptables
  libcurl3-gnutls liberror-perl libip6tc2 libltdl7 libnetfilter-conntrack3
  libnfnetlink0 libslirp0 pigz slirp4netns
The following packages will be upgraded:
  dbus libdbus-1-3
2 upgraded, 18 newly installed, 0 to remove and 4 not upgraded.
changed: [VM1]

TASK [docker : Install docker-compose plugin.] **********************************************************************************************skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] **********************************************************************skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ***************************************************************************************skipping: [VM1]

TASK [docker : Configure Docker daemon options.] ********************************************************************************************skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] *******************************************************************************ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***************************************************************
RUNNING HANDLER [docker : restart docker] ***************************************************************************************************changed: [VM1]

TASK [docker : include_tasks] ***************************************************************************************************************included: /mnt/c/Users/User/Documents/Python Projects/devops/ansible/roles/docker/tasks/docker-compose.yml for VM1

TASK [docker : Check current docker-compose version.] ***************************************************************************************ok: [VM1]

TASK [docker : set_fact] ********************************************************************************************************************ok: [VM1]

TASK [docker : Delete existing docker-compose version if it's different.] *******************************************************************ok: [VM1]

TASK [docker : Install Docker Compose (if configured).] *************************************************************************************changed: [VM1]

TASK [docker : Get docker group info using getent.] *****************************************************************************************skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] ********************************************************************
TASK [docker : include_tasks] ***************************************************************************************************************skipping: [VM1]

PLAY RECAP **********************************************************************************************************************************VM1                        : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

## ansible-inventory -i ./ansible/inventory/inventory.yaml --list

```
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
                "ansible_host": "84.201.143.205",
                "ansible_ssh_private_key_file": "/mnt/c/Users/User/.ssh/devopskey",
                "ansible_user": "user"
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
user@DESKTOP-L4BD1JV:/mnt/c/Users/User/Documents/Python Projects/devops$ 
```