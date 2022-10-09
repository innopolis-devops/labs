# 5

## Ansible 1

In this lab you need to get familiar with a CD tool - Ansible. Then use it to deploy docker on a newly created cloud VM. You will need it for your application deployment in the next lab.

### 10 points

1. Tidy you repository if there is a difference and try to follow the suggested structure for this and next lab:

   ```sh
   .
   |-- README.md
   |-- ansible
   |   |-- inventory
   |   |   `-- default_aws_ec2.yml
   |   |-- playbooks
   |   |   `-- dev
   |   |       `-- main.yaml
   |   |-- roles
   |   |   |-- docker
   |   |   |   |-- defaults
   |   |   |   |   `-- main.yml
   |   |   |   |-- handlers
   |   |   |   |   `-- main.yml
   |   |   |   |-- tasks
   |   |   |   |   |-- install_compose.yml
   |   |   |   |   |-- install_docker.yml
   |   |   |   |   `-- main.yml
   |   |   |   `-- README.md
   |   |   `-- web_app
   |   |       |-- defaults
   |   |       |   `-- main.yml
   |   |       |-- handlers
   |   |       |   `-- main.yml
   |   |       |-- meta
   |   |       |   `-- main.yml
   |   |       |-- tasks
   |   |       |   `-- main.yml
   |   |       `-- templates
   |   |           `-- docker-compose.yml.j2
   |   `-- ansible.cfg
   |-- app_go
   |-- app_python
   `-- terraform
   ```

2. Install ansible and read about it - [Ansible intro](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

3. Create an ansible role for docker. There are two ways:
   * Write a role from scratch.
   * Use a [docker role](https://github.com/geerlingguy/ansible-role-docker) from `ansible-galaxy` as a template.
4. Create a playbook.
5. Create an `ANSIBLE.md` file in the `ansible` folder.
6. Run your playbook (deploy the role) and provide 50 last lines of the output of the your deployment command in it. Example:

   ```sh
   ansible-playbook <path_to your_playbook> --diff
   ```

7. Provide the output of the following command in the `ANSIBLE.md` file:

   ```sh
   ansible-inventory -i <name_of_your_inventory_file>.yaml --list
   ```

[Tricks and Tips](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)

## Bonus

### 2 points

1. Set up dynamic inventory for your cloud, try to find something ready

> [AWS example](https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html)
> 
> [Yandex Cloud - not tested](https://github.com/rodion-goritskov/yacloud_compute)