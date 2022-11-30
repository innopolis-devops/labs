# TODO
{ appPurescript, appPython, pkgs, drv-tools, system }:
let
  inherit (drv-tools.functions.${system}) mergeValues;
  name = "Caching";
  ubuntu20 = "ubuntu-20.04";
  ubuntu22 = "ubuntu-22.04";
  ubuntu20_ = "ubuntu-20";
  ubuntu22_ = "ubuntu-22";
  macos12 = "macos-12";
  macos11 = "macos-11";
  CACHIX_CACHE_ = "CACHIX_CACHE";
  mainOS = ubuntu20;
  extraNixConfig = ''
    access-tokens = github.com=${expr ns.secrets.GITHUB_TOKEN}
    substituters = https://cache.nixos.org/ https://nix-community.cachix.org https://hydra.iohk.io https://haskell-language-server.cachix.org https://deemp.cachix.org
    trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= haskell-language-server.cachix.org-1:juFfHrwkOxqIOZShtC4YC1uT1bBcq2RSvC7OMKx0Nz8= deemp.cachix.org-1:o1FA93L5vL4LWi+jk2ECFk1L1rDlMoTH21R1FHtSKaU=
  '';
  installURL = https://releases.nixos.org/nix/nix-2.11.1/install;
  configGitActions = ''
    git config user.name github-actions
    git config user.email github-actions@github.com
  '';

  apps = [ appPurescript appPython ];
  oss = [ ubuntu20 ubuntu22 ];

  expr = exp: "$" + "{{ ${builtins.toString exp} }}";
  mkAccessor = name: attrs@{ ... }: builtins.mapAttrs (name_: _: "${name}.${name_}") attrs;
  mkAccessors = attrs@{ ... }: builtins.mapAttrs mkAccessor attrs;
  insertListIf = cond: list: if cond then list else [ ];
  inherit (pkgs.lib.attrsets) genAttrs;
  changed-files-app = app: "changed-files-${app}";

  ns = mkAccessors {
    secrets = {
      SNYK_TOKEN = "";
      CACHIX_CACHE = "";
      CACHIX_AUTH_TOKEN = "";
      GITHUB_TOKEN = "";
      DOCKER_HUB_PAT = "";
      DOCKER_HUB_USERNAME = "";
    };
    github = {
      sha = "";
    };
  };

  actions = {
    logInToCachix = {
      name = "Log in to Cachix";
      uses = "cachix/cachix-action@v12";
      "with" = {
        name = expr ns.secrets.CACHIX_CACHE;
        authToken = expr ns.secrets.CACHIX_AUTH_TOKEN;
      };
    };
    installNix = {
      uses = "cachix/install-nix-action@v18";
      "with" = {
        extra_nix_config = extraNixConfig;
        install_url = installURL;
      };
    };
    checkout = { uses = "actions/checkout@v3"; };
  };

  on = {
    schedule = [
      # https://crontab.guru/#30_5,17_*_*_*
      # * is a special character in YAML so you have to quote this string
      { cron = "0 0 * * *"; }
    ];
    pull_request = { };
    push = { };
    workflow_dispatch = { };
  };

  app-ci =
    let
      matrix = {
        "${appPurescript}" = {
          snyk = {
            language = "node";
            language-title = "(Node.js)";
          };
        };
        "${appPython}" = {
          snyk = {
            language = "python";
            language-title = "(Python)";
          };
        };
      };
    in
    builtins.mapAttrs
      (app: val:
        let changed-files-app_ = changed-files-app app; in
        {
          name = "CI for ${app}";
          needs = [ changed-files-app_ ];
          "if" = "needs.${changed-files-app_}.outputs.${app} == 'true'";
          defaults = {
            run = {
              working-directory = app;
            };
          };
          runs-on = "ubuntu-20.04";
          steps = [
            { uses = "actions/checkout@v3"; }
            actions.installNix
          ]
          ++
          (
            # - No need to lint PureScript since it's strongly statically typed
            insertListIf (app == appPython) [
              {
                name = "Linting";
                run = "nix run .#lint";
              }
            ]
          )
          ++
          (
            # No need to build app_python as it's an interpretable lang
            insertListIf (app == appPurescript) [
              {
                name = "Build app";
                run = "nix run .#build";
              }
            ]
          )
          ++
          [
            {
              name = "Run Snyk to check for vulnerabilities ${val.snyk.language-title}";
              uses = "snyk/actions/${ val.snyk.language }@master";
              continue-on-error = true;
              "with" = {
                args = "--all-projects";
              };
              env = {
                SNYK_TOKEN = expr ns.secrets.SNYK_TOKEN;
              };
            }
            {
              name = "Test";
              run = "nix run .#test";
            }
          ];
        })
      matrix;
  changed-files_ = "changed-files";
  changed-files =
    genAttrs apps (app:
      {
        name = "Check if ${app} has any modified files";
        runs-on = ubuntu20;
        outputs = {
          "${app}" = expr "steps.${changed-files_}.outputs.any_modified";
        };
        steps = [
          (actions.checkout // {
            "with" = { fetch-depth = 0; };
          })
          {
            name = "Get changed files";
            id = changed-files_;
            uses = "tj-actions/changed-files@v32";
            "with" = {
              sha = expr ns.github.sha;
              files = "${app}/**";
            };
          }
          {
            name = "List changed files";
            "if" = "steps.${changed-files_}.outputs.any_modified == 'true'";
            run = ''
              echo "One or more files in the docs folder has changed."
              echo "List all the files that have changed: ${expr "steps.${changed-files_}.outputs.all_changed_files" }"
            '';
          }
        ];
      }
    );

  caching =
    let
      gitNixAction = { actionName, action, args ? "" }: ''
        git pull --rebase --autostash
        nix run ${action} ${args}
        git diff --exit-code || git commit -a -m 'action: ${actionName}'
        git push
      '';
      matrix = {
        "${ubuntu20_}" = ubuntu20;
        "${ubuntu22_}" = ubuntu22;
        "${macos11}" = macos11;
        "${macos12}" = macos12;
      };
    in
    builtins.mapAttrs
      (os_: os:
        {
          name = ''Caching on ${ os }'';
          runs-on = os;
          steps = [
            actions.checkout
            actions.installNix
          ]
          ++
          (insertListIf (os == mainOS)
            [
              {
                name = "Configure git";
                run = configGitActions;
              }
              {
                name = "Update locks";
                run = ''
                  ${gitNixAction { actionName = "update flake.lock-s"; action = ".#updateLocks"; }}
                '';
              }
            ]
          ) ++ [
            actions.logInToCachix
            {
              name = "Cache flakes";
              run = "${CACHIX_CACHE_}=${expr ns.secrets.CACHIX_CACHE } nix run .#pushToCachix";
            }
          ];
        }
      )
      matrix;

  # a.purs.ab
  push-to-docker-hub =
    genAttrs apps
      (app:
        let changed-files-app_ = changed-files-app app; in
        {
          name = "Push '${app}' to Docker Hub";
          needs = [ changed-files-app_ ];
          "if" = "needs.${changed-files-app_}.outputs.${app} == 'true'";
          runs-on = ubuntu20;
          steps = [
            actions.checkout
            {
              name = "Hadolint Action";
              uses = "hadolint/hadolint-action@v2.0.0";
              "with" = {
                no-fail = true;
                verbose = true;
                dockerfile = "${ app }/Dockerfile";
              };
            }
            {
              name = "Set up Docker Buildx";
              uses = "docker/setup-buildx-action@v2";
            }
            {
              name = "Log in to Docker Hub";
              uses = "docker/login-action@v2";
              "with" = {
                username = expr ns.secrets.DOCKER_HUB_USERNAME;
                password = expr ns.secrets.DOCKER_HUB_PAT;
              };
            }
            {
              name = "Build and push";
              uses = "docker/build-push-action@v3";
              env = {
                DOCKER_NAME = expr ns.secrets.DOCKER_HUB_USERNAME;
              };
              "with" = {
                # https://github.com/docker/build-push-action#path-context
                context = app;
                push = true;
                tags = "${expr ns.secrets.DOCKER_HUB_USERNAME}/${app}:latest";
              };
            }
          ];
        });

  # app-ci.appPurescript
  mkJobs = jobs_@{ ... }: mergeValues (mergeValues (
    builtins.mapAttrs
      (
        name: val: {
          "${name}" = mergeValues (
            builtins.mapAttrs
              (name_: val_: {
                "${name}-${name_}" = val_;
              })
              val
          );
        }
      )
      jobs_
  ));
  jobs = mkJobs {
    inherit app-ci changed-files push-to-docker-hub caching;
  };
in
{
  inherit on jobs name;
}
