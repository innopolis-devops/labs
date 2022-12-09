```
PLAY [Install docker for yandex cloud machine] *****************************************************************************************************************************
TASK [Gathering Facts] *****************************************************************************************************************************************************
ok: [server]
TASK [docker : Load OS-specific vars.] *************************************************************************************************************************************
ok: [server]
TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [server]
TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/AfanasyevEvgeny/PycharmProjects/devops/ansible/roles/docker/tasks/setup-Debian.yml for VM1
TASK [docker : Ensure old versions of Docker are not installed.] ***********************************************************************************************************
ok: [server]
TASK [docker : Ensure dependencies are installed.] *************************************************************************************************************************
ok: [server]
TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ********************************************************************
skipping: [server]
TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *****************************************************************************************
ok: [server]
TASK [docker : Add Docker apt key.] ****************************************************************************************************************************************
ok: [server]
TASK [docker : Ensure curl is present (on older systems without SNI).] *****************************************************************************************************
skipping: [server]
TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ********************************************************************************************
skipping: [server]
TASK [docker : Add Docker repository.] *************************************************************************************************************************************
ok: [server]
TASK [docker : Install Docker packages.] ***********************************************************************************************************************************
skipping: [server]
TASK [docker : Install Docker packages (with downgrade option).] ***********************************************************************************************************
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  docker-ce docker-ce-cli
0 upgraded, 2 newly installed, 0 to remove and 29 not upgraded.
changed: [server]
TASK [docker : Install docker-compose plugin.] *****************************************************************************************************************************
skipping: [server]
TASK [docker : Install docker-compose-plugin (with downgrade option).] *****************************************************************************************************
skipping: [server]
TASK [docker : Ensure /etc/docker/ directory exists.] **********************************************************************************************************************
skipping: [server]
TASK [docker : Configure Docker daemon options.] ***************************************************************************************************************************
skipping: [server]
TASK [docker : Ensure Docker is started and enabled at boot.] **************************************************************************************************************
ok: [server]
TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] **********************************************************************************************
RUNNING HANDLER [docker : restart docker] **********************************************************************************************************************************
changed: [server]
TASK [docker : include_tasks] **********************************************************************************************************************************************
included: /Users/AfanasyevEvgeny/PycharmProjects/devops/ansible/roles/docker/tasks/install-compose.yml for server
TASK [docker : Check current docker-compose version.] **********************************************************************************************************************
ok: [server]
TASK [docker : set_fact] ***************************************************************************************************************************************************
ok: [server]
TASK [docker : Delete existing docker-compose version if it's different.] **************************************************************************************************
skipping: [server]
TASK [docker : Install Docker Compose (if configured).] ********************************************************************************************************************
skipping: [server]
TASK [docker : Get docker group info using getent.] ************************************************************************************************************************
skipping: [server]
TASK [docker : Check if there are any users to add to the docker group.] ***************************************************************************************************
TASK [docker : include_tasks] **********************************************************************************************************************************************
skipping: [server]
PLAY RECAP *****************************************************************************************************************************************************************
server                     : ok=14   changed=2    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0   
```

```
ansible-inventory -i inventory/inventory.yaml --list
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
                  "ansible_host": "10.130.0.0",
                  "ansible_ssh_private_key_file": "~/mykey.pem",
                  "ansible_user": "ubuntu"
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

```

# Yandex cloud

`ansible-playbook playbooks/yacloud/main.yml --diff`:

 ```text
 PLAY [Docker] ****************************************************************************************************************************************************************************

 TASK [Gathering Facts] *******************************************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 included: /Users/Evgeny/ansible/roles/docker/tasks/setup_debian.yml for terraform

 TASK [docker : Ensure old versions of Docker are not installed.] *************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : Ensure dependencies are installed.] ***************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Add Docker apt key.] ******************************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : Ensure curl is present (on older systems without SNI).] *******************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Add Docker apt key (alternative for older systems without SNI).] **********************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Add Docker repository.] ***************************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 included: /Users/Evgeny/ansible/roles/docker/tasks/install_docker.yml for terraform

 TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************************************

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 included: /Users/Evgeny/ansible/roles/docker/tasks/install_compose.yml for terraform

 TASK [docker : Check current docker-compose version.] ************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : set_fact] *****************************************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Get docker group info using getent.] **************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************************************

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 skipping: [terraformlab]

 PLAY RECAP *******************************************************************************************************************************************************************************
 terraform                  : ok=12   changed=0    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
 ```

`ansible-inventory -i inventory/yacloud_compute.yml --list`:

 ```text
 {
     "_meta": {
         "hostvars": {
             "terraform": {
                 "ansible_host": "51.250.87.149"
             }
         }
     },
     "all": {
         "children": [
             "ungrouped",
             "yacloud"
         ]
     },
     "yacloud": {
         "hosts": [
             "terraformlab"
         ]
     }
 }
 ```

# Lab 6

### First docker deployment to yandex cloud

Output:

 ```console
 TASK [docker : Ensure installation directory exists.] *************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Install Docker Compose (if configured).] ***********************************************************************************************************
 changed: [terraformlab]

 TASK [docker : Get docker group info using getent.] ***************************************************************************************************************
 skipping: [terraformlab]

 TASK [docker : Check if there are any users to add to the docker group.] ******************************************************************************************

 TASK [docker : include_tasks] *************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Stop all services] ********************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Remove app directory] *****************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Create dir] ***************************************************************************************************************************************
 --- before
 +++ after
 @@ -1,5 +1,5 @@
  {
 -    "mode": "0755",
 +    "mode": "0700",
      "path": "/opt/devops/node_app",
 -    "state": "absent"
 +    "state": "directory"
  }

 changed: [terraformlab]

 TASK [web_app : Template a file to `dir/docker-compose.yml`] ******************************************************************************************************
 --- before
 +++ after: /Users/Evgeny/.ansible/tmp/ansible-local-7655407tup78t/tmpu_56hwdf/docker-compose.yml.j2
 @@ -0,0 +1,9 @@
 +version: "3.9"
 +
 +services:
 +  node_app:
 +    image: afonyaa/node_app:latest
 +    container_name: node_app
 +    ports:
 +      - "8081:8081"
 +    restart: on-failure

 changed: [terraformlab]

 TASK [web_app : Start with docker compose] ************************************************************************************************************************
 changed: [terraformlab]

 PLAY RECAP ********************************************************************************************************************************************************
 terraformlab                 : ok=22   changed=12   unreachable=0    failed=0    skipped=10   rescued=0    ignored=0   

 ```

 </details>

## Metrics

To check whether app is up and running:

For Node use endpoint:
```console
localhost:8080/actuator/health
 ```