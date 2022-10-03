# Ansible

```bash
ansible-playbook ./playbooks/dev/lab5.yml --diff | tail -n50                                                                
Enter passphrase for key '/home/wat4er/.ssh/yc':

TASK [geerlingguy.docker : Install Docker packages.] ***************************
skipping: [asdfffff]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***
ok: [asdfffff]

TASK [geerlingguy.docker : Install docker-compose plugin.] *********************
skipping: [asdfffff]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***
skipping: [asdfffff]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **************
skipping: [asdfffff]

TASK [geerlingguy.docker : Configure Docker daemon options.] *******************
skipping: [asdfffff]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ******
ok: [asdfffff]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
included: /home/wat4er/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for asdfffff

TASK [geerlingguy.docker : Check current docker-compose version.] **************
ok: [asdfffff]

TASK [geerlingguy.docker : set_fact] *******************************************
ok: [asdfffff]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***
skipping: [asdfffff]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ************
skipping: [asdfffff]

TASK [geerlingguy.docker : Get docker group info using getent.] ****************
skipping: [asdfffff]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [asdfffff]

PLAY RECAP *********************************************************************
asdfffff                   : ok=13   changed=0    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0
```

```bash
ansible-inventory -i ./ansible/inventory/yacloud_compute --list                                                                                                      lab5 2 
{
    "_meta": {
        "hostvars": {
            "asdfffff": {
                "ansible_host": "130.193.48.25",
                "ansible_ssh_private_key_file": "~/.ssh/yc",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yacloud"
        ]
    },
    "yacloud": {
        "hosts": [
            "asdfffff"
        ]
    }
}
```
