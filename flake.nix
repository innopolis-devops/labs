{
  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    my-codium.follows = "my-inputs/my-codium";
    nix-vscode-marketplace.follows = "my-inputs/nix-vscode-marketplace";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , my-codium
    , my-inputs
    , nix-vscode-marketplace
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (my-codium.tools.${system})
        writeSettingsJson
        settingsNix
        toList
        shellTools
        codium
        ;

      appPython = "app_python";
      appPurescript = "app_purescript";

      writeSettings = writeSettingsJson
        {
          inherit (settingsNix)
            todo-tree
            files
            editor
            gitlens
            git
            nix-ide
            workbench
            ;
          ide-purescript =
            (settingsNix.ide-purescript or { }) // {
              "purescript.outputDirectory" = "./${appPurescript}/output/";
              "purescript.packagePath" = "./${appPurescript}";
              "purescript.sourcePath" = "./${appPurescript}/src";
            };
          python = settingsNix.python // {
            "python.defaultInterpreterPath" = "\${workspaceFolder}/app_python/.venv/bin/python3";
          };
          formatters = {
            "[html]" = {
              "editor.defaultFormatter" = "monosans.djlint";
            };
            "[markdown]" = {
              "editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
            };
          };
          linters = {
            "python.linting.pylintEnabled" = true;
          };
        };

      tools = (toList {
        inherit (shellTools) nix purescript;
      }) ++ (builtins.attrValues {
        inherit (pkgs) docker;
      });

      codiumWithSettings = pkgs.mkShell {
        buildInputs = [ writeSettings codium ];
        shellHook = ''
          write-settings-json
          codium .
        '';
      };
    in
    {
      devShells =
        {
          default = pkgs.mkShell {
            name = "dev-tools";
            buildInputs = tools;
          };
          codium = codiumWithSettings;
          app-purescript = pkgs.mkShell {
            shellHook = ''
              (cd ${appPurescript} && nix develop .#dev)
            '';
          };
          app-python = pkgs.mkShell {
            shellHook = ''
              (cd ${appPython} && nix develop .#dev)
            '';
          };
          app-python-docker = pkgs.mkShell {
            shellHook = ''
              docker build -t ${appPython} ${appPython}
              docker run -d --name ${appPython} -p 8002:8002 ${appPython}
              docker container logs -f ${appPython}
            '';
          };
          app-python-docker-rm = pkgs.mkShell {
            shellHook = ''
              docker stop ${appPython}
              docker rm ${appPython}
            '';
          };
          app-purescript-docker-build = pkgs.mkShell {
            shellHook = ''
              docker build -t ${appPurescript} ${appPurescript}
            '';
          };
          app-purescript-docker = pkgs.mkShell {
            shellHook = ''
              nix develop .#app-purescript-docker-build -c bash -c '
                docker run -d --name ${appPurescript} -p 8003:8003 ${appPurescript}
                docker container logs -f ${appPurescript}
              '
            '';
          };
          app-purescript-docker-rm = pkgs.mkShell {
            shellHook = ''
              docker stop ${appPurescript}
              docker rm ${appPurescript}
            '';
          };
        };
    });

  nixConfig = {
    extra-substituters = [
      https://haskell-language-server.cachix.org
      https://nix-community.cachix.org
      https://hydra.iohk.io
      https://br4ch1st0chr0n3.cachix.org
    ];
    extra-trusted-public-keys = [
      haskell-language-server.cachix.org-1:juFfHrwkOxqIOZShtC4YC1uT1bBcq2RSvC7OMKx0Nz8=
      nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
      hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=
      br4ch1st0chr0n3.cachix.org-1:o1FA93L5vL4LWi+jk2ECFk1L1rDlMoTH21R1FHtSKaU=
    ];
  };
}
