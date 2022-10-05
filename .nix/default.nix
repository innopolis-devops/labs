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
    inherit pkgs mkShellApp;
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
    extensions = { inherit (extensions) nix markdown purescript github misc docker python toml fish; };
    runtimeDependencies = [
      (toList commands)
      flakesToggleRelativePaths_
      (
        builtins.attrValues (
          {
            inherit (pkgs) docker poetry direnv lorri inotify-tools;
            inherit (pkgs.python310Packages) python-dotenv;
            inherit (pkgs) rnix-lsp;
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

  scripts = mkShellApps {
    lintDockerfiles =
      let
        dockerFile = "Dockerfile";
        dirs = [ appPython appPurescript ];
        inherit (pkgs.lib.strings) concatMapStringsSep concatStringsSep;
      in
      {
        text =
          concatMapStringsSep
            ''printf "\n" ; ''
            (dir: '' ( printf "${dir}:\n" ; ${mkBin pkgs.hadolint} ${dir}/${dockerFile});'')
            dirs;
        longDescription = ''Lint ${dockerFile}s in ${concatStringsSep ", " dirs}'';
      };
  };

  devShells =
    (mkDevShellsWithDefault
      {
        # binaries that we need to test and can't yet include as a part of codium
        # if they gets here, they will overwrite the stuff from codium
        buildInputs = [
          (builtins.attrValues (scripts // flakesUtils))
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
  inherit devShells scripts codium flakesUtils flakesToggleRelativePaths_;
}
