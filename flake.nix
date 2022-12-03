{
  inputs = {
    nixpkgs_.url = github:deemp/flakes?dir=source-flake/nixpkgs;
    nixpkgs.follows = "nixpkgs_/nixpkgs";
    flake-utils_.url = github:deemp/flakes?dir=source-flake/flake-utils;
    flake-utils.follows = "flake-utils_/flake-utils";
    drv-tools.url = github:deemp/flakes?dir=drv-tools;
    flakes-tools.url = github:deemp/flakes?dir=flakes-tools;
    terrafix.url = github:deemp/terrafix;
    easy-purescript-nix_.url = github:deemp/flakes?dir=source-flake/easy-purescript-nix;
    python-tools.url = github:deemp/flakes?dir=language-tools/python;
    my-codium.url = github:deemp/flakes?dir=codium;
    my-devshell.url = github:deemp/flakes?dir=devshell;
    env2json.url = github:deemp/flakes?dir=env2json;
    json2md.url = github:deemp/flakes?dir=json2md;
    easy-purescript-nix.url = github:deemp/flakes?dir=source-flake/easy-purescript-nix;
    app-python.url = "github:deemp/devops-labs/lab3?dir=app_python";
    app-purescript.url = "github:deemp/devops-labs/lab3?dir=app_purescript";
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
    , flakes-tools
    , easy-purescript-nix
    , drv-tools
    , python-tools
    , terrafix
    , my-devshell
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      app-python-pkgs = app-python.packages.${system};
      app-purescript-pkgs = app-purescript.packages.${system};
      rootDir = ./.;

      inherit (import ./nix-files/default.nix {
        inherit nixpkgs system my-codium app-python app-purescript
          rootDir json2md env2json drv-tools flakes-tools easy-purescript-nix
          python-tools terrafix my-devshell
          ;
      }) devShells flakesTools packages;
    in
    {
      devShells = devShells;
      packages = packages // {
        pushToCachix = flakesTools.pushToCachix;
        updateLocks = flakesTools.updateLocks;
      };
    });

  nixConfig = {
    extra-substituters = [
      "https://haskell-language-server.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.iog.io"
      "https://deemp.cachix.org"
    ];
    extra-trusted-public-keys = [
      "haskell-language-server.cachix.org-1:juFfHrwkOxqIOZShtC4YC1uT1bBcq2RSvC7OMKx0Nz8="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "deemp.cachix.org-1:o1FA93L5vL4LWi+jk2ECFk1L1rDlMoTH21R1FHtSKaU="
    ];
  };
}


