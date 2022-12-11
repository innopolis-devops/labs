## Deploy

```
┌─[timurrameev@timur@MacBook-Pro] - [~/Innopolis/DevOps/DevOps_labs/ansible] - [2629]
└─[$] ansible-playbook -i .inventory/default.yml playbooks/dev/main.yml
PLAY [all] *********************************************************************
TASK [Gathering Facts] *********************************************************
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Load OS-specific vars.] *****************************
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : include_tasks] **************************************
included: /Users/timurrameev/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for timurrameev@130.193.48.228
TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ***
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure dependencies are installed.] *****************
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Add Docker apt key.] ********************************
changed: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ***
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Add Docker repository.] *****************************
changed: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Install Docker packages.] ***************************
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***
changed: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Install docker-compose plugin.] *********************
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **************
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Configure Docker daemon options.] *******************
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ******
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***
RUNNING HANDLER [geerlingguy.docker : restart docker] **************************
changed: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : include_tasks] **************************************
included: /Users/timurrameev/.ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for timurrameev@130.193.48.228
TASK [geerlingguy.docker : Check current docker-compose version.] **************
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : set_fact] *******************************************
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***
ok: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Install Docker Compose (if configured).] ************
changed: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Get docker group info using getent.] ****************
skipping: [timurrameev@130.179.62.198]
TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***
TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [timurrameev@130.179.62.198]
PLAY RECAP *********************************************************************
┌─[timurrameev@timur@MacBook-Pro] - [~/Innopolis/DevOps/DevOps_labs/ansible] - [2629]
```


## Playbook list

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
            "timurrameev@130.179.62.198"
        ]
    }
}
```