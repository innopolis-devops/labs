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
, python-tools
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
            inherit (pkgs)
              docker poetry direnv lorri inotify-tools
              rnix-lsp nixpkgs-fmt dhall-lsp-server
              geckodriver;
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
          ${concatMapStringsSep
            ''printf "\n" ; ''
            (dir: '' ( printf "${framedBrackets "linting in ${dir}"}" ; hadolint ${dir}/${dockerFile});'')
            dirs
          }'';
        longDescription = ''
          Lint ${dockerFile}s in ${concatStringsSep ", " dirs}'';
      };
  })
  // {
    inherit desc;
    createVenvs = python-tools.functions.${system}.createVenvs [ appPython appPurescript "." ];
  };

  devShells =
    (mkDevShellsWithDefault
      {
        shellHook = python-tools.snippets.${system}.activateVenv;
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
