# Ansible (First part)

## output of ansible-playbook

```

PLAY [all] *************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
fatal: [127.0.0.1]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 127.0.0.1 port 22: Connection refused", "unreachable": true}

PLAY RECAP *************************************************************************************************************************************************************
127.0.0.1                  : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
```

## output of ansible-inventory

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
            "35.78.91.181"
        ]
    }
}
```

# Ansible (second part)

## output of ansible-playbook

```
PLAY [Initialize docker] ***********************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************
included: /Users/zyyme/Projects/IU/F22/devops/labs/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for 35.78.91.181

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************************************

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************
included: /Users/zyyme/Projects/IU/F22/devops/labs/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for 35.78.91.181

TASK [geerlingguy.docker : Check current docker-compose version.] ******************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : set_fact] ***********************************************************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] **********************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ****************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************************************************************

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************
skipping: [35.78.91.181]

PLAY [deploy webapp] ***************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [35.78.91.181]

TASK [deployment : pull webapp] ****************************************************************************************************************************************
ok: [35.78.91.181]

TASK [deployment : build webapp] ***************************************************************************************************************************************
ok: [35.78.91.181]

TASK [deployment : start webapp] ***************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "exists": false,
-    "running": false
+    "exists": true,
+    "running": true
 }

changed: [35.78.91.181]

PLAY RECAP *************************************************************************************************************************************************************
35.78.91.181               : ok=17   changed=1    unreachable=0    failed=0    skipped=14   rescued=0    ignored=0   
```