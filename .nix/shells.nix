{ pkgs }:
let
  inherit (import ./data.nix)
    dockerPorts
    langs
    appName
    shellNames
    ;
  mkShells = lang: port:
    let
      sh = shellNames lang;
      appName_ = appName lang;
      dir_ = appName_;
      port_ = builtins.toString port;
      portInternal = "80";
    in
    {
      "${sh.run}" = pkgs.mkShell {
        shellHook = ''
          (cd ${dir_} && nix develop .#dev)
        '';
      };
      "${sh.dockerBuild}" = pkgs.mkShell {
        shellHook = ''
          # nix develop -c bash -c '
            docker build -t ${dir_} ${appName_}
          # '
        '';
      };
      "${sh.dockerRun}" = pkgs.mkShell {
        shellHook = ''
          nix develop .#${sh.dockerBuild} -c bash -c '
            docker run -d --name ${appName_} -p ${port_}:${portInternal} ${dir_}
            docker container logs -f ${appName_}
          '
        '';
      };
      "${sh.dockerStop}" = pkgs.mkShell {
        shellHook = ''
          # nix develop -c bash -c '
            docker stop ${appName_}
            docker rm ${appName_}
          # '
        '';
      };
    };
  shells =
    let
      inherit (pkgs.lib.lists) zipListsWith foldl';
      inherit (pkgs.lib.trivial) mergeAttrs;
    in
    foldl' mergeAttrs { } (zipListsWith mkShells langs dockerPorts);
in
shells
