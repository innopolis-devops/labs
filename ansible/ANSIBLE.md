# Results

`ansible-playbook playbooks/main.yml --diff`:

PLAY [Docker] ************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************
ok: [127.0.0.1]

TASK [docker : Load OS-specific vars.] ***********************************************************************
ok: [127.0.0.1]

TASK [docker : include_tasks] *****************************************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : include_tasks] ******************************************************************************************************************************************************
included: /Users/dmitriytsaplya/ansible/roles/docker/tasks/install_docker.yml for 127.0.0.1
 
TASK [docker : Install Docker packages (with downgrade option).] **********************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Install docker-compose plugin.] ***********************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Install docker-compose-plugin (with downgrade option).] **************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************

TASK [docker : include_tasks] *********************************************************************************************************************************
included: /Users/dmitriytsaplya/ansible/roles/docker/tasks/install_compose.yml for 127.0.0.1
 
TASK [docker : Check current docker-compose version.] ******************************************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : set_fact] *******************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : Delete existing docker-compose version if it's different.] ******************************************************************************************************************
ok: [127.0.0.1]

TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************
changed: [127.0.0.1]

TASK [docker : Get docker group info using getent.] ************************************************************************************************
skipping: [127.0.0.1]

TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************************************

TASK [docker : include_tasks] ******************************************************************************************************************
skipping: [127.0.0.1]

PLAY RECAP *************************************************************************************************************************************************************
127.0.0.1                  : ok=8    changed=1    unreachable=0    failed=0    skipped=10   rescued=0    ignored=0

`ansible-inventory -i inventory/default.yml --list`:

 {
     "_meta": {
         "hostvars": {}
     },
     "all": {
         "children": [
             "ungrouped"
         ]
     }
 }

 ## Lab 2

`ansible-playbook playbooks/main.yml`

PLAY [Web app] ***********************************************************************************************

TASK [Gathering Facts] ***************************************************************************************
Enter passphrase for key '/Users/dmitriytsaplya/.ssh/id_rsa': 
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Load OS-specific vars.] ***********************************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : include_tasks] ********************************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : include_tasks] ********************************************************************************
included: /Users/dmitriytsaplya/Desktop/devopslabs/devopslabs/ansible/roles/docker/tasks/setup-Debian.yml for tsaplyadmitriy@84.252.141.55

TASK [docker : Ensure old versions of Docker are not installed.] *********************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure dependencies are installed.] ***********************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ******
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Add Docker apt key.] **************************************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure curl is present (on older systems without SNI).] ***************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ******************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Add Docker repository.] ***********************************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Install Docker packages.] *********************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Install Docker packages (with downgrade option).] *********************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Install docker-compose plugin.] ***************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Configure Docker daemon options.] *************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************

TASK [docker : include_tasks] ********************************************************************************
included: /Users/dmitriytsaplya/Desktop/devopslabs/devopslabs/ansible/roles/docker/tasks/docker-compose.yml for tsaplyadmitriy@84.252.141.55

TASK [docker : Check current docker-compose version.] ********************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : set_fact] *************************************************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Delete existing docker-compose version if it's different.] ************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Install Docker Compose (if configured).] ******************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Get docker group info using getent.] **********************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [docker : Check if there are any users to add to the docker group.] *************************************

TASK [docker : include_tasks] ********************************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Stop all services] ************************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Remove app_python directory] **************************************************************
skipping: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Install dependencies] *********************************************************************
included: /Users/dmitriytsaplya/Desktop/devopslabs/devopslabs/ansible/roles/app_python/tasks/dependencies.yml for tsaplyadmitriy@84.252.141.55

TASK [app_python : Pip] **************************************************************************************
changed: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Docker] ***********************************************************************************
changed: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Create directory] *************************************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Docker compose template] ******************************************************************
ok: [tsaplyadmitriy@84.252.141.55]

TASK [app_python : Docker compose start] *********************************************************************
changed: [tsaplyadmitriy@84.252.141.55]

PLAY RECAP ***************************************************************************************************
tsaplyadmitriy@84.252.141.55 : ok=19   changed=3    unreachable=0    failed=0    skipped=16   rescued=0    ignored=0