# Ansible
## 
```
ansible-playbook playbooks/dev/main.yml --diff
```
Output:

```shell
PLAY [Install docker] *********************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************
ok: [yacloud]

TASK [docker : Load OS-specific vars.] ****************************************************************************************************************************************************************
fatal: [yacloud]: FAILED! => {"msg": "No file was found when using first_found."}

PLAY RECAP ********************************************************************************************************************************************************************************************
yacloud                    : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0  
```
##
```
ansible-inventory -i inventory/default.yml --list
```
Output:
```
{
    "_meta": {
        "hostvars": {
            "yacloud": {
                "ansible_become": true,
                "ansible_host": "62.84.118.130",
                "ansible_user": "talgat"
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
            "yacloud"
        ]
    }
}

```
