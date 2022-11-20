{
  description = "app_python flake";

  inputs = {
    nixpkgs_.url = github:deemp/flakes?dir=source-flake/nixpkgs;
    flake-utils_.url = github:deemp/flakes?dir=source-flake/flake-utils;
    drv-tools.url = github:deemp/flakes?dir=drv-tools;
    python-tools.url = github:deemp/flakes?dir=language-tools/python;
    nixpkgs.follows = "nixpkgs_/nixpkgs";
    flake-utils.follows = "flake-utils_/flake-utils";
    my-devshell.url = github:deemp/flakes?dir=devshell;
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , drv-tools
    , python-tools
    , my-devshell
    , ...
    }:
      with flake-utils.lib;
      eachDefaultSystem
        (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          dotenvFile = "app.env";

          inherit (drv-tools.functions.${system})
            mkShellApp
            mkShellApps
            mkDevShellsWithDefault
            mkBin
            applyN
            ;

          whenRootAtDepth = depth: ''when inside `$PROJECT_ROOT/${builtins.baseNameOf ./.}`'';

          # TODO enable disabled errors after command
          # https://unix.stackexchange.com/a/310963 
          withoutErrors = command: ''
            set +e
            ${activateVenv}
            poetry install
            ${command}
            echo ""
          '';
          inherit (python-tools.snippets.${system}) activateVenv;
          scripts = mkShellApps {
            run-start =
              let appName = (pkgs.lib.modules.importTOML ./pyproject.toml).config.tool.poetry.name;
              in
              {
                text = withoutErrors ''
                  poetry run ${appName}
                '';
                longDescription = ''Run `${appName}` ${whenRootAtDepth 2}'';
                runtimeInputs = [ pkgs.poetry ];
              };
            test = {
              text = withoutErrors ''
                poetry run pytest -rX || echo ""
              '';
              runtimeInputs = [ pkgs.poetry ];
            };
            lint = {
              text = withoutErrors ''
                poetry run pylint app
              '';
              runtimeInputs = [ pkgs.poetry ];
            };
          };
          devshell = my-devshell.devshell.${system};
        in
        {
          packages = scripts;
          inherit scripts;
          devShells.default = devshell.mkShell {
            packages = builtins.attrValues scripts ++ [ pkgs.poetry ];
            bash.extra = activateVenv;
            commands = [
              {
                name = "${scripts.run-start.name}";
                category = "scripts";
                help = "start app";
              }
              {
                name = "${scripts.test.name}";
                category = "scripts";
                help = "test app";
              }
              {
                name = "${scripts.lint.name}";
                category = "scripts";
                help = "lint Python code";
              }
              {
                name = "poetry";
              }
            ];
          };
        });
  nixConfig = {
    extra-substituters = [
      https://haskell-language-server.cachix.org
      https://nix-community.cachix.org
      https://hydra.iohk.io
      https://deemp.cachix.org
    ];
    extra-trusted-public-keys = [
      haskell-language-server.cachix.org-1:juFfHrwkOxqIOZShtC4YC1uT1bBcq2RSvC7OMKx0Nz8=
      nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
      hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=
      deemp.cachix.org-1:o1FA93L5vL4LWi+jk2ECFk1L1rDlMoTH21R1FHtSKaU=
    ];
  };
}
