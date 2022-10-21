# Install Docker via Ansible

## Prerequirements

### Install pip

```
sudo apt-get install python3-pip
```

### Install ansible

```
python3 -m pip install --user ansible
```

### Add folder to the path

```
export PATH=$PATH:/path/to/ansible/bin/
```

## Install Docker Locally

It is important to place variables and other staff into inventory before deployment.

```
ansible-playbook playbooks/dev/main.yml
```

## Install Docker Remotely

It is important to place variables and other staff into inventory before deployment.

```
ansible-playbook playbooks/prod/main.yml
```