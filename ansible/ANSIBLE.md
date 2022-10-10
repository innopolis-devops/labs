# Dev

`ansible-playbook playbooks/dev/main.yml --diff`:

 ```text
 PLAY [Docker] ****************************************************************************************************************************************************************************

 TASK [Gathering Facts] *******************************************************************************************************************************************************************
 ok: [127.0.0.1]

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 included: /Users/Max/ansible/roles/docker/tasks/install_docker.yml for 127.0.0.1

 TASK [docker : Install Docker packages (with downgrade option).] *************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Install docker-compose plugin.] *******************************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Install docker-compose-plugin (with downgrade option).] *******************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Ensure /etc/docker/ directory exists.] ************************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Configure Docker daemon options.] *****************************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Ensure Docker is started and enabled at boot.] ****************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************************************************************************************

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 included: /Users/Max/ansible/roles/docker/tasks/install_compose.yml for 127.0.0.1

 TASK [docker : Check current docker-compose version.] ************************************************************************************************************************************
 ok: [127.0.0.1]

 TASK [docker : set_fact] *****************************************************************************************************************************************************************
 ok: [127.0.0.1]

 TASK [docker : Delete existing docker-compose version if it's different.] ****************************************************************************************************************
 ok: [127.0.0.1]

 TASK [docker : Install Docker Compose (if configured).] **********************************************************************************************************************************
 changed: [127.0.0.1]

 TASK [docker : Get docker group info using getent.] **************************************************************************************************************************************
 skipping: [127.0.0.1]

 TASK [docker : Check if there are any users to add to the docker group.] *****************************************************************************************************************

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 skipping: [127.0.0.1]

 PLAY RECAP *******************************************************************************************************************************************************************************
 127.0.0.1                  : ok=7    changed=1    unreachable=0    failed=0    skipped=10   rescued=0    ignored=0   
 ```

`ansible-inventory -i inventory/default.yml --list`:

 ```text
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
 ```

# Yandex cloud

`ansible-playbook playbooks/yacloud/main.yml --diff`:

 ```text
 PLAY [Docker] ****************************************************************************************************************************************************************************

 TASK [Gathering Facts] *******************************************************************************************************************************************************************
 ok: [terraformlab]

 TASK [docker : include_tasks] ************************************************************************************************************************************************************
 included: /Users/Max/ansible/roles/docker/tasks/setup_debian.yml for terraform

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
 included: /Users/Max/ansible/roles/docker/tasks/install_docker.yml for terraform

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
 included: /Users/Max/ansible/roles/docker/tasks/install_compose.yml for terraform

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
      "path": "/opt/devops/app_python",
 -    "state": "absent"
 +    "state": "directory"
  }

 changed: [terraformlab]

 TASK [web_app : Template a file to `dir/docker-compose.yml`] ******************************************************************************************************
 --- before
 +++ after: /Users/Max/.ansible/tmp/ansible-local-7655407tup78t/tmpu_56hwdf/docker-compose.yml.j2
 @@ -0,0 +1,9 @@
 +version: "3.9"
 +
 +services:
 +  app_python:
 +    image: maxkoz777/moscow_time_python:latest
 +    container_name: app_python
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

### Python app deployed:

 ```console
 > curl 51.250.87.149:8081
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Current Moscow time:</title>
</head>
<body>
<h1>23:40:54</h1>
</body>
</html>
 ```

### Java app deployed

 ```console
 > curl 51.250.87.149:8080    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Current Moscow Time:</title>
</head>
<body>
<h1>Current Moscow Time:</h1>
<h2>23:42:51</h2>
</body>
</html>
 ```

## Metrics

To check whether app is up and running:

For java use endpoint:
```console
localhost:8080/actuator/health
 ```

For python use endpoint:
```console
localhost:8081/health
 ```