{
  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    my-codium.follows = "my-inputs/my-codium";
    nix-vscode-marketplace.follows = "my-inputs/nix-vscode-marketplace";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , my-codium
    , my-inputs
    , nix-vscode-marketplace
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (my-codium.tools.${system})
        writeSettingsJson
        writeTasksJson
        settingsNix
        toList
        shellTools
        codium
        ;

      appPython = "app_python";
      appPurescript = "app_purescript";

      tasksNix = import ./nix/tasks.nix {
        inherit langs appName shellNames;
      };

      writeSettings = writeSettingsJson (import ./nix/settings.nix { inherit settingsNix appPurescript; });
      writeTasks = writeTasksJson tasksNix;

      tools = (toList {
        inherit (shellTools) nix purescript;
      }) ++ (builtins.attrValues {
        inherit (pkgs) docker;
      });

      codiumWithSettings = pkgs.mkShell {
        buildInputs = [ writeSettings writeTasks codium ];
        shellHook = ''
          write-settings-json
          write-tasks-json
          codium .
        '';
      };

      # app name coincides with app dir
      dir = lang: "app_${lang}";
      appName = dir;

      dockerPorts = [ 8002 8003 ];
      langs = [ "python" "purescript" ];

      shellNames = lang:
        {
          app-lang = "app-${lang}";
          app-lang-docker-build = "app-${lang}-docker-build";
          app-lang-docker-run = "app-${lang}-docker-run";
          app-lang-docker-rm = "app-${lang}-docker-rm";
        };

      shells = import ./nix/shells.nix {
        inherit langs dockerPorts appName shellNames pkgs;
      };
    in
    {
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
          codium = codiumWithSettings;
        }
        // shells
      ;
      inherit tasksNix;
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
