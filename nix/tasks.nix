{ appName
, shellNames
, langs
}:
let
  tasksLang = lang:
    let
      name = appName lang;
      commandTemplate = { lang, action, devShell }:
        {
          command = "nix";
          args = [
            "develop"
            ".#${devShell}"
          ];
          label = "${action} ${name}";
          options = {
            cwd = "\${workspaceFolder}";
          };
        };
      sh = shellNames lang;
      args = [
        {
          action = "Run";
          devShell = sh.app-lang;
        }
        {
          action = "Docker run";
          devShell = sh.app-lang-docker-run;
        }
        {
          action = "Docker remove";
          devShell = sh.app-lang-docker-rm;
        }
      ];
    in
    builtins.map (x: commandTemplate (x // { inherit lang; })) args;
  tasks = builtins.concatMap tasksLang langs;
  tasksNix = {
    presentation = {
      panel = "new";
      reveal = "always";
    };
    version = "2.0.0";
    inherit tasks;
  };
in
tasksNix
