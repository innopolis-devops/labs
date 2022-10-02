# Ansible

The first command is:

```bash
ansible-playbook playbooks/main.yml --diff
```

Its output is the following:

```plain
PLAY [Create Docker] ***************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
included: /Users/igooor_bb/Workspace/Edu/devops-labs/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for InnoDevOps

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************
changed: [InnoDevOps]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [InnoDevOps]

TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 39 not upgraded.
changed: [InnoDevOps]

TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************

RUNNING HANDLER [geerlingguy.docker : restart docker] ******************************************************************
changed: [InnoDevOps]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
included: /Users/igooor_bb/Workspace/Edu/devops-labs/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for InnoDevOps

TASK [geerlingguy.docker : Check current docker-compose version.] ******************************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : set_fact] ***********************************************************************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] **********************************
ok: [InnoDevOps]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ****************************************************
changed: [InnoDevOps]

TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************
skipping: [InnoDevOps]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************

TASK [geerlingguy.docker : include_tasks] ******************************************************************************
skipping: [InnoDevOps]

PLAY RECAP *************************************************************************************************************
InnoDevOps                 : ok=16   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

The second command is:

```bash
ansible-inventory -i inventory/default_aws_ec2.yml --list
```

Its output is the following:

```plain
{
    "VM": {
        "hosts": [
            "InnoDevOps"
        ]
    },
    "_meta": {
        "hostvars": {
            "InnoDevOps": {
                "ansible_become": true,
                "ansible_host": "54.241.222.107",
                "ansible_ssh_private_key_file": "~/.ssh/InnoDevOps.pem",
                "ansible_user": "ubuntu"
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
