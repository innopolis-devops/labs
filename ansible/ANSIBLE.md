# Ansible

## Static inventory

```sh
ubuntu-1@ubuntu1:~/labs/ansible$ ansible-playbook playbooks/dev/main.yaml —diff -i inventory/inventory.yml —private-key=~/.ssh/id_rsa —extra-vars "ansible_sudo_pass"="ubuntu-1"

TASK [docker : Install Docker packages (with downgrade option).] ***************
The following package was automatically installed and is no longer required:
systemd-hwe-hwdb
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
docker-scan-plugin libslirp0 pigz slirp4netns
Suggested packages:
aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
docker-scan-plugin libslirp0 pigz slirp4netns
0 upgraded, 8 newly installed, 0 to remove and 131 not upgraded.
changed: [vm1]

TASK [docker : Install docker-compose plugin.] *********************************
skipping: [vm1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
skipping: [vm1]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************
skipping: [vm1]

TASK [docker : Configure Docker daemon options.] *******************************
skipping: [vm1]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************
ok: [vm1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

RUNNING HANDLER [docker : restart docker] **************************************
changed: [vm1]

TASK [docker : include_tasks] **************************************************
included: /home/ubuntu-1/devops-labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

TASK [docker : Check current docker-compose version.] **************************
ok: [vm1]

TASK [docker : set_fact] *******************************************************
ok: [vm1]

TASK [docker : Delete existing docker-compose version if it's different.] ******
ok: [vm1]

TASK [docker : Install Docker Compose (if configured).] ************************
changed: [vm1]

TASK [docker : Get docker group info using getent.] ****************************
skipping: [vm1]

TASK [docker : Check if there are any users to add to the docker group.] *******

TASK [docker : include_tasks] **************************************************
skipping: [vm1]

PLAY RECAP *********************************************************************
vm1 : ok=15 changed=6 unreachable=0 failed=0 skipped=11 rescued=0 ignored=0
```

## output of ansible-inventory

   ```sh
    ubuntu-1@ubuntu1:~/labs/ansible$ ansible-inventory -i inventory/inventory.yml —list
    {
        "_meta": {
            "hostvars": {
                "vm1": {
                    "ansible_become": true,
                    "ansible_host": "10.0.2.15"
                    "ansible_user": "ubuntu-1"
                }
            }
        },
        "all": {
            "children": [
                "ungrouped",
                "vm"
            ]
        },
        "vm": {
            "hosts": [
                "vm1"
            ]
        }
    }
   ```
