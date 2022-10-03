## Notes
- Generate ssh key: `ssh-keygen -t rsa`.
- I placed the ssh key in **ansible** folder.
- I used Yandex Cloud VM and provided `key.pub` value.
- Connect to VM:

<img width="400" alt="1" src="https://user-images.githubusercontent.com/49106163/193684636-d02b7bbc-870f-43c8-9708-2569dd0ad554.png">

## ansible-playbook
- Initially there wasn't Docker

<img width="400" alt="2" src="https://user-images.githubusercontent.com/49106163/193684672-b3180c7f-7e75-43d5-941e-085d9e891e65.png">

- cd in **ansible** folder
- Run `ansible-playbook playbooks/dev/main.yaml --diff`
- Now the Docker is installed:

<img width="507" alt="3" src="https://user-images.githubusercontent.com/49106163/193684703-1a4f1d17-fae7-4e7a-ab2e-a2574a9ede71.png">


### Logs output:
```
PLAY [Install Docker for Yandex cloud] *********************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
Enter passphrase for key 'key': 
ok: [server]

TASK [docker : Load OS-specific vars.] *********************************************************************************************************************************************************************
ok: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
skipping: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
included: /Users/smore/Desktop/Innopolis/DevOps Engineering/DevOps_Innopolis/ansible/roles/docker/tasks/setup-Debian.yml for server

TASK [docker : Ensure old versions of Docker are not installed.] *******************************************************************************************************************************************
ok: [server]

TASK [docker : Ensure dependencies are installed.] *********************************************************************************************************************************************************
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
changed: [server]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****************************************************************************************************
skipping: [server]

TASK [docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************************************************************************************************
ok: [server]

TASK [docker : Add Docker apt key.] ************************************************************************************************************************************************************************
changed: [server]

TASK [docker : Ensure curl is present (on older systems without SNI).] *************************************************************************************************************************************
skipping: [server]

TASK [docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************************************************************************************************
skipping: [server]

TASK [docker : Add Docker repository.] *********************************************************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

changed: [server]

TASK [docker : Install Docker packages.] *******************************************************************************************************************************************************************
skipping: [server]

TASK [docker : Install Docker packages (with downgrade option).] *******************************************************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 33 not upgraded.
changed: [server]

TASK [docker : Install docker-compose plugin.] *************************************************************************************************************************************************************
skipping: [server]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *************************************************************************************************************************************
skipping: [server]

TASK [docker : Ensure /etc/docker/ directory exists.] ******************************************************************************************************************************************************
skipping: [server]

TASK [docker : Configure Docker daemon options.] ***********************************************************************************************************************************************************
skipping: [server]

TASK [docker : Ensure Docker is started and enabled at boot.] **********************************************************************************************************************************************
ok: [server]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************************************************************************************

RUNNING HANDLER [docker : restart docker] ******************************************************************************************************************************************************************
changed: [server]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
included: /Users/smore/Desktop/Innopolis/DevOps Engineering/DevOps_Innopolis/ansible/roles/docker/tasks/install-compose.yml for server

TASK [docker : Check current docker-compose version.] ******************************************************************************************************************************************************
ok: [server]

TASK [docker : set_fact] ***********************************************************************************************************************************************************************************
ok: [server]

TASK [docker : Delete existing docker-compose version if it's different.] **********************************************************************************************************************************
ok: [server]

TASK [docker : Install Docker Compose (if configured).] ****************************************************************************************************************************************************
changed: [server]

TASK [docker : Get docker group info using getent.] ********************************************************************************************************************************************************
skipping: [server]

TASK [docker : Check if there are any users to add to the docker group.] ***********************************************************************************************************************************

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************
skipping: [server]

PLAY RECAP *************************************************************************************************************************************************************************************************
server                     : ok=16   changed=6    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0  
```

## ansible-inventory

- cd in **ansible** folder
- Run `ansible-inventory -i inventory/default_ya_ru_central1_a.yml --list`

### Logs output:
```
{
    "_meta": {
        "hostvars": {
            "server": {
                "ansible_become": true,
                "ansible_host": "51.250.64.126",
                "ansible_ssh_private_key_file": "key",
                "ansible_user": "smore"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
    "ungrouped": {
        "hosts": [
            "server"
        ]
    }
}
```
