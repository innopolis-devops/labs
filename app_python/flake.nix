{
  description = "Try-phi front end";

  inputs = {
    inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "inputs/nixpkgs";
    flake-utils.follows = "inputs/flake-utils";
    gitignore.follows = "inputs/gitignore";
    # poetry2nix.follows = "inputs/poetry2nix";
    poetry2nix = {
      url = "github:br4ch1st0chr0n3/poetry2nix/patch-1";
      # flake = false;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , inputs
    , nixpkgs
    , flake-utils
    , gitignore
    , poetry2nix
    }:
      with flake-utils.lib;
      eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        myTools =
          builtins.attrValues {
            inherit (pkgs) poetry python310;
          };

        # Not really needed for now -->
        overlay = pkgs.lib.composeManyExtensions [
          poetry2nix.overlay
          (final: prev: {
            env = prev.poetry2nix.mkPoetryEnv {
              projectDir = gitignore.lib.gitignoreSource ./.;
              python = pkgs.python310;
            };
            editablePackageSources = {
              my-app = ./app;
            };
          })
        ];
        p2nix = pkgs.extend overlay;
        # <--
        dotenvFile = "app.env";
        env = poetry2nix.mkPoetryEnv {
          python = pkgs.python310;
          projectDir = ./.;
        };
        app = appName:
          pkgs.writeShellApplication {
            name = "write-dotenv";
            runtimeInputs = [ (pkgs.python310Packages.python-dotenv) ];
            text = ''
              dotenv -f ${appName}/.env set ${DOCKER_PORT}
            '';
          };
      in
      {
        packages = {
          default = pkgs.runCommand "env-test" { } ''
            ${env}/bin/python --version
          '' // { inherit env; };
        };
        devShells = {
          default = pkgs.mkShell {
            buildInputs = myTools;
            TMP = "/tmp";
          };
          make-poetry-env = pkgs.mkShell {
            # https://stackoverflow.com/a/64434542
            buildInputs = myTools;
            shellHook = ''
              nix develop -c bash -c '
                poetry config virtualenvs.in-project true
                poetry install
              '
            '';
          };
          dev = pkgs.mkShell {
            shellHook = ''
              nix develop .#make-poetry-env -c bash -c '
                poetry run uvicorn --reload --host=$HOST --port=$PORT app.main:app
              '
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
