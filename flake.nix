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
        extensions
        mkCodium
        writeJson
        writeShellApplicationUnchecked
        ;

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

      codium = mkCodium {
        inherit (extensions) nix markdown purescript github misc docker python toml;
      };

      poetryInstall = writeShellApplicationUnchecked {
        name = "poetry-install";
        runtimeInputs = [ pkgs.poetry ];
        text = ''poetry install'';
      };

      updateFlakes = pkgs.writeShellScriptBin "update-flakes" ''
        (cd ${appPython} && nix flake update)
        (cd ${appPurescript} && nix flake update)
        nix flake update
      '';

      commands = import ./.nix/commands.nix { inherit pkgs writeShellApplicationUnchecked; };

      startCodium = writeShellApplicationUnchecked {
        name = "start-codium";
        runtimeInputs = [ codium ];
        text = "codium .";
      };
      codiumWithConfigs = writeShellApplicationUnchecked {
        name = "codium-with-configs";
        runtimeInputs = [
          codium
          tools
          (builtins.attrValues otherTools)
          (builtins.attrValues commands)
        ];
        text = ''
          write-configs
          poetry-install
          codium .
        '';
      };

      # necessary for VSCodium
      tools = (toList {
        inherit (shellTools) nix purescript;
      }) ++ [ pkgs.docker ];

      otherTools = {
        inherit (configWriters)
          writeDocs
          writeTasks
          writeSettings
          writeMarkdownlintConfig
          writeConfigs;
        inherit startCodium;
        inherit updateFlakes;
        inherit poetryInstall;
      } // commands;
    in
    {
      packages.default = codiumWithConfigs;
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
