# Terraform Best Practicies

## 1. Separate configuration files

- main.tf - call modules, locals, and data sources to create all resources.
- variables.tf - variable declarations used in main.
- outputs.tf - outputs from the resources created in main.

## 2. Variables Conventions

- declare variables in variables.tf
- give meaningful descruptions
- avoid hardcoding variables

## 3. Use build-in formatter

- use `terraform fmt` to style files
