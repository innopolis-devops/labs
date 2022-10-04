{ nixpkgs
, system
, my-codium
, json2md
, env2json
, app-python
, app-purescript
, rootDir
}:
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
          codiumTools
          pkgs
          commands
          env2json
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
  inherit devShells scripts codium flakesUtils;
}
