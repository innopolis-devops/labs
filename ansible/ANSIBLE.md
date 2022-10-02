# Ansible

## Without plugin

1. 50 last lines of *ansible-playbook* command

    ```plain

        ...(skipped)

        docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
        libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
        0 upgraded, 16 newly installed, 0 to remove and 36 not upgraded.
        changed: [vm1]

        TASK [docker : Install docker-compose plugin.] ******************************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Install docker-compose-plugin (with downgrade option).] ******************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Ensure /etc/docker/ directory exists.] ***********************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Configure Docker daemon options.] ****************************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Ensure Docker is started and enabled at boot.] ***************************************************************************************************************************
        ok: [vm1]

        TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***********************************************************************************************************

        RUNNING HANDLER [docker : restart docker] ***********************************************************************************************************************************************
        changed: [vm1]

        TASK [docker : include_tasks] ***********************************************************************************************************************************************************
        included: /home/danila/Study/devops_labs/ansible/roles/docker/tasks/docker-compose.yml for vm1

        TASK [docker : Check current docker-compose version.] ***********************************************************************************************************************************
        ok: [vm1]

        TASK [docker : set_fact] ****************************************************************************************************************************************************************
        ok: [vm1]

        TASK [docker : Delete existing docker-compose version if it's different.] ***************************************************************************************************************
        ok: [vm1]

        TASK [docker : Install Docker Compose (if configured).] *********************************************************************************************************************************
        changed: [vm1]

        TASK [docker : Get docker group info using getent.] *************************************************************************************************************************************
        skipping: [vm1]

        TASK [docker : Check if there are any users to add to the docker group.] ****************************************************************************************************************

        TASK [docker : include_tasks] ***********************************************************************************************************************************************************
        skipping: [vm1]

        PLAY RECAP ******************************************************************************************************************************************************************************
        vm1                        : ok=16   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0 
    ```

2. Output of *ansible-inventory* command

    ```plain
        {
            "_meta": {
                "hostvars": {
                    "vm1": {
                        "ansible_host": "51.250.79.82",
                        "ansible_user": "ubuntu"
                    }
                }
            },
            "all": {
                "children": [
                    "ungrouped",
                    "vms"
                ]
            },
            "vms": {
                "hosts": [
                    "vm1"
                ]
            }
        }
    ```

## With plugin

1. 50 last lines of *ansible-playbook* command

    ```plain

        ...(skipped)
        
        docker-scan-plugin git git-man libcurl3-gnutls liberror-perl libgdbm-compat4
        libperl5.30 patch perl perl-modules-5.30 pigz slirp4netns
        0 upgraded, 16 newly installed, 0 to remove and 36 not upgraded.
        changed: [terraform1]

        TASK [docker : Install docker-compose plugin.] *********************************
        skipping: [terraform1]

        TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
        skipping: [terraform1]

        TASK [docker : Ensure /etc/docker/ directory exists.] **************************
        skipping: [terraform1]

        TASK [docker : Configure Docker daemon options.] *******************************
        skipping: [terraform1]

        TASK [docker : Ensure Docker is started and enabled at boot.] ******************
        ok: [terraform1]

        TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

        RUNNING HANDLER [docker : restart docker] **************************************
        changed: [terraform1]

        TASK [docker : include_tasks] **************************************************
        included: /home/danila/Study/devops_labs/ansible/roles/docker/tasks/docker-compose.yml for terraform1

        TASK [docker : Check current docker-compose version.] **************************
        ok: [terraform1]

        TASK [docker : set_fact] *******************************************************
        ok: [terraform1]

        TASK [docker : Delete existing docker-compose version if it's different.] ******
        ok: [terraform1]

        TASK [docker : Install Docker Compose (if configured).] ************************
        changed: [terraform1]

        TASK [docker : Get docker group info using getent.] ****************************
        skipping: [terraform1]

        TASK [docker : Check if there are any users to add to the docker group.] *******

        TASK [docker : include_tasks] **************************************************
        skipping: [terraform1]

        PLAY RECAP *********************************************************************
        terraform1                 : ok=16   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored=0  
    ```

2. Output of *ansible-inventory* command

    ```plain
        {
            "_meta": {
                "hostvars": {
                    "terraform1": {
                        "ansible_host": "51.250.71.17"
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
                    "terraform1"
                ]
            }
        }
    ```
