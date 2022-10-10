# Ansible
## ansible-playbook ./ansible/playbooks/dev/main.yml --diff
```
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
[WARNING]: Could not match supplied host pattern, ignoring: VM1

PLAY [Prepare docker] ***********************************************************************************************************************skipping: no hosts matched

PLAY RECAP **********************************************************************************************************************************
user@DESKTOP-L4BD1JV:/mnt/c/Users/User/Documents/Python Projects/devops$ 
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