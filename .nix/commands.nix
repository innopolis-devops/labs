{ pkgs, writeShellApp, scripts }:
let
  inherit (import ./data.nix)
    dockerPorts
    langs
    appName
    commandNames
    serviceNames
    langPython
    langPurescript
    ;
  mkCommands = lang:
    let
      commandNames_ = commandNames.apps lang;
      appName_ = appName lang;
      dir_ = appName_;
      # TODO use commandNames - compliant fields instead of just web
      serviceNames_ = serviceNames.${lang};
      appWithDocker = name: dir: text: writeShellApp {
        text = ''
          cd ${dir_}

          ${text}
        '';
        inherit name;
        runtimeInputs = [ pkgs.docker ];
      };
    in
    {
      "${commandNames_.run}" =
        let
          runtimeInputs = {
            "${langPython}" = [ "#! /bin/bash echo hi" ];
            "${langPurescript}" = [ pursStart ];
          };
          pursStart = scripts.${langPurescript}.run-start;
          text = {
            "${langPython}" = "echo py\n";
            "${langPurescript}" = "${pursStart.name}";
          };
        in
        writeShellApp (
          {
            text = ''
              cd ${dir_}

              ${text.${lang}}
            '';
            name = commandNames_.run;
            runtimeInputs = runtimeInputs.${lang};
          }
        );
      "${commandNames_.dockerBuild}" = appWithDocker commandNames_.dockerBuild dir_ ''
        docker compose build ${serviceNames_.web}
      '';
      "${commandNames_.dockerRun}" = appWithDocker commandNames_.dockerRun dir_ ''
        docker compose up ${serviceNames_.web}
      '';
      "${commandNames_.dockerStop}" = appWithDocker commandNames_.dockerStop dir_ ''
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
