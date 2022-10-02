{
  description = "Try-phi front end";

  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    gitignore.follows = "my-inputs/gitignore";
    easy-purescript-nix.follows = "my-inputs/easy-purescript-nix";
    dream2nix.follows = "my-inputs/dream2nix";
    my-codium.follows = "my-inputs/my-codium";
    spago-nix.url = "github:ngua/spago.nix";
  };

  outputs =
    { self
    , my-inputs
    , nixpkgs
    , easy-purescript-nix
    , flake-utils
    , gitignore
    , dream2nix
    , spago-nix
    , my-codium
    }:
      with flake-utils.lib;
      eachDefaultSystem
        (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (my-codium.tools.${system})
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
