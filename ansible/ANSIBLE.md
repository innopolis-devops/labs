# Ansible

Note that this ansible is created for Ubuntu 22.04 so it may not work on all possible configurations (at least is uses snap that is by common thing for ubuntu)

Tested with Yandex.Cloud

## Guide
1. Install Ansible
    ```bash
    python3 -m venv .venv
    source .venv/bin/activate
    pip install ansible
    ```
2. Install Ansible requirements: `ansible-galaxy install -r ./requirements.yml`
3. Set some vars in `./inventory/vps.yml`
4. Execute playbook: `ansible-playbook ./baambook.yml`

## Tips
- Ssh keys without password in one command: `ssh-keygen -t ecdsa -b 521 -f ./id_ecdsa -N ''`
- Yandex.Cloud cli cmd to create suitable vps: `yc compute instance create --name [NAME] --ssh-key ./id_ecdsa.pub --public-address [ADDRESS] --create-boot-disk type=network-ssd,size=16,image-id=fd8vgqmrilk8dchj1ccf` (16GB SSD with Ubuntu 20.04 LTS)
- Watch vps serial output to wait it to complete cloud-init: `watch -c "yc compute instance get-serial-port-output --name [NAME] | tail -n $(($LINES - 4))"`

## Lab5

### `ansible-playbook ./playbooks/dev/main.yml --diff`:
```
PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [vps]

TASK [docker : Update apt cache & upgrade system] ******************************
Calculating upgrade...
The following packages were automatically installed and are no longer required:
  libflashrom1 libftdi1-2
Use 'sudo apt autoremove' to remove them.
The following NEW packages will be installed:
  linux-headers-5.15.0-56 linux-headers-5.15.0-56-generic
  linux-image-5.15.0-56-generic linux-modules-5.15.0-56-generic
  linux-modules-extra-5.15.0-56-generic
The following packages have been kept back:
  tmux
The following packages will be upgraded:
  binutils binutils-common binutils-x86-64-linux-gnu ca-certificates
  cloud-init libbinutils libbpf0 libctf-nobfd0 libctf0 libglib2.0-0
  libglib2.0-bin libglib2.0-data libpython3.10 libpython3.10-minimal
  libpython3.10-stdlib libxml2 linux-firmware linux-generic
  linux-headers-generic linux-image-generic login passwd python3-distupgrade
  python3.10 python3.10-minimal snapd tzdata ubuntu-advantage-tools
  ubuntu-release-upgrader-core
29 upgraded, 5 newly installed, 0 to remove and 1 not upgraded.
changed: [vps]

TASK [docker : Install basic packages] *****************************************
The following packages were automatically installed and are no longer required:
  libflashrom1 libftdi1-2 linux-headers-5.15.0-43
  linux-headers-5.15.0-43-generic linux-image-5.15.0-43-generic
  linux-modules-5.15.0-43-generic linux-modules-extra-5.15.0-43-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base javascript-common
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0
  libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev libfakeroot
  libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgd3 libgomp1 libisl23
  libitm1 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc
  libjs-underscore liblsan0 libmpc3 libnsl-dev libpython3-dev
  libpython3.10-dev libquadmath0 libssh2-1 libstdc++-11-dev libtiff5
  libtirpc-dev libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev
  lto-disabled-list mailcap make manpages-dev mc-data mime-support python3-dev
  python3-wheel python3.10-dev rpcsvc-proto unzip zlib1g-dev
Suggested packages:
  bzip2-doc cpp-doc gcc-11-locales debian-keyring g++-multilib g++-11-multilib
  gcc-11-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
  gcc-11-multilib apache2 | lighttpd | httpd glibc-doc bzr libgd-tools
  libstdc++-11-doc make-doc arj catdvi | texlive-binaries dbview djvulibre-bin
  epub-utils genisoimage gv imagemagick libaspell-dev links | w3m | lynx
  odt2txt poppler-utils python python-boto python-tz unar wimtools xpdf
  | pdf-viewer zip
The following NEW packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base javascript-common
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0
  libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev libfakeroot
  libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgd3 libgomp1 libisl23
  libitm1 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc
  libjs-underscore liblsan0 libmpc3 libnsl-dev libpython3-dev
  libpython3.10-dev libquadmath0 libssh2-1 libstdc++-11-dev libtiff5
  libtirpc-dev libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev
  lto-disabled-list mailcap make manpages-dev mc mc-data mime-support
  python3-dev python3-pip python3-wheel python3.10-dev rpcsvc-proto unzip
  zlib1g-dev
0 upgraded, 70 newly installed, 0 to remove and 1 not upgraded.
changed: [vps]

TASK [docker : Install python3 requirements] ***********************************
changed: [vps]

TASK [docker : Install docker] *************************************************
changed: [vps] => (item=present)
ok: [vps] => (item=enabled)

TASK [docker : Start docker] ***************************************************
changed: [vps]

PLAY RECAP *********************************************************************
vps                        : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### `ansible-inventory -i ./inventory/vps.yml --list`:
```json
{
    "_meta": {
        "hostvars": {
            "vps": {
                "ansible_connection": "ssh",
                "ansible_host": "51.250.1.104",
                "ansible_python_interpreter": "auto",
                "ansible_ssh_common_args": "-o \"StrictHostKeyChecking no\"",
                "ansible_ssh_private_key_file": "./id_ecdsa",
                "ansible_user": "user"
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
            "vps"
        ]
    }
}
```

## Lab6

### `ansible-playbook ./playbooks/dev/main.yml --diff`:
```
PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [vps]

TASK [docker : Update apt cache & upgrade system] ******************************
ok: [vps]

TASK [docker : Install basic packages] *****************************************
ok: [vps]

TASK [docker : Install python3 requirements] ***********************************
ok: [vps]

TASK [docker : Install docker] *************************************************
ok: [vps] => (item=present)
ok: [vps] => (item=enabled)

TASK [docker : Start docker] ***************************************************
changed: [vps]

TASK [app_python : Create deploy directory] ************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/home/user/app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [vps]

TASK [app_python : Template docker-compose.yml] ********************************
--- before
+++ after: /Users/azazkamaz/.ansible/tmp/ansible-local-42901s1f0pdbo/tmpdypjn6qd/docker-compose.yml.j2
@@ -0,0 +1,6 @@
+version: "3.9"
+services:
+  web:
+    image: azazkamaz/tmp_inno_devops_labs:app_python-latest
+    ports:
+      - "8080:8080"
\ No newline at end of file

changed: [vps]

TASK [app_python : Start app_python] *******************************************
changed: [vps]

PLAY RECAP *********************************************************************
vps                        : ok=9    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```