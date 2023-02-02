# ansible-playbook <path_to your_playbook> --diff

```
TASK [docker : Install Docker packages (with downgrade option).] *******************************************************
The following additional packages will be installed:
  dbus-user-session docker-buildx-plugin docker-compose-plugin
  docker-scan-plugin git git-man iptables libcurl3-gnutls liberror-perl
  libip6tc2 libltdl7 libnetfilter-conntrack3 libnfnetlink0 libslirp0 patch
  pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  firewalld ed diffutils-doc
The following NEW packages will be installed:
  containerd.io dbus-user-session docker-buildx-plugin docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-compose-plugin docker-scan-plugin git
  git-man iptables libcurl3-gnutls liberror-perl libip6tc2 libltdl7
  libnetfilter-conntrack3 libnfnetlink0 libslirp0 patch pigz slirp4netns
0 upgraded, 21 newly installed, 0 to remove and 1 not upgraded.
changed: [vm]

TASK [docker : Install docker-compose plugin.] *************************************************************************
skipping: [vm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************
skipping: [vm]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************
skipping: [vm]

TASK [docker : Configure Docker daemon options.] ***********************************************************************
skipping: [vm]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************
ok: [vm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************

RUNNING HANDLER [docker : restart docker] ******************************************************************************
changed: [vm]

TASK [docker : include_tasks] ******************************************************************************************
included: /mnt/e/projects/temp/ansible/roles/docker/tasks/docker-compose.yml for vm

TASK [docker : Check current docker-compose version.] ******************************************************************
ok: [vm]

TASK [docker : set_fact] ***********************************************************************************************
ok: [vm]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************
ok: [vm]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************
changed: [vm]

TASK [docker : Get docker group info using getent.] ********************************************************************
skipping: [vm]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************
skipping: [vm]

TASK [docker : include_tasks] ******************************************************************************************
skipping: [vm]

PLAY RECAP *************************************************************************************************************
vm                         : ok=15   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

# ansible-inventory -i <name_of_your_inventory_file>.yaml --list

```
tiny0wizard@DESKTOP-U5IRIAH:/mnt/e/projects/temp/ansible$ ansible-inventory -i ./inventory/yandex_cloud.yml --list
{
    "_meta": {
        "hostvars": {
            "vm": {
                "ansible_become": true,
                "ansible_host": "158.160.46.145",
                "ansible_ssh_private_key_file": "/mnt/c/users/tiny wizard/id_tw",
                "ansible_user": "tiny0wizard"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
    "ungrouped": {
        "hosts": [
            "vm"
        ]
    }
}
```