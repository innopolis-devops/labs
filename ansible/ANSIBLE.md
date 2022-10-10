# Ansible

This ansible playbook sets up docker-compose and timeweb application.

`ansible-playbook -i inventory/default_yandex.yml playbooks/dev/main.yml`

```ansible
TASK [geerlingguy.docker : Install Docker packages.] ***************************
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***
changed: [178.154.221.212]

TASK [geerlingguy.docker : Install docker-compose plugin.] *********************
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **************
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Configure Docker daemon options.] *******************
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ******
ok: [178.154.221.212]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

RUNNING HANDLER [geerlingguy.docker : restart docker] **************************
changed: [178.154.221.212]

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Get docker group info using getent.] ****************
skipping: [178.154.221.212]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [178.154.221.212]

TASK [../../roles/web_app : Install pip] ***************************************
changed: [178.154.221.212]

TASK [../../roles/web_app : Install docker-compose] ****************************
changed: [178.154.221.212]

TASK [../../roles/web_app : Start the timeweb container] ***********************
changed: [178.154.221.212]

PLAY RECAP *********************************************************************
178.154.221.212            : ok=14   changed=7    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
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
