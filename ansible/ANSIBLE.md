## Playbook run

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

The following packages were automatically installed and are no longer required:

linux-headers-5.15.0-43 linux-headers-5.15.0-43-generic

linux-image-5.15.0-43-generic linux-modules-5.15.0-43-generic

linux-modules-extra-5.15.0-43-generic

Use 'sudo apt autoremove' to remove them.

The following NEW packages will be installed:

apt-transport-https

0 upgraded, 1 newly installed, 0 to remove and 3 not upgraded.

changed: [vm]

  

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***

ok: [vm]

  

TASK [geerlingguy.docker : Add Docker apt key.] ********************************

changed: [vm]

  

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ***

skipping: [vm]

  

TASK [geerlingguy.docker : Add Docker repository.] *****************************

--- before: /dev/null

+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list

@@ -0,0 +1 @@

+deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable

  

changed: [vm]

  

TASK [geerlingguy.docker : Install Docker packages.] ***************************

skipping: [vm]

  

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***

The following packages were automatically installed and are no longer required:

linux-headers-5.15.0-43 linux-headers-5.15.0-43-generic

linux-image-5.15.0-43-generic linux-modules-5.15.0-43-generic

linux-modules-extra-5.15.0-43-generic

Use 'sudo apt autoremove' to remove them.

The following additional packages will be installed:

docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns

Suggested packages:

aufs-tools cgroupfs-mount | cgroup-lite

The following NEW packages will be installed:

containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras

docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns

0 upgraded, 9 newly installed, 0 to remove and 3 not upgraded.

changed: [vm]

  

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

  

RUNNING HANDLER [geerlingguy.docker : restart docker] **************************

changed: [vm]

  

TASK [geerlingguy.docker : include_tasks] **************************************

included: /Users/mikado/labs_devops/ansible/roles/geerlingguy.docker/tasks/docker-compose.yml for vm

  

TASK [geerlingguy.docker : Check current docker-compose version.] **************

ok: [vm]

  

TASK [geerlingguy.docker : set_fact] *******************************************

ok: [vm]

  

TASK [geerlingguy.docker : Delete existing docker-compose version if it's different.] ***

ok: [vm]

  

TASK [geerlingguy.docker : Install Docker Compose (if configured).] ************

changed: [vm]

  

TASK [geerlingguy.docker : Get docker group info using getent.] ****************

skipping: [vm]

  

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***

  

TASK [geerlingguy.docker : include_tasks] **************************************

skipping: [vm]

  

PLAY RECAP *********************************************************************

vm : ok=16 changed=6 unreachable=0  failed=0 skipped=12 rescued=0  ignored=0

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

"ansible_host": "84.201.176.53"

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
