# Ansible Info

## Prerequisites

1. Install the following:

   1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
   2. [YandexCloud Python library](https://pypi.org/project/yandexcloud/)

2. Set your Yandex OAUTH Token to env variable *YANDEX_OAUTH_TOKEN*

## How to run

   1. Enter ansible directory

      `` $ cd ansible ``

   2. Run ansible playbook(for GO application change *app_python* to *app_go* directory)

      `` $ ansible-playbook playbooks/dev/app_python/main.yml --diff ``

   3. To wipe application run

      `` $ ansible-playbook playbooks/dev/app_python/main.yml --tags wipe --extra-vars "app_full_wipe=true" ``
