# Ansible

## ansible-playbook <path_to your_playbook> --diff

```bash

...skipped some steps

TASK [docker : Add Docker repository.] ***********************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [VM1]

TASK [docker : Install Docker packages.] *********************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libseccomp2 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin pigz slirp4netns
The following packages will be upgraded:
  libseccomp2
1 upgraded, 7 newly installed, 0 to remove and 254 not upgraded.
changed: [VM1]

TASK [docker : Install docker-compose plugin.] ***************************************************************************************************************************
skipping: [VM1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************
skipping: [VM1]

TASK [docker : Configure Docker daemon options.] *************************************************************************************************************************
skipping: [VM1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************
ok: [VM1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************

RUNNING HANDLER [docker : restart docker] ********************************************************************************************************************************
changed: [VM1]

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [VM1]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************
skipping: [VM1]

PLAY RECAP ***************************************************************************************************************************************************************
VM1                        : ok=11   changed=4    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```

## ansible-inventory -i <name_of_your_inventory_file>.yaml --list

```bash
{
    "_meta": {
        "hostvars": {
            "VM1"
    : {
                "ansible_host": "54.200.35.2",
                "ansible_user": "kamila"
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
            "VM1"
    
        ]
    }
}
```
