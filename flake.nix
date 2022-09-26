{
  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    my-codium.follows = "my-inputs/my-codium";
    my-json2md.url = "github:br4ch1st0chr0n3/flakes?dir=json2md";
    nix-vscode-marketplace.follows = "my-inputs/nix-vscode-marketplace";
    app-python.url = "./app_python";
    app-purescript.url = "./app_purescript";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , my-codium
    , my-inputs
    , my-json2md
    , app-purescript
    , app-python
    , nix-vscode-marketplace
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      codiumTools = my-codium.tools.${system};
      inherit (codiumTools)
        toList
        shellTools
        extensions
        mkCodium
        writeShellApplicationUnchecked
        mergeValues
        ;

      app-python-pkgs = app-python.packages.${system};
      app-purescript-pkgs = app-purescript.packages.${system};

      inherit (import ./.nix/data.nix)
        appPurescript
        appPython
        ;

      configWriters =
        (import ./.nix/write-configs.nix
          {
            inherit
              my-json2md
              system
              codiumTools
              pkgs
              commands
              ;
          }
        );


      updateFlakes = pkgs.writeShellScriptBin "update-flakes" ''
        (cd ${appPython} && nix flake update)
        (cd ${appPurescript} && nix flake update)
        nix flake update
      '';

      commands = import ./.nix/commands.nix { inherit pkgs writeShellApplicationUnchecked; };

      codiumDependencies =
        (mergeValues { inherit (shellTools) nix purescript; }) //
        { inherit (pkgs) docker poetry; };
      otherTools = {
        inherit updateFlakes;
      } // (mergeValues commands) // configWriters;
      codiumWithExtensions = mkCodium {
        inherit (extensions) nix markdown purescript github misc docker python toml;
      };
      codium =
        writeShellApplicationUnchecked {
          name = "start-codium";
          runtimeInputs = [
            codiumWithExtensions
            (builtins.attrValues codiumDependencies)
            (builtins.attrValues otherTools)
          ];
          text = ''
            codium .
          '';
        };
    in
    {
      packages = {
        default = codium;
      } // otherTools // codiumDependencies;
      devShells = {
        default = pkgs.mkShell {
          buildInputs = builtins.attrValues otherTools;
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
