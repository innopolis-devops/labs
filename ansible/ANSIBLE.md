# ANSIBLE

### Output `ansible-playbook <path_to your_playbook> --diff`:

```
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
 included: /Users/grishakostarev/PycharmProjects/labs/ansible/roles/docker/tasks/docker-compose.yml for 127.0.0.1

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
 127.0.0.1                  : ok=11    changed=3    unreachable=0    failed=0    skipped=10   rescued=0    ignored=0   
```

### Output `ansible-inventory -i <name_of_your_inventory_file>.yaml --list`:

```
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

### Output `ansible-playbook <path_to your_playbook> --diff` for yandex:

```
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
 included: /Users/grishakostarev/PycharmProjects/labs/ansible/roles/docker/tasks/docker-compose.yml for terraformlab

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
 terraformlab                  : ok=14   changed=0    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0   
 ```

### Output `ansible-inventory -i <name_of_your_inventory_file>.yaml --list` for yandex:

 ```
 {
     "_meta": {
         "hostvars": {
             "terraformlab": {
                 "ansible_host": "51.250.89.99"
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

### Lab 6 output

```
 TASK [docker : include_tasks] *************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Stop] *********************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Remove] *******************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Wipe] *********************************************************************************************************************************************
 skipping: [terraformlab]

 TASK [web_app : Create directory] *********************************************************************************************************************************
 --- before
 +++ after
 @@ -1,5 +1,5 @@
 {
 -    "mode": "0755",
 +    "mode": "0700",
      "path": "/opt/app_python",
 -    "state": "absent"
 +    "state": "directory"
 }

 changed: [terraformlab]

 TASK [web_app : Template docker-compose] **************************************************************************************************************************
 --- before
 +++ after: /Users/grishakostarev/.ansible/tmp/ansible-local-78693tsk6kd2p/tmp25d0ad86/docker-compose.yml.j2
 @@ -0,0 +1,8 @@
 +version: "3.9"
 +services:
 +  app_python:
 +    image: noneword/app_python:latest
 +    container_name: app_python
 +    ports:
 +      - "4567:8080"
 +    restart: always

 changed: [terraformlab]

 TASK [web_app : Start docker-compose] *****************************************************************************************************************************
 changed: [terraformlab]

 PLAY RECAP ********************************************************************************************************************************************************
 terraformlab                 : ok=21   changed=13   unreachable=0    failed=0    skipped=13   rescued=0    ignored=0 
```