{
  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    my-codium.follows = "my-inputs/my-codium";
    my-json2md.follows = "my-inputs/json2md";
    nix-vscode-marketplace.follows = "my-inputs/nix-vscode-marketplace";
    app-python.url = path:./app_python;
    app-purescript.url = path:./app_purescript;
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
        writeShellApp
        mergeValues
        mkDevShellsWithDirenv
        ;

      app-python-pkgs = app-python.packages.${system};
      app-purescript-pkgs = app-purescript.packages.${system};

      inherit (import ./.nix/data.nix)
        appPurescript
        appPython
        langPurescript
        langPython
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


      updateFlakes = writeShellApp {
        name = "update-flakes";
        text = ''
          (cd ${appPython} && nix flake update)
          (cd ${appPurescript} && nix flake update)
          nix flake update
        '';
      };

      commands = import ./.nix/commands.nix {
        inherit pkgs writeShellApp;
        scripts = {
          ${langPurescript} = app-purescript.scripts.${system};
        };
      };

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
        writeShellApp {
          name = "codium-2";
          runtimeInputs = [
            codiumWithExtensions
            (builtins.attrValues codiumDependencies)
            (builtins.attrValues otherTools)
          ];
          text = ''
            codium .
          '';
        };

      devShells = mkDevShellsWithDirenv
        {
          runtimeInputs = [ updateFlakes (builtins.attrValues (mergeValues commands)) ];
        }
        {
          codium = { runtimeInpus = [ codium ]; };
          codiumTools = { runtimeInputs = [ (builtins.attrValues codiumDependencies) ]; };
        };
    in
    {
      packages = devShells;
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
