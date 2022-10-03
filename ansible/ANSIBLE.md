# output of ansible-playbook

```

PLAY [all] *************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
fatal: [127.0.0.1]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 127.0.0.1 port 22: Connection refused", "unreachable": true}

PLAY RECAP *************************************************************************************************************************************************************
127.0.0.1                  : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
```

# output of ansible-inventory

```
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
    "ungrouped": {
        "hosts": [
            "35.78.91.181"
        ]
    }
}
```