{ nixpkgs
, system
, my-codium
, json2md
, env2json
, app-python
, app-purescript
, rootDir
, drv-tools
, flakes-tools
, easy-purescript-nix
, python-tools
, terrafix
, my-devshell
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
  inherit (flakes-tools.functions.${system})
    mkFlakesTools
    ;

  inherit (import ./data.nix)
    appPurescript
    appPython
    langPurescript
    langPython
    ;

  inherit (builtins) map attrValues;

  configWriters =
    (import ./write-configs.nix
      {
        inherit
          json2md system pkgs commands terrafix
          env2json drv-tools my-codium
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
  flakesTools = mkFlakesTools [ appPurescript appPython "." ];

  codium = mkCodium {
    extensions = {
      inherit (extensions)
        nix markdown purescript github misc docker python toml fish yaml terraform;
    };
    runtimeDependencies = [
      (toList commands)
      (
        attrValues (
          {
            inherit (pkgs)
              docker poetry direnv lorri inotify-tools
              rnix-lsp nixpkgs-fmt dhall-lsp-server
              geckodriver;
            inherit (pkgs.haskellPackages) hadolint;
          }
          //
          flakesTools
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
        longDescription = ''Lint ${dockerFile}s in ${concatStringsSep ", " dirs}'';
      };
    monitor = {
      name = "monitor";
      text = ''
        set -a
        source .env
        cd monitoring
        source configs/datasources/.env
        docker compose up
      '';
      longDescription = "monitor via Prometheus";
    };
  })
  // {
    createVenvs = python-tools.functions.${system}.createVenvs [ appPython appPurescript "." ];
  };
  devshell = my-devshell.devshell.${system};
  packages = (attrValues (scripts //  configWriters // flakesTools // commands.apps));
  devShells.default = devshell.mkShell
    {
      packages = packages;
      bash.extra = python-tools.snippets.${system}.activateVenv;
      commands = map
        (x: {
          name = x.name + " ";
          category = "scripts";
          help = x.meta.description;
        })
        packages;
    }
  ;
in
{
  inherit devShells scripts codium flakesTools configWriters commands;
}
