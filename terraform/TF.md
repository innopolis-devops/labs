# Terraform reprot

## Docker

Output of the `terraform show`:

<img src=".github/docker_1.png" style="zoom:60%;" />

Output of the `terraform state list`:

![](.github/docker_2.png)

Change Infrastructure:

<img src=".github/docker_3.png" style="zoom:60%;" />

Output of the `terraform output`:

![](.github/docker_4.png)

## Yandex

To run read [manual](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs) and use the following command to init environment:

```bash
export YC_TOKEN=...
export YC_CLOUD_ID=...
export YC_FOLDER_ID=...
```

Output of the `terraform show`:

<img src=".github/yandex_1.png" style="zoom:60%;" />

Output of the `terraform state list`:

![](.github/yandex_2.png)

Change Infrastructure:

<img src=".github/yandex_3.png" style="zoom:60%;" />

Output of the `terraform output`:

![](.github/yandex_4.png)