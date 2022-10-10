# Ansible Info

## Requirements

1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
2. [yandexcloud](https://pypi.org/project/yandexcloud/)
   (if you will use `inventory/yacloud_compute.yml` inventory file)

## Credentials

1. Export env `YC_OAUTH_TOKEN` with your Yandex Cloud Oauth token
   if you will use `inventory/yacloud_compute.yml` inventory file.

## Run

    ansible-playbook <path_to_playbook> --diff -i <path_to_inventory> --private-key=<path_to_private_key>

## Wipe application deployment

    ansible-playbook <path_to_playbook> \
      --tags wipe \
      --extra-vars "app_full_wipe=true" \
      --private-key=<path_to_private_key>
