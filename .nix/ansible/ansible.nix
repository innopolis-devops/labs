extensions@{ yml, cfg }:
let
  file = __extension: __expression: { inherit __extension __expression; };
  yml = file extensions.yml;
  cfg = file extensions.cfg;
in
{
  ansible = cfg
    {
      defaults =
        {
          roles_path = "roles";
          inventory = "inventory";
          inventory_plugins = "plugins/inventory";
        };
    };
  inventory.yacloud_compute = yml
    {
      plugin = "yacloud_compute";
      yacloud_token_file = "yacloud_token.iam";
    };
  playbooks.dev =
    {
      cloud = yml [
        {
          hosts = "yacloud";
          become = true;
          remote_user = "ubuntu";
          roles = [
            "docker"
          ];
        }
      ];
      main = yml
        [
          {
            hosts = "docker";
            become = true;
            roles = [
              "docker"
            ];
          }
        ];
    };
  roles = {
    docker = {
      defaults.main = yml
        {
          # Edition can be one of: 'ce' (Community Edition) or 'ee' (Enterprise Edition).
          docker_edition = "ce";
          docker_packages = [
            "docker-{{ docker_edition }}"
            "docker-{{ docker_edition }}-cli"
            "docker-{{ docker_edition }}-rootless-extras"
            "containerd.io"
          ];

          docker_packages_state = "present";

          # Service options.
          docker_service_manage = true;
          docker_service_state = "started";
          docker_service_enabled = true;
          docker_restart_handler_state = "restarted";

          # Docker Compose Plugin options.
          docker_install_compose_plugin = false;
          docker_compose_package = "docker-compose-plugin";
          docker_compose_package_state = "present";

          # Docker Compose options.
          docker_install_compose = true;
          docker_compose_version = "v2.11.1";
          docker_compose_arch = "{{ ansible_architecture }}";
          docker_compose_url = "https://github.com/docker/compose/releases/download/{{ docker_compose_version }}/docker-compose-linux-{{ docker_compose_arch }}";
          docker_compose_path = "/usr/local/bin/docker-compose";

          # Docker repo URL.
          docker_repo_url = "https://download.docker.com/linux";

          # Used only for Debian/Ubuntu. Switch 'stable' to 'nightly' if needed.
          docker_apt_release_channel = "stable";
          docker_apt_arch = "{{ 'arm64' if ansible_architecture == 'aarch64' else 'amd64' }}";
          docker_apt_repository = "deb [arch={{ docker_apt_arch }}] {{ docker_repo_url }}/{{ ansible_distribution | lower }} {{ ansible_distribution_release }} {{ docker_apt_release_channel }}";
          docker_apt_ignore_key_error = true;
          docker_apt_gpg_key = "{{ docker_repo_url }}/{{ ansible_distribution | lower }}/gpg";

          # Used only for RedHat/CentOS/Fedora.
          docker_yum_repo_url = "{{ docker_repo_url }}/{{ (ansible_distribution == 'Fedora') | ternary('fedora','centos') }}/docker-{{ docker_edition }}.repo";
          docker_yum_repo_enable_nightly = "0";
          docker_yum_repo_enable_test = "0";
          docker_yum_gpg_key = "{{ docker_repo_url }}/centos/gpg";

          # A list of users who will be added to the docker group.
          docker_users = [ ];

          # Docker daemon options as a dict
          docker_daemon_options = { };
        };

      handlers.main = yml
        [
          {
            name = "restart docker";
            service = {
              name = "docker";
              state = "{{ docker_restart_handler_state }}";
            };
            ignore_errors = "{{ ansible_check_mode }}";
            when = "docker_service_manage | bool";
          }
        ];
      tasks = {
        main = yml
          [
            {
              include_tasks = "setup-Debian.yml";
              when = "ansible_os_family == 'Debian'";
            }
            {
              ignore_errors = "{{ ansible_check_mode }}";
              name = "Install Docker packages.";
              notify = "restart docker";
              package = {
                name = "{{ docker_packages }}";
                state = "{{ docker_packages_state }}";
              };
              when = "ansible_version.full is version_compare('2.12', '<') or ansible_os_family not in ['RedHat', 'Debian']";
            }
            {
              ignore_errors = "{{ ansible_check_mode }}";
              name = "Install Docker packages (with downgrade option).";
              notify = "restart docker";
              package = {
                allow_downgrade = true;
                name = "{{ docker_packages }}";
                state = "{{ docker_packages_state }}";
              };
              when = "ansible_version.full is version_compare('2.12', '>=') and ansible_os_family in ['RedHat', 'Debian']";
            }
            {
              ignore_errors = "{{ ansible_check_mode }}";
              name = "Install docker-compose plugin.";
              notify = "restart docker";
              package = {
                name = "{{ docker_compose_package }}";
                state = "{{ docker_compose_package_state }}";
              };
              when = "docker_install_compose_plugin | bool == true and (ansible_version.full is version_compare('2.12', '<') or ansible_os_family not in ['RedHat', 'Debian'])";
            }
            {
              ignore_errors = "{{ ansible_check_mode }}";
              name = "Install docker-compose-plugin (with downgrade option).";
              notify = "restart docker";
              package = {
                allow_downgrade = true;
                name = "{{ docker_compose_package }}";
                state = "{{ docker_compose_package_state }}";
              };
              when = "docker_install_compose_plugin | bool == true and ansible_version.full is version_compare('2.12', '>=') and ansible_os_family in ['RedHat', 'Debian']";
            }
            {
              file = {
                mode = 493;
                path = "/etc/docker";
                state = "directory";
              };
              name = "Ensure /etc/docker/ directory exists.";
              when = "docker_daemon_options.keys() | length > 0";
            }
            {
              copy = {
                content = "{{ docker_daemon_options | to_nice_json }}";
                dest = "/etc/docker/daemon.json";
                mode = 420;
              };
              name = "Configure Docker daemon options.";
              notify = "restart docker";
              when = "docker_daemon_options.keys() | length > 0";
            }
            {
              ignore_errors = "{{ ansible_check_mode }}";
              name = "Ensure Docker is started and enabled at boot.";
              service = {
                enabled = "{{ docker_service_enabled }}";
                name = "docker";
                state = "{{ docker_service_state }}";
              };
              when = "docker_service_manage | bool";
            }
            {
              meta = "flush_handlers";
              name = "Ensure handlers are notified now to avoid firewall conflicts.";
            }
            {
              include_tasks = "docker-compose.yml";
              when = "docker_install_compose | bool";
            }
            {
              getent = {
                database = "group";
                key = "docker";
                split = ":";
              };
              name = "Get docker group info using getent.";
              when = "docker_users | length > 0";
            }
            {
              name = "Check if there are any users to add to the docker group.";
              set_fact = { at_least_one_user_to_modify = true; };
              when = [
                "docker_users | length > 0"
                "item not in ansible_facts.getent_group[\"docker\"][2]"
              ];
              with_items = "{{ docker_users }}";
            }
            {
              include_tasks = "docker-users.yml";
              when = "at_least_one_user_to_modify is defined";
            }
          ];

        docker-users = yml
          [
            {
              name = "Ensure docker users are added to the docker group.";
              user = {
                name = "{{ item }}";
                groups = "docker";
                append = true;
                with_items = "{{ docker_users }}";
              };
            }
            {
              name = "Reset ssh connection to apply user changes.";
              meta = "reset_connection";
            }
          ];

        docker-compose = yml
          [
            {
              name = "Check current docker-compose version.";
              command = "{{ docker_compose_path }} --version";
              register = "docker_compose_vsn";
              check_mode = false;
              changed_when = false;
              failed_when = false;
            }
            {
              set_fact = {
                docker_compose_current_version = "{{ docker_compose_vsn.stdout | regex_search('(\\d+(\\.\\d+)+)') }}";
              };
              when = "docker_compose_vsn.stdout is defined";
            }
            {
              name = "Delete existing docker-compose version if it's different.";
              file = {
                path = "{{ docker_compose_path }}";
                state = "absent";
              };
              when = ">
                docker_compose_current_version is defined
                and (docker_compose_version | regex_replace('v', '')) not in docker_compose_current_version";
            }
            {
              name = "Install Docker Compose (if configured).";
              get_url = {
                url = "{{ docker_compose_url }}";
                dest = "{{ docker_compose_path }}";
                mode = 0755;
              };
              when = ">
                (docker_compose_current_version is not defined)
                or (docker_compose_current_version|length == 0)
                or (docker_compose_current_version is version((docker_compose_version | regex_replace('v', '')), '<'))";
            }
          ];

        setup-Debian = yml
          [
            {
              name = "Ensure old versions of Docker are not installed.";
              package = { name = [ "docker" "docker-engine" ]; state = "absent"; };
            }
            {
              apt = {
                name = [ "apt-transport-https" "ca-certificates" ];
                state = "present";
              };
              name = "Ensure dependencies are installed.";
            }
            {
              apt = {
                name = "gnupg2";
                state = "present";
              };
              name = "Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).";
              when = "ansible_distribution != 'Ubuntu' or ansible_distribution_version is version('20.04', '<')";
            }
            {
              apt = {
                name = "gnupg";
                state = "present";
              };
              name = "Ensure additional dependencies are installed (on Ubuntu >= 20.04).";
              when = "ansible_distribution == 'Ubuntu' and ansible_distribution_version is version('20.04', '>=')";
            }
            {
              "ansible.builtin.get_url" = {
                dest = "/etc/apt/trusted.gpg.d/docker.asc";
                force = true;
                mode = "0644";
                url = "{{ docker_apt_gpg_key }}";
              };
              ignore_errors = "{{ docker_apt_ignore_key_error }}";
              name = "Add Docker apt key.";
              register = "add_repository_key";
            }
            {
              name = "Ensure curl is present (on older systems without SNI).";
              package = "name=curl state=present";
              when = "add_repository_key is failed";
            }
            {
              args = {
                warn = false;
              };
              name = "Add Docker apt key (alternative for older systems without SNI).";
              shell = "curl -sSL {{ docker_apt_gpg_key }} | apt-key add -\n";
              when = "add_repository_key is failed";
            }
            {
              apt_repository = {
                repo = "{{ docker_apt_repository }}";
                state = "present";
                update_cache = true;
              };
              name = "Add Docker repository.";
            }
          ];
      };
    };
  };

  # plugins.inventory.yacloud_compute
}
