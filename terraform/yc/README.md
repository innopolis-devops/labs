# Yandex cloud terraform module

This module contains manifests for creating a virtual machine (VM) instance in yandex cloud. It outputs the external IP address of the instance that can be used to connect to the machine.

## Usage

### Key

To use the module you need to login to the cloud somehow. The method used here is through service accound key file with name "key.json". You can read how to create them [here](https://cloud.yandex.com/en/docs/iam/operations/iam-token/create-for-sa#keys-create).

Or modify the manifest and use any [other authentication method](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#configuration-reference)

### SSH key

The configuration adds public key from "~/.ssh/id_rsa.pub" into the VM so that machine that applied the terraform changes can login into VM easily. You can configure the file or choose some other in the manifest.
