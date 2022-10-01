{ pkgs, mkShellApp, scripts }:
let
  inherit (import ./data.nix)
    dockerPorts
    langs
    commandNames
    serviceNames
    langPython
    langPurescript
    ;

  # we assume that the commands will start in the corresponding directories
  mkCommands = lang:
    let
      commandNames_ = commandNames.apps lang;
      serviceNames_ = serviceNames.${lang};
      appWithDocker = name: text: mkShellApp {
        inherit name text;
        runtimeInputs = [ pkgs.docker ];
      };
    in
    {
      "${commandNames_.run}" =
        let
          pythonStart = scripts.${langPython}.run-start;
          purescriptStart = scripts.${langPurescript}.run-start;
          runtimeInputs = {
            "${langPython}" = [ pythonStart ];
            "${langPurescript}" = [ purescriptStart ];
          };
          text = {
            "${langPython}" = pythonStart.name;
            "${langPurescript}" = purescriptStart.name;
          };
        in
        mkShellApp (
          {
            text = ''
              ${text.${lang}}
            '';
            name = commandNames_.run;
            runtimeInputs = runtimeInputs.${lang};
          }
        );
      "${commandNames_.dockerBuild}" = appWithDocker commandNames_.dockerBuild ''
        docker compose build ${serviceNames_.web}
      '';
      "${commandNames_.dockerRun}" = appWithDocker commandNames_.dockerRun ''
        docker compose up ${serviceNames_.web}
      '';
      "${commandNames_.dockerStop}" = appWithDocker commandNames_.dockerStop ''
        docker compose stop
      '';
    };
  commands = {
    apps =
      let
        inherit (pkgs.lib.attrsets) foldAttrs;
        inherit (builtins) map;
      in
      foldAttrs (n: acc: n) { } (map mkCommands langs);
  };
in
commands
