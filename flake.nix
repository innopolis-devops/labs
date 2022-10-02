{
  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    nix-vscode-marketplace.follows = "my-inputs/nix-vscode-marketplace";
    # app-purescript.url = path:./app_purescript;
    app-python.url = "github:br4ch1st0chr0n3/devops-labs/lab2?dir=app_python";
    # app-python.url = path:./app_python;
    app-purescript.url = "github:br4ch1st0chr0n3/devops-labs/lab2?dir=app_purescript";
    json2md.follows = "my-inputs/json2md";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    env2json.follows = "my-inputs/env2json";
    my-codium.follows = "my-inputs/my-codium";
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , my-codium
    , my-inputs
    , json2md
    , app-purescript
    , app-python
    , nix-vscode-marketplace
    , env2json
    , flake-compat
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
        mkShellApp
        mkShellApps
        mergeValues
        mkDevShellsWithDefault
        mkFlakesUtils
        flakesToggleRelativePaths
        pushToGithub
        mkBin
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
              json2md
              system
              codiumTools
              pkgs
              commands
              env2json
              ;
          }
        );

      commands = import ./.nix/commands.nix {
        inherit pkgs mkShellApp;
        scripts = {
          ${langPurescript} = app-purescript.scripts.${system};
          ${langPython} = app-python.scripts.${system};
        };
      };

      rootDir = ./.;
      dirs = [ appPurescript appPython ];
      flakesUtils = mkFlakesUtils [ appPurescript appPython "." ];

      flakesToggleRelativePaths_ =
        let
          appPython = "app-python";
          appPurescript = "app-purescript";
          toggleConfig = [
            { "." = [ appPython appPurescript ]; }
          ];
        in
        flakesToggleRelativePaths toggleConfig flakesUtils.flakesUpdate;


      codium = mkCodium {
        extensions = { inherit (extensions) nix markdown purescript github misc docker python toml; };
        runtimeDependencies = [
          (toList
            (
              { inherit (shellTools) nix purescript docker; }
              //
              commands
            )
          )
          flakesToggleRelativePaths_
          (
            builtins.attrValues (
              {
                inherit (pkgs) docker poetry direnv lorri inotify-tools;
                inherit (pkgs.python310Packages) python-dotenv;
              }
              //
              flakesUtils
              //
              configWriters
            )
          )
        ];
      };

      scripts = mkShellApps {
        lintDockerfiles = {
          text = let dockerFile = "Dockerfile"; in
            pkgs.lib.strings.concatMapStringsSep
              ''printf "\n" ; ''
              (dir: '' ( printf "${dir}:\n" ; hadolint ${dir}/${dockerFile});'')
              [ appPython appPurescript ];
        };
        reload = {
          text = ''
            nix develop .#"$1" -c bash -c "exit"
            # echo 4
            exit
          '';
        };
      };

      devShells =
        (mkDevShellsWithDefault
          {
            # binaries that we need to test and can't yet include as a part of codium
            # if they gets here, they will overwrite the stuff from codium
            buildInputs = [
              (builtins.attrValues scripts)
              pkgs.haskell-language-server
            ];
          }
          {
            fish = {
              buildInputs = [
                (builtins.attrValues scripts)
              ];
            };
          }
        );
    in
    {
      inherit devShells;
      packages = {
        default = codium;
        lint = scripts.lintDockerfiles;
        pushToCachix = flakesUtils.flakesPushToCachix;
        updateLocks = flakesUtils.flakesUpdate;
        format = flakesUtils.flakesFormat;
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


