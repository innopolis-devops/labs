# Ansible (First part)

## output of ansible-playbook

```
TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ****************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Install Docker Compose (if configured).] **********************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Get docker group info using getent.] **************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] *****************************

TASK [geerlingguy.docker : include_tasks] ************************************************************************
skipping: [35.78.91.181]

PLAY [deploy webapp] *********************************************************************************************

TASK [Gathering Facts] *******************************************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Load OS-specific vars.] ***************************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : include_tasks] ************************************************************************
skipping: [35.78.91.181]

TASK [geerlingguy.docker : include_tasks] ************************************************************************
included: /Users/zyyme/Projects/IU/F22/devops/labs/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for 35.78.91.181

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Ensure dependencies are installed.] ***************************************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [35.78.91.181]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Add Docker apt key.] ******************************************************************
fatal: [35.78.91.181]: FAILED! => {"changed": false, "checksum_dest": null, "checksum_src": "f5b5bd1487cefc0c53c947e11ca202e86b33dbad", "dest": "/etc/apt/trusted.gpg.d/docker.asc", "elapsed": 0, "gid": 0, "group": "root", "mode": "0644", "msg": "Destination /etc/apt/trusted.gpg.d/docker.asc is not writable", "owner": "root", "size": 3817, "src": "/home/deployer/.ansible/tmp/ansible-tmp-1670670367.4297931-21405-225872713189815/tmpbw0dp0bs", "state": "file", "uid": 0, "url": "https://download.docker.com/linux/ubuntu/gpg"}
...ignoring

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *******************************
ok: [35.78.91.181]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] **********************
fatal: [35.78.91.181]: FAILED! => {"changed": true, "cmd": "curl -sSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -\n", "delta": "0:00:00.113792", "end": "2022-12-10 11:06:24.032696", "msg": "non-zero return code", "rc": 1, "start": "2022-12-10 11:06:23.918904", "stderr": "Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).\nE: This command can only be used by root.\ncurl: (23) Failed writing body", "stderr_lines": ["Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).", "E: This command can only be used by root.", "curl: (23) Failed writing body"], "stdout": "", "stdout_lines": []}

PLAY RECAP *******************************************************************************************************
35.78.91.181               : ok=21   changed=0    unreachable=0    failed=1    skipped=16   rescued=0    ignored=1   
```

## output of ansible-inventory

```
{
    "_meta": {
        "hostvars": {
            "35.78.91.181": {
                "ansible_ssh_private_key_file": "~/id_terraform",
                "ansible_user": "deployer"
            }
        }
    },
    "all": {
        "children": [
            "deploy_servers",
            "ungrouped"
        ]
    },
    "deploy_servers": {
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