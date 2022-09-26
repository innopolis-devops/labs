# Terraform

[Terraform](https://www.terraform.io/) is an open-source tool by [hashicorp](https://www.hashicorp.com/) for building, deploying, and managing infrastructure.
It is a declarative language for describing the structure of your infrastructure (a paradigm known as Infrastructure as Code), and has a lot of plugins to support different types of infrastructure and (cloud) providers.

## Usage

After installing Terraform and writing the `.tf` file describing the infrastructure, run `terraform init` to download the required plugins and modules.
Then run `terraform plan` to see the changes Terraform will make to your infrastructure.
If everything looks good, run `terraform apply` to actually create the infrastructure.


# Terraform best practices

- Use built-in formatter (`terraform fmt`) and validator (`terraform validate`)
- Use `terraform plan` to see what changes will be made
- Use variables for any sensitive information.
- Pin the Terraform provider to a specific version. Use `terraform providers` to list available providers.
- Give meaningful names to the resources you create.
- Separate the configuration over multiple files based on the natural grouping of these resources.
- A possible folder structure for small projects would use `main.tf` (to configure the infrastructure resources), `variables.tf` (to define the variables), and `outputs.tf` (to configure the outputs).


## Note:

On each folder there is ```tf.md``` file including all details about the outputs of some commands like ```terraform show```.
Please take a look at them.
