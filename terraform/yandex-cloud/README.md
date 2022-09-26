# Yandex Cloud Terraform configuration

This module contains Terraform configuration for Yandex Cloud.

## Keys

Before running the configuration you should install `yc` and get OAuth key from
Yandex Cloud. Then init profile and use your service account with `admin` role.
Tutorial could be found [here](https://cloud.yandex.ru/docs/cli/quickstart).

## Envs

For running the configuration you should provide required envs, which allows
Terraform access your cloud.

    source init_env.sh

## SSH

Virtual machine can be accessed using `~/.ssh/id_rsa_app_server` private key.
You should provide `~/.ssh/id_rsa_app_server.pub` and `~/.ssh/id_rsa_app_server`
key pairs before applying the configuration.

Key's path can be overridden. Look at `variables.tf`.
