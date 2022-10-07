{ pkgs, mkShellApp, scripts, system, drv-tools }:
let
  inherit (import ./data.nix)
    dockerPorts
    langs
    commandNames
    serviceNames
    langPython
    langPurescript
    appName
    ;

  # we assume that the commands will start in the corresponding directories
  mkCommands = lang:
    let
      appName_ = appName lang;
      commandNames_ = commandNames.apps lang;
      serviceNames_ = serviceNames.${lang};
      appWithDocker = name: text: mkShellApp {
        inherit name text;
        runtimeInputs = [ pkgs.docker ];
      };
      rootEnv = "../.env";
      withEnvFile = ''
        set -a
        if [[ -f ${rootEnv} ]]
        then
          source ${rootEnv}
        fi
        set +a
      '';
      inherit (drv-tools.functions.${system}) mkBin;
    in
    {
      "${commandNames_.run}" =
        mkShellApp (
          {
            text = ''
              ${mkBin scripts.${lang}.run-start}
            '';
            name = commandNames_.run;
          }
        );
      "${commandNames_.dockerBuild}" = appWithDocker commandNames_.dockerBuild ''
        ${withEnvFile} docker compose build ${serviceNames_.web}
      '';
      "${commandNames_.dockerRun}" = appWithDocker commandNames_.dockerRun ''
        ${withEnvFile} docker compose up ${serviceNames_.web}
      '';
      "${commandNames_.dockerPush}" = appWithDocker commandNames_.dockerPush ''
        ${withEnvFile} docker compose push ${serviceNames_.web}
      '';
      "${commandNames_.dockerPull}" = appWithDocker commandNames_.dockerPull ''
        ${withEnvFile} docker compose pull
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
