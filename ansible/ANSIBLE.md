# Ansible

## Best practices

What I used:

- Variable file for non-sensitive values, not values hardcoded into playbook or inventory files
- An encrypted file for VM sudo password
  - [vault](https://stackoverflow.com/a/29213873)
- A file to store the vault password
  - it's set in `ansible.cfg`
- Named tasks
- A well-tested [docker role](https://galaxy.ansible.com/geerlingguy/docker)

## Usage

To make Ansible aware of ansible config path and roles directory:

```sh
cd ansible && source .env
```

## Outputs

### 1

```sh
ansible-playbook -i inventory/docker.yml playbooks/dev/docker/main.yml --diff
```

```terminal
TASK [docker : Install Docker packages.] ***************************************
skipping: [localhost]

TASK [docker : Install Docker packages (with downgrade option).] ***************
ok: [localhost]

TASK [docker : Install docker-compose plugin.] *********************************
skipping: [localhost]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
skipping: [localhost]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************
skipping: [localhost]

TASK [docker : Configure Docker daemon options.] *******************************
skipping: [localhost]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************
ok: [localhost]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [docker : include_tasks] **************************************************
included: /home/eyjafjallajokull/Desktop/devops-labs/ansible/roles/docker/tasks/docker-compose.yml for localhost

TASK [docker : Check current docker-compose version.] **************************
ok: [localhost]

TASK [docker : set_fact] *******************************************************
ok: [localhost]

TASK [docker : Delete existing docker-compose version if it's different.] ******
skipping: [localhost]

TASK [docker : Install Docker Compose (if configured).] ************************
skipping: [localhost]

TASK [docker : Get docker group info using getent.] ****************************
skipping: [localhost]

TASK [docker : Check if there are any users to add to the docker group.] *******

TASK [docker : include_tasks] **************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=13   changed=0    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0   
```

### 2

```sh
ansible-inventory -i inventory/docker.yml --list
```

```json
{
    "_meta": {
        "hostvars": {
            "localhost": {
                "ansible_become_pass": "{{ ansible_become_pass }}",
                "ansible_connection": "ssh",
                "ansible_port": "{{ ansible_port }}",
                "ansible_user": "{{ ansible_user }}"
            }
        }
    },
    "all": {
        "children": [
            "docker",
            "ungrouped"
        ]
    },
    "docker": {
        "hosts": [
            "localhost"
        ]
    }
}
```
