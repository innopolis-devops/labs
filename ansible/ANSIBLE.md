# Ansible

`ansible-playbook -i inventory/default_yandex.yml playbooks/dev/main.yml`

```ansible
TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] **************************************************************************************
ok: [51.250.92.14]

TASK [geerlingguy.docker : Install docker-compose plugin.] ********************************************************************************************************
skipping: [51.250.92.14]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ********************************************************************************
skipping: [51.250.92.14]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *************************************************************************************************
skipping: [51.250.92.14]

TASK [geerlingguy.docker : Configure Docker daemon options.] ******************************************************************************************************
skipping: [51.250.92.14]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] *****************************************************************************************
ok: [51.250.92.14]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *************************************************************************

TASK [geerlingguy.docker : include_tasks] *************************************************************************************************************************
skipping: [51.250.92.14]

TASK [geerlingguy.docker : Get docker group info using getent.] ***************************************************************************************************
skipping: [51.250.92.14]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ******************************************************************************

TASK [geerlingguy.docker : include_tasks] *************************************************************************************************************************
skipping: [51.250.92.14]

TASK [../../roles/timeweb : Install pip] **************************************************************************************************************************
ok: [51.250.92.14]

TASK [../../roles/timeweb : Install docker-compose] ***************************************************************************************************************
ok: [51.250.92.14]

TASK [../../roles/timeweb : Start the timeweb container] **********************************************************************************************************
ok: [51.250.92.14]

PLAY RECAP ********************************************************************************************************************************************************
51.250.92.14               : ok=13   changed=0    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```

Ansible inventory:

```
{
    "_meta": {
        "hostvars": {
            "51.250.78.82": {
                "ansible_ssh_private_key_file": "~/.ssh/yandex_key",
                "ansible_user": "user"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yandex"
        ]
    },
    "yandex": {
        "hosts": [
            "51.250.78.82"
        ]
    }
}
```

## Bonus task

Ansible running in yandex cloud is set up using local-exec provisioner
