# Ansible

This repository contains an Ansible playbook to deploy the Docker role.

## Prerequisites

Before running the playbook, you need to have Ansible installed on your system.

## Usage

To deploy the Docker role, run the following command:
ansible-playbook playbook.yml --diff

The `--diff` option enables the diff mode, which shows the changes made by Ansible.

## Inventory

To list all the hosts in your inventory, run the following command:
PLAY [all] *********************************************************************
skipping: no hosts matched

PLAY RECAP *********************************************************************

