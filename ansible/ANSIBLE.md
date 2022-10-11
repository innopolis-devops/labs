Run of 
`ansible-playbook playbooks/dev/main.yaml --diff`


```
...
TASK [docker : Install Docker packages.] ***************************************
skipping: [clock_clock_moscow]

TASK [docker : Install Docker packages (with downgrade option).] ***************
The following packages were automatically installed and are no longer required:
  libpython2-stdlib libpython2.7-minimal libpython2.7-stdlib
  python-pkg-resources python-setuptools python2 python2-minimal python2.7
  python2.7-minimal
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 18 not upgraded.
changed: [clock_clock_moscow]

TASK [docker : Install docker-compose plugin.] *********************************
skipping: [clock_clock_moscow]

TASK [docker : Install docker-compose-plugin (with downgrade option).] *********
skipping: [clock_clock_moscow]

TASK [docker : Ensure /etc/docker/ directory exists.] **************************
skipping: [clock_clock_moscow]

TASK [docker : Configure Docker daemon options.] *******************************
skipping: [clock_clock_moscow]

TASK [docker : Ensure Docker is started and enabled at boot.] ******************
ok: [clock_clock_moscow]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

RUNNING HANDLER [docker : restart docker] **************************************
changed: [clock_clock_moscow]

TASK [docker : Get docker group info using getent.] ****************************
skipping: [clock_clock_moscow]

TASK [docker : Check if there are any users to add to the docker group.] *******

TASK [docker : include_tasks] **************************************************
skipping: [clock_clock_moscow]

PLAY RECAP *********************************************************************
clock_clock_moscow         : ok=11   changed=5    unreachable=0    failed=0    skipped=11   rescued=0    ignored
=0
```

Run of
`ansible-inventory -i inventory/inventory.yaml --list`

```
{
    "VM": {
        "hosts": [
            "clock_clock_moscow"
        ]
    },
    "_meta": {
        "hostvars": {
            "clock_clock_moscow": {
                "ansible_become": true,
                "ansible_host": "3.17.37.178",
                "ansible_ssh_private_key_file": "./EC2key.pem",
                "ansible_user": "ubuntu"
        ]
    }
}
```