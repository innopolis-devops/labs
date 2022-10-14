# dockey_deploy role

## Capabilities

- Wiping the app
  - Stops the container
  - Removes the app directory containing `docker-compose.yml`
  - Wipe is optional and only happens when `web_app_full_wipe` variable is specified
- Launching the app
  - Creates the directory for the app (passed as `docker_compose_directory` variable)
  - Creates `docker-compose.yml` from a template

    Requires the following variables configured:

    - `image_name` — the image name to be run
    - `external_port` — external (host) port to be bound
    - `internal_port` — internal (app) port to be bound
  - Launches the container using Docker Compose
