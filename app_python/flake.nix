{
  description = "app_python flake";

  inputs = {
    nixpkgs_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/nixpkgs;
    flake-utils_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/flake-utils;
    drv-tools.url = github:br4ch1st0chr0n3/flakes?dir=drv-tools;
    nixpkgs.follows = "nixpkgs_/nixpkgs";
    flake-utils.follows = "flake-utils_/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , drv-tools
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
            ;

          applyN = genOp: n: op: nul: builtins.foldl' op nul (builtins.genList genOp n);
          applyN_ = applyN (x: x);
          whenRootAtDepth = depth: ''when inside `$PROJECT_ROOT/${applyN_ depth (dir: _: builtins.baseNameOf dir) ./.}`'';

          scripts = mkShellApps {
            run-start = {
              text = ''poetry run app'';
              runtimeInputs = [ pkgs.poetry ];
              longDescription = ''Run `app` ${whenRootAtDepth 2}'';
            };
            update-dependencies = {
              name = "poetry-update-dependencies";
              text = ''
                poetry update
                poetry install
              '';
              runtimeInputs = [ pkgs.poetry ];
              longDescription = ''Update `venv` ${whenRootAtDepth 2}'';
            };
          };
        in
        {
          packages = {
            inherit scripts;
          };
          devShells = mkDevShellsWithDefault
            {
              buildInputs = (builtins.attrValues scripts) ++ [ pkgs.poetry ];
              shellHook = ''
                source .venv/bin/activate
                poetry env use $PWD/.venv/bin/python
              '';
            }
            {
              tools = {
                buildInputs = (builtins.attrValues { inherit updateDependencies; })
                ;
              };
            }
          ;
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
