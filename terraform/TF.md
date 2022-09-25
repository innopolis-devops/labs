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
- Prefer remotely managed state. Use `terraform remote config` to configure remote state.
- Use variables for any sensitive information, and make use of `*.tfvars` files and `-var-file` option.
- Pin the Terraform provider to a specific version. Use `terraform providers` to list available providers.
- Give meaningful names to the resources you create.
- Do not add the state file to VCS if it contains any sensitive information (prefer a remote in that case).
- Separate the configuration over multiple files based on the natural grouping of these resources.
- For large infrastructures, use [Terraform modules](https://www.terraform.io/docs/language/modules/syntax.html).
- A possible folder structure for small projects would use `main.tf` (to configure the infrastructure resources), `variables.tf` (to define the variables), and `outputs.tf` (to configure the outputs).
