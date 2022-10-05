{
  description = "app_purescript flake";

  inputs = {
    nixpkgs_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/nixpkgs;
    flake-utils_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/flake-utils;
    easy-purescript-nix_.url = github:br4ch1st0chr0n3/flakes?dir=source-flake/easy-purescript-nix;
    drv-tools.url = github:br4ch1st0chr0n3/flakes?dir=drv-tools;
    nixpkgs.follows = "nixpkgs_/nixpkgs";
    flake-utils.follows = "flake-utils_/flake-utils";
    easy-purescript-nix.follows = "easy-purescript-nix_/easy-purescript-nix";
  };

  outputs =
    { self
    , nixpkgs
    , easy-purescript-nix
    , flake-utils
    , drv-tools
    , ...
    }:
      with flake-utils.lib;
      eachDefaultSystem
        (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (drv-tools.functions.${system})
            mkShellApp
            mkShellApps
            mkDevShellsWithDefault
            ;

          tools = {
            inherit (import easy-purescript-nix { inherit pkgs; }) purs-0_15_4 spago;
            inherit (pkgs) nodejs-16_x;
            inherit (pkgs.python310Packages) python-dotenv;
          };

          scripts =
            mkShellApps
              {
                run-start =
                  {
                    runtimeInputs = builtins.attrValues { inherit (tools) python-dotenv spago nodejs-16_x; };
                    text =
                      let
                        dotenvFile = "app.env";
                        spago_ = "spago";
                      in
                      ''
                        ${spago_} install
                        ${spago_} build
                        source <( dotenv -f ${dotenvFile} list )
                        npx parcel serve -p $PORT --host $HOST dev/index.html
                      '';
                  };
              };

          devShells = mkDevShellsWithDefault
            {
              buildInputs = builtins.attrValues scripts;
            }
            {
              fish = { };
            };
        in
        {
          inherit scripts;
          inherit devShells;
        })
      // { inherit (my-inputs) formatter; };
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
