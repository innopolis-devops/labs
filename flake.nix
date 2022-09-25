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

      codium = mkCodium {
        inherit (extensions) nix markdown purescript github misc docker python toml;
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
      codiumWithConfigs =
        let
          inherit (otherTools) writeConfigs writeRootPyproject;
        in
        writeShellApplicationUnchecked {
          name = "codium-with-configs";
          runtimeInputs = [
            codium
            tools
            (builtins.attrValues otherTools)
            (builtins.attrValues commands)
          ];
          text = ''
            ${writeConfigs.name}
            ${writeRootPyproject.name}
            ${startCodium.name}
          '';
        };

      # necessary for VSCodium
      tools = (toList {
        inherit (shellTools) nix purescript;
      }) ++ [ pkgs.docker pkgs.poetry ];

      otherTools = {
        inherit (configWriters)
          writeDocs
          writeTasks
          writeSettings
          writeMarkdownlintConfig
          writeConfigs
          writeRootPyproject
          ;
        inherit startCodium;
        inherit updateFlakes;
      } // commands;
    in
    {
      packages = {
        default = codiumWithConfigs;
      } // otherTools;
      devShells.default = pkgs.mkShell {
        buildInputs = tools;
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
