### Result of Lab 5:
```
ansible-playbook playbooks/dev/main.yaml --diff
```
```
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 29 not upgraded.
changed: [danoneVM]

TASK [danone : Install docker-compose plugin.] *****************************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************
skipping: [danoneVM]

TASK [danone : Ensure /etc/docker/ directory exists.] **********************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Configure Docker daemon options.] ***************************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Ensure Docker is started and enabled at boot.] **************************************************************************************************************
ok: [danoneVM]

TASK [danone : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

RUNNING HANDLER [danone : restart docker] **********************************************************************************************************************************
changed: [danoneVM]

TASK [danone : include_tasks] **********************************************************************************************************************************************
included: /Users/mac/Downloads/labs/ansible/roles/danone/tasks/docker-compose.yml for danoneVM

TASK [danone : Check current docker-compose version.] **********************************************************************************************************************
ok: [danoneVM]

TASK [danone : set_fact] ***************************************************************************************************************************************************
ok: [danoneVM]

TASK [danone : Delete existing docker-compose version if it's different.] **************************************************************************************************
ok: [danoneVM]

TASK [danone : Install Docker Compose (if configured).] ********************************************************************************************************************
changed: [danoneVM]

TASK [danone : Get docker group info using getent.] ************************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [danone : include_tasks] **********************************************************************************************************************************************
skipping: [danoneVM]

PLAY RECAP *****************************************************************************************************************************************************************
danoneVM                   : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0 
```

### Result of:
```
ansible-inventory -i inventory/inventory.yml --list
```
```
{
    "VM": {
        "hosts": [
            "danoneVM"
        ]
    },
    "_meta": {
        "hostvars": {
            "danoneVM": {
                "ansible_become": true,
                "ansible_host": "84.201.141.248",
                "ansible_ssh_private_key_file": "~/yandex_key",
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

### Result of Lab 6:
```
ansible-playbook playbooks/dev/main.yaml --diff
```
```
TASK [danone : Ensure /etc/docker/ directory exists.] **********************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Configure Docker daemon options.] ***************************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Ensure Docker is started and enabled at boot.] **************************************************************************************************************
ok: [danoneVM]

TASK [danone : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************

TASK [danone : include_tasks] **********************************************************************************************************************************************
included: /Users/mac/Downloads/labs/ansible/roles/danone/tasks/docker-compose.yml for danoneVM

TASK [danone : Check current docker-compose version.] **********************************************************************************************************************
ok: [danoneVM]

TASK [danone : set_fact] ***************************************************************************************************************************************************
ok: [danoneVM]

TASK [danone : Delete existing docker-compose version if it's different.] **************************************************************************************************
skipping: [danoneVM]

TASK [danone : Install Docker Compose (if configured).] ********************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Get docker group info using getent.] ************************************************************************************************************************
skipping: [danoneVM]

TASK [danone : Check if there are any users to add to the docker group.] ***************************************************************************************************

TASK [danone : include_tasks] **********************************************************************************************************************************************
skipping: [danoneVM]

TASK [web_app : Stop services] *********************************************************************************************************************************************
skipping: [danoneVM]

TASK [web_app : Remove directory] ******************************************************************************************************************************************
skipping: [danoneVM]

TASK [web_app : Create directory] ******************************************************************************************************************************************
ok: [danoneVM]

TASK [web_app : Crete docker-compose.yml] **********************************************************************************************************************************
ok: [danoneVM]

TASK [web_app : Run docker-compose] ****************************************************************************************************************************************
ok: [danoneVM]

PLAY RECAP *****************************************************************************************************************************************************************
danoneVM                   : ok=19   changed=0    unreachable=0    failed=0    skipped=16   rescued=0    ignored=0   
```