{
  description = "Try-phi front end";

  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    gitignore.follows = "my-inputs/gitignore";
    my-codium.follows = "my-inputs/my-codium";
    # poetry2nix.follows = "inputs/poetry2nix";
    poetry2nix = {
      url = "github:br4ch1st0chr0n3/poetry2nix/patch-1";
      # flake = false;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , gitignore
    , my-codium
    , my-inputs
    , poetry2nix
    }:
      with flake-utils.lib;
      eachDefaultSystem
        (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          dotenvFile = "app.env";

          tools = {
            inherit (pkgs) poetry python310;
            inherit (pkgs.python310Packages) python-dotenv;
          };

          inherit (my-codium.tools.${system})
            mkShellApp
            mkShellApps
            mkDevShellsWithDefault
            ;

          scripts = mkShellApps {
            run-start = {
              runtimeInputs = [ tools.python-dotenv tools.poetry];
              text = ''
                poetry run app
              '';
            };
          };
          updateDependencies = mkShellApp {
            runtimeInputs = [ tools.poetry ];
            name = "poetry-update-dependencies";
            text = ''
              poetry update
              poetry install
            '';
          };
          activateEnv = mkShellApp {
            name = "activate-env";
            runtimeInputs = [ tools.poetry ];
            text = ''
              source .venv/bin/activate
              poetry env use $PWD/.venv/bin/python
            '';
          };

        in
        {
          inherit scripts;
          packages = {
            inherit updateDependencies;
          };
          devShells = mkDevShellsWithDefault
            {
              buildInputs = builtins.attrValues (tools // scripts // { inherit updateDependencies; inherit activateEnv; });
              shellHook = ''${activateEnv.name}'';
            }
            {
              fish = { };
            };
        }) // { inherit (my-inputs) formatter; };
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
