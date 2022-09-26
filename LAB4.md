# 4

## Infrastructure as code

### 6 points

0. You will need a VPN tool for this lab, as Terraform doesn't work in Russia.

1. Get familiar with Terraform tool.
   > [Intro](https://www.terraform.io/intro/index.html)
   > [Best practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
2. Create a `terraform` folder for your workspaces.
3. Create a `TF.md` inside the `terraform` folder.
4. Follow [the Docker tutorial](https://learn.hashicorp.com/collections/terraform/docker-get-started) to build a Docker infrastructure using Terraform.
   * Install it
   * Build Infrastructure
   * Provide the output of following commands in the `TF.md` file:

   ```sh
            terraform show
            terraform state list
   ```

   * Change Infrastructure, provide a part o the log with the applied changes in the `TF.md`.
   * Using Input variables rename your docker container.
   * Finish the tutorial and provide the output of the `terraform output` command in the `TF.md`.

5. Follow [the AWS tutorial](https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started) and all points from the previous step.
6. Create a PR to the forked repo lab4 branch, ask your teammates to review it and review PRs of your teammates.
7. **Create a PR in your own repository from the lab4 branch to the lab3 one.** It will help us with grading.

### 4 more points

1. Use [the Github provider for Terraform](https://registry.terraform.io/providers/integrations/github/latest/docs).
   * Create a directory for your GitHub project inside the `terrafrom` folder.
   * Build GitHub infrastructure - [an example](https://dev.to/pwd9000/manage-and-maintain-github-with-terraform-2k86), prepare `.tf` ﬁles that should include:
       * repository name
       * repository description
       * visibility
       * default branch
       * branch protection rule for the default branch
   * Don't put your token as a variable in the code use an environment variable.
2. Import your existing repository using `terraform import` command. Example: `terraform import "github_repository.labs" "labs"`
3. Apply changes from your terraform config to the repository
4. Provide Terraform related best practices that you applied in the `TF.md` file.

## Bonus

### 2 extra points

1. Disable rebase and squash commits for the repository using terraform. Apply changes.
