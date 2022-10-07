{ nixpkgs
, system
, my-codium
, json2md
, env2json
, app-python
, app-purescript
, rootDir
, drv-tools
, flake-tools
, easy-purescript-nix
}:
let
  pkgs = nixpkgs.legacyPackages.${system};
  inherit (my-codium.functions.${system})
    mkCodium
    ;
  inherit (my-codium.configs.${system})
    extensions
    ;
  inherit (drv-tools.functions.${system})
    toList
    mkShellApp
    mkShellApps
    mkDevShellsWithDefault
    mkBin
    framedBrackets
    ;
  inherit (drv-tools.packages.${system})
    desc
    ;
  inherit (flake-tools.functions.${system})
    mkFlakesUtils
    flakesToggleRelativePaths
    ;

  inherit (import ./data.nix)
    appPurescript
    appPython
    langPurescript
    langPython
    ;

  configWriters =
    (import ./write-configs.nix
      {
        inherit
          json2md
          system
          pkgs
          commands
          env2json
          drv-tools
          my-codium
          ;
      }
    );

  commands = import ./commands.nix {
    inherit pkgs mkShellApp system drv-tools;
    scripts = {
      ${langPurescript} = app-purescript.scripts.${system};
      ${langPython} = app-python.scripts.${system};
    };
  };

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
    extensions = {
      inherit (extensions)
        nix markdown purescript github misc docker python toml fish yaml;
    };
    runtimeDependencies = [
      (toList commands)
      flakesToggleRelativePaths_
      (
        builtins.attrValues (
          {
            inherit (pkgs) docker poetry direnv lorri inotify-tools;
            inherit (pkgs) rnix-lsp nixpkgs-fmt;
            inherit (pkgs.haskellPackages) hadolint;
          }
          //
          flakesUtils
          //
          configWriters
        )
      )
    ];
  };

  inherit (app-python.configs.${system}) activateVenv;

  scripts = (mkShellApps {
    lintDockerfiles =
      let
        dockerFile = "Dockerfile";
        dirs = [ appPython appPurescript ];
        inherit (pkgs.lib.strings) concatMapStringsSep concatStringsSep;
      in
      {
        runtimeInputs = [ pkgs.haskellPackages.hadolint ];
        text = ''
          set +e
        ''
        +
        (concatMapStringsSep
          ''printf "\n" ; ''
          (dir: '' ( printf "${framedBrackets "linting in ${dir}"}" ; hadolint ${dir}/${dockerFile});'')
          dirs
        );
        longDescription = ''
          Lint ${dockerFile}s in ${concatStringsSep ", " dirs}'';
      };
    createVenvs = {
      text =
        let createMessage = ''printf "${framedBrackets "creating environment in $PWD"}"''; in
        ''
          ${createMessage}
          ${activateVenv}
          poetry install --no-root
          cd ${appPython}
          ${createMessage}
          ${activateVenv}
          poetry install --no-root
        '';
      runtimeInputs = [ pkgs.poetry ];
      longDescription = ''
        Create `.venv`s for `Python` environments in $PROJECT_ROOT and ${appPython}.

        Please, run this from your $PROJECT_ROOT! A couple of times if anything goes wrong :)
      '';
    };
  })
  // { inherit desc; };

  devShells =
    (mkDevShellsWithDefault
      {
        shellHook = ''${app-python.configs.${system}.activateVenv}'';
        # binaries that we need to test and can't yet include as a part of codium
        # if they gets here, they will overwrite the stuff from codium
        buildInputs = [
          (builtins.attrValues (scripts // flakesUtils // commands.apps))
          pkgs.haskell-language-server
        ];
      }
      {
        fish = { };
      }
    );
in
{
  inherit devShells scripts codium flakesUtils flakesToggleRelativePaths_ configWriters desc commands;
}
