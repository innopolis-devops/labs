{
  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    my-codium.follows = "my-inputs/my-codium";
    my-json2md.url = "github:br4ch1st0chr0n3/flakes?dir=json2md";
    nix-vscode-marketplace.follows = "my-inputs/nix-vscode-marketplace";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , my-codium
    , my-inputs
    , my-json2md
    , nix-vscode-marketplace
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      codiumTools = my-codium.tools.${system};
      inherit (codiumTools)
        writeSettingsJson
        writeTasksJson
        settingsNix
        toList
        shellTools
        codium
        writeJson
        writeShellApplicationUnchecked
        ;

      tools = (toList {
        inherit (shellTools) nix purescript;
      }) ++ (builtins.attrValues {
        inherit (pkgs) docker nodejs-16_x;
      });

      inherit (import ./.nix/data.nix { inherit pkgs; })
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
              ;
          }
        );

      codiumWithConfigs =
        pkgs.mkShell {
          buildInputs = [
            codium
            configWriters.writeConfigs
          ];
          shellHook = ''
            write-configs
            codium .
          '';
        };

      shells = import ./.nix/shells.nix { inherit pkgs; };
    in
    {
      packages = {
        inherit (configWriters)
          writeDocs
          writeTasks
          writeSettings
          writeMarkdownlintConfig
          writeConfigs;
      };
      devShells =
        {
          default = pkgs.mkShell {
            name = "dev-tools";
            buildInputs = tools;
          };
          update-flakes = pkgs.mkShell {
            name = "update-dev-shells";
            shellHook = ''
              (cd ${appPython} && nix flake update)
              (cd ${appPurescript} && nix flake update)
              nix flake update
            '';
          };
          codium = codiumWithConfigs;
        }
        // shells
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
