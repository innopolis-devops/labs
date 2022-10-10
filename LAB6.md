# 6

## Ansible 2

### 6 points

In this lab you need to use ansible to prepare a CD process for your application.

1. Create an ansible role for your application's docker image deployment.
2. Update a playbook.
3. Run your playbook (deploy the role) and provide 50 last lines of the output of the your deployment command in the `ANSIBLE.md` file.

### 4 points

1. Group tasks with blocks.
2. For your web_app role set the role dependency - the `docker` role.
3. Apply tags.
4. Create a yml file with **Wipe** logic for your app (remove your docker container and all related files), test it. It should be enabled by a variable, like `web_app_full_wipe=true`.
5. Use different tag for the **Wipe** part, so it should be possible to run it separately from the main tasks.
6. Create a `docker-compose.yml` file for your app.
7. Use a `template` module to deliver your `docker-compose.yml` file to a server.

Suggested structure:

   ```sh
   .
   |-- defaults
   |   `-- main.yml
   |-- meta
   |   `-- main.yml
   |-- tasks
   |   |-- 0-wipe.yml
   |   `-- main.yml
   `-- templates
      `-- docker-compose.yml.j2
   ```

## Bonus

### 4 points

CD improvement:

1. Create an extra playbook for your bonus app, reuse your existing role.

Suggested structure:

   ```sh
   .
   `--ansible
       `-- playbooks
           `-- dev
               |-- app_python
               |   `-- main.yaml
               `-- app_go
                   `-- main.yaml
   ```

Application improvements:

1. Implement any metrics to your app.
2. Implement a healthcheck.