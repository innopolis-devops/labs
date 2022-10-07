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
      inherit (drv-tools.functions.${system}) mkBin mkShellApps;
      mkAppsWithDocker = apps@{...}: mkShellApps (
        builtins.mapAttrs (name: app: app // { runtimeInputs = (app.runtimeInputs or []) ++ [ pkgs.docker ]; }) apps
      );
      mkAppsWithDocker_ = apps@{...}: mkAppsWithDocker (builtins.mapAttrs (name: text: { inherit text; }) apps);
      mkShellApps_ = apps@{...}: mkShellApps (builtins.mapAttrs (name: text: { inherit text; }) apps);
      rootEnv = "../.env";
      withEnvFile = ''
        set -a
        if [[ -f ${rootEnv} ]]
        then
          source ${rootEnv}
        fi
        set +a
      '';
    in
    (mkShellApps_
      {
        "${commandNames_.run}" = ''${mkBin scripts.${lang}.run-start}'';
        "${commandNames_.test}" = ''${mkBin scripts.${lang}.test}'';
      }
    ) //
    (mkAppsWithDocker_
      {
        "${commandNames_.dockerBuild}" = ''${withEnvFile} docker compose build ${serviceNames_.web}'';
        "${commandNames_.dockerRun}" = ''${withEnvFile} docker compose up ${serviceNames_.web}'';
        "${commandNames_.dockerPush}" = ''${withEnvFile} docker compose push ${serviceNames_.web}'';
        "${commandNames_.dockerPull}" = ''${withEnvFile} docker compose pull'';
        "${commandNames_.dockerStop}" = ''docker compose stop'';
      }
    );
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
