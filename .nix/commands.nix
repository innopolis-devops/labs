{ pkgs, writeShellApplicationUnchecked }:
let
  inherit (import ./data.nix)
    dockerPorts
    langs
    appName
    commandNames
    serviceNames
    ;
  mkCommands = lang:
    let
      commandNames_ = commandNames.apps lang;
      appName_ = appName lang;
      dir_ = appName_;
      serviceNames_ = serviceNames.${lang};
      appWithDocker = name: dir: text: pkgs.writeShellApplication {
        text = ''
          cd ${dir_}
          ${text}
        '';
        inherit name;
        runtimeInputs = [ pkgs.docker ];
      };
    in
    {
      "${commandNames_.run}" = pkgs.writeShellApplication {
        text = ''
          cd ${dir_}
        '';
        name = commandNames_.run;
        # TODO get inputs from app flakes
        runtimeInputs = [ ];
      };
      "${commandNames_.dockerBuild}" = appWithDocker "${commandNames_.dockerBuild}" dir_ ''
        docker compose build ${serviceNames_.web}
      '';
      "${commandNames_.dockerRun}" = appWithDocker "${commandNames_.dockerRun}" dir_ ''
        docker compose up ${serviceNames_.web}
      '';
      "${commandNames_.dockerStop}" = appWithDocker "${commandNames_.dockerStop}" dir_ ''
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
