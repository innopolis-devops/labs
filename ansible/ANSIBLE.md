# Ansible

## `ansible-playbook <path_to your_playbook> --diff`

```
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [server]

TASK [docker : Install docker-compose plugin.] *************************************************************************************************************************************************************
skipping: [server]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************************************************************************************************
skipping: [server]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************************************************************************************************
skipping: [server]

TASK [docker : Configure Docker daemon options.] ***********************************************************************************************************************************************************
skipping: [server]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************************************************************************************************
ok: [server]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************************************************************************************

RUNNING HANDLER [docker : restart docker] ******************************************************************************************************************************************************************
changed: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
included: /home/emileyray/Документы/GitHub/devops-lab-4/ansible/roles/docker/tasks/setup-Debian.yml for server

TASK [docker : Check current docker-compose version.] ******************************************************************************************************************************************************
ok: [server]

TASK [docker : set_fact] ***********************************************************************************************************************************************************************************
ok: [server]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************************************************************************************************
ok: [server]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************************************************************************************************
changed: [server]

TASK [docker : Get docker group info using getent.] ********************************************************************************************************************************************************
skipping: [server]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************************************************************************************************

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
skipping: [server]

PLAY RECAP *************************************************************************************************************************************************************************************************
server                     : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   

```

## `ansible-inventory -i <name_of_your_inventory_file>.yaml --list`

```
{
    "_meta": {
        "hostvars": {
            "server": {
                "ansible_become": true,
                "ansible_host": "51.250.30.89",
                "ansible_ssh_private_key_file": "key",
                "ansible_user": "clown"
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
            "server"
        ]
    }
}
```