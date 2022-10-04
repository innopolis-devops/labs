# Ansible

## Test commands

### `ansible-playbook -i ansible/inventory/inventory.yaml  ansible/playbooks/dev/main.yaml --diff`

```bash
PLAY [Docker] ************************************************************************************************************************************************************************
TASK [Gathering Facts] ***************************************************************************************************************************************************************fatal: [vm01]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 172.22.250.244 port 22: Connection refused", "unreachable": true}

PLAY RECAP ***************************************************************************************************************************************************************************vm01                       : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0
```

Note: I was not able to test it because I wasn't able to get access to a free remove VM I could ssh to.

### `ansible-inventory -i ansible/inventory/inventory.yaml --list`

```JSON
{
    "_meta": {
        "hostvars": {
            "vm01": {
                "ansible_host": "172.22.250.244"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "virtualmachines"
        ]
    },
    "virtualmachines": {
        "hosts": [
            "vm01"
        ]
    }
}
```
