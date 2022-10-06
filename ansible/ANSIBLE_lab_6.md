## ## Playbook run

```
mikado@Alyssas-MacBook-Pro ansible % ansible-playbook -i inventory/inventory.yaml playbooks/main.yaml --diff

  

PLAY [vm] **********************************************************************

  

TASK [Gathering Facts] *********************************************************

ok: [vm]

  

TASK [geerlingguy.docker : Load OS-specific vars.] *****************************

ok: [vm]

  

TASK [geerlingguy.docker : include_tasks] **************************************

skipping: [vm]

  

TASK [geerlingguy.docker : include_tasks] **************************************

included: /Users/mikado/labs_devops/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for vm

  

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ***

ok: [vm]

  

TASK [geerlingguy.docker : Ensure dependencies are installed.] *****************

ok: [vm]

  

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***

ok: [vm]

  

TASK [geerlingguy.docker : Add Docker apt key.] ********************************

ok: [vm]

  

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Add Docker repository.] *****************************

ok: [vm]

  

TASK [geerlingguy.docker : Install Docker packages.] ***************************

skipping: [vm]

  

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***

ok: [vm]

  

TASK [geerlingguy.docker : Install docker-compose plugin.] *********************

skipping: [vm]

  

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **************

skipping: [vm]

  

TASK [geerlingguy.docker : Configure Docker daemon options.] *******************

skipping: [vm]

  

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ******

ok: [vm]

  

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

  

TASK [geerlingguy.docker : include_tasks] **************************************

included: /Users/mikado/labs_devops/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for vm

  

TASK [geerlingguy.docker : Check current docker-compose version.] **************

ok: [vm]

  

TASK [geerlingguy.docker : set_fact] *******************************************

ok: [vm]

  

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***

--- before

+++ after

@@ -1,4 +1,4 @@

{

"path": "/usr/local/bin/docker-compose",

-  "state": "file"

+  "state": "absent"

}

  

changed: [vm]

  

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ************

changed: [vm]

  

TASK [geerlingguy.docker : Get docker group info using getent.] ****************

skipping: [vm]

  

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***

  

TASK [geerlingguy.docker : include_tasks] **************************************

skipping: [vm]

  

TASK [geerlingguy.pip : Ensure Pip is installed.] ******************************

ok: [vm]

  

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] ************

changed: [vm] => (item={'name': 'pip', 'extra_args': '--upgrade'})

changed: [vm] => (item={'name': 'docker'})

changed: [vm] => (item={'name': 'docker-compose'})

  

TASK [docker : include_tasks] **************************************************

skipping: [vm]

  

TASK [docker : include_tasks] **************************************************

included: /Users/mikado/labs_devops/ansible/roles/docker/tasks/setup-Debian.yml for vm

  

TASK [docker : Ensure old versions of Docker are not installed.] ***************

ok: [vm]

  

TASK [docker : Ensure dependencies are installed.] *****************************

ok: [vm]

  

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***

skipping: [vm]

  

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***

ok: [vm]

  

TASK [docker : Add Docker apt key.] ********************************************

ok: [vm]

  

TASK [docker : Ensure curl is present (on older systems without SNI).] *********

skipping: [vm]

  

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ***

skipping: [vm]

  

TASK [docker : Add Docker repository.] *****************************************

ok: [vm]

  

TASK [docker : Install Docker.] ************************************************

ok: [vm]

  

TASK [docker : Ensure /etc/docker/ directory exists.] **************************

skipping: [vm]

  

TASK [docker : Configure Docker daemon options.] *******************************

skipping: [vm]

  

TASK [docker : Ensure Docker is started and enabled at boot.] ******************

ok: [vm]

  

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

  

TASK [docker : include_tasks] **************************************************

included: /Users/mikado/labs_devops/ansible/roles/docker/tasks/docker-compose.yml for vm

  

TASK [docker : Check current docker-compose version.] **************************

ok: [vm]

  

TASK [docker : Delete existing docker-compose version if it's different.] ******

--- before

+++ after

@@ -1,4 +1,4 @@

{

"path": "/usr/local/bin/docker-compose",

-  "state": "file"

+  "state": "absent"

}

  

changed: [vm]

  

TASK [docker : Install Docker Compose (if configured).] ************************

changed: [vm]

  

TASK [docker : include_tasks] **************************************************

skipping: [vm]

  

TASK [web_app : Include wipe task list in play] ********************************

skipping: [vm]

  

TASK [web_app : Create a directory if it does not exist] ***********************

ok: [vm]

  

TASK [web_app : Template a file to /etc/file.conf] *****************************

ok: [vm]

  

TASK [web_app : Run docker compose services] ***********************************

changed: [vm]

  

PLAY RECAP *********************************************************************

vm : ok=32 changed=6 unreachable=0  failed=0 skipped=20 rescued=0  ignored=0
```

## Inventory output

```
mikado@Alyssas-MacBook-Pro ansible % ansible-inventory -i inventory/inventory.yaml --list

{

"_meta": {

"hostvars": {

"local": {

"ansible_host": "localhost"

},

"vm": {

"ansible_host": "51.250.20.181"

}

}

},

"all": {

"children": [

"test",

"ungrouped",

"vms"

]

},

"test": {

"hosts": [

"local"

]

},

"vms": {

"hosts": [

"vm"

]

}

}
```
