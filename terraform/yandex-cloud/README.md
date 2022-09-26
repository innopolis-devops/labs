# Yandex Cloud Terraform configuration

This module contains Terraform configuration for Yandex Cloud.

## Keys

Before running the configuration you should install `yc` and get OAuth key from
Yandex Cloud. Tutorial could be found [here](https://cloud.yandex.ru/docs/cli/quickstart).

## Envs

For running the configuration you should provide required envs, which allows
Terraform access your cloud.

    export YC_TOKEN=$(yc iam create-token)
    export YC_CLOUD_ID=$(yc config get cloud-id)
    export YC_FOLDER_ID=$(yc config get folder-id)

## SSH

Virtual machine can be accessed using `~/.ssh/id_rsa_app_server` private key.
You should provide `~/.ssh/id_rsa_app_server.pub` and `~/.ssh/id_rsa_app_server`
key pairs before applying the configuration.

Key's path can be overridden. Look at `variables.tf`.
