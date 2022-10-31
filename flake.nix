{
  inputs = {
    nixpkgs_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/nixpkgs;
    flake-utils_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/flake-utils;
    drv-tools.url = github:br4ch1st0chr0n3/flakes?dir=drv-tools;
    flake-tools.url = github:br4ch1st0chr0n3/flakes?dir=flake-tools;
    terrafix.url = github:br4ch1st0chr0n3/terrafix;
    easy-purescript-nix_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/easy-purescript-nix;
    python-tools.url = github:br4ch1st0chr0n3/flakes?dir=language-tools/python;
    nixpkgs.follows = "nixpkgs_/nixpkgs";
    flake-utils.follows = "flake-utils_/flake-utils";
    my-codium.url = github:br4ch1st0chr0n3/flakes?dir=codium;
    env2json.url = github:br4ch1st0chr0n3/flakes?dir=env2json;
    json2md.url = github:br4ch1st0chr0n3/flakes?dir=json2md;
    easy-purescript-nix.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/easy-purescript-nix;
    refmt.url = github:br4ch1st0chr0n3/refmt/master;

    # app-purescript.url = path:./app_purescript;
    app-python.url = "github:br4ch1st0chr0n3/devops-labs/lab3?dir=app_python";
    # app-python.url = path:./app_python;
    app-purescript.url = "github:br4ch1st0chr0n3/devops-labs/lab3?dir=app_purescript";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , my-codium
    , json2md
    , app-purescript
    , app-python
    , env2json
    , flake-tools
    , easy-purescript-nix
    , drv-tools
    , python-tools
    , refmt
    , terrafix
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      app-python-pkgs = app-python.packages.${system};
      app-purescript-pkgs = app-purescript.packages.${system};
      rootDir = ./.;

      inherit (import ./.nix/default.nix {
        inherit nixpkgs system my-codium app-python app-purescript
          rootDir json2md env2json drv-tools flake-tools easy-purescript-nix
          python-tools refmt terrafix
          ;
      }) devShells scripts codium flakesUtils
        flakesToggleRelativePaths_ configWriters commands;
    in
    {
      devShells = devShells;
      packages = {
        default = codium;
        pushToCachix = flakesUtils.flakesPushToCachix;
        updateLocks = flakesUtils.flakesUpdate;
        format = flakesUtils.flakesFormat;
        togglePaths = flakesToggleRelativePaths_;
      } // scripts // configWriters // commands.apps;
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


